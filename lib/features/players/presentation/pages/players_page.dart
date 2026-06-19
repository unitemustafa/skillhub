import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/network/api_client.dart';
import 'package:skillhub/core/network/api_exception.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/utils/snackbar_utils.dart';
import 'package:skillhub/features/players/domain/models/player_summary.dart';
import 'package:skillhub/features/players/presentation/pages/player_form_page.dart';
import 'package:skillhub/features/players/presentation/widgets/player_card.dart';
import 'package:skillhub/features/players/presentation/widgets/players_app_bar.dart';

class PlayersPage extends StatefulWidget {
  const PlayersPage({super.key});

  @override
  State<PlayersPage> createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayersPage> {
  final _apiClient = ApiClient();
  final ValueNotifier<bool> _isFabVisible = ValueNotifier<bool>(true);
  PlayersAgeStage _selectedAgeStage = PlayersAgeStage.all;
  late Future<List<PlayerSummary>> _playersFuture;

  @override
  void initState() {
    super.initState();
    _playersFuture = _loadPlayers();
  }

  Future<List<PlayerSummary>> _loadPlayers() async {
    final response = await _apiClient.get('/players', query: {'limit': '100'});
    final items = response is Map<String, dynamic>
        ? response['items'] as List<dynamic>? ?? const []
        : const [];
    return items
        .whereType<Map<String, dynamic>>()
        .map(PlayerSummary.fromJson)
        .toList(growable: false);
  }

  Future<void> _refreshPlayers() async {
    setState(() {
      _playersFuture = _loadPlayers();
    });
    await _playersFuture;
  }

  List<PlayerSummary> _visiblePlayers(List<PlayerSummary> players) {
    return players
        .where((player) => _matchesSelectedAgeStage(player))
        .toList(growable: false);
  }

  bool _matchesSelectedAgeStage(PlayerSummary player) {
    if (_selectedAgeStage == PlayersAgeStage.all) {
      return true;
    }

    final age = _extractAge(player.ageLabel);
    if (age == null) {
      return false;
    }

    switch (_selectedAgeStage) {
      case PlayersAgeStage.all:
        return true;
      case PlayersAgeStage.buds:
        return age <= 9;
      case PlayersAgeStage.cubs:
        return age >= 10 && age <= 12;
      case PlayersAgeStage.juniors:
        return age >= 13 && age <= 15;
      case PlayersAgeStage.youth:
        return age >= 16;
    }
  }

  int? _extractAge(String ageLabel) {
    final match = RegExp(r'\d+').firstMatch(ageLabel);
    if (match == null) {
      return null;
    }

    return int.tryParse(match.group(0)!);
  }

  @override
  void dispose() {
    _isFabVisible.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.forward) {
              if (!_isFabVisible.value) {
                _isFabVisible.value = true;
              }
            } else if (notification.direction == ScrollDirection.reverse) {
              if (_isFabVisible.value) {
                _isFabVisible.value = false;
              }
            }

            return false;
          },
          child: RefreshIndicator(
            onRefresh: _refreshPlayers,
            child: FutureBuilder<List<PlayerSummary>>(
              future: _playersFuture,
              builder: (context, snapshot) {
                final players = snapshot.data ?? const <PlayerSummary>[];
                final visiblePlayers = _visiblePlayers(players);

                return CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  cacheExtent: 700,
                  slivers: [
                    PlayersAppBar(
                      selectedAgeStage: _selectedAgeStage,
                      onAgeStageChanged: (stage) {
                        if (_selectedAgeStage == stage) {
                          return;
                        }

                        setState(() => _selectedAgeStage = stage);
                      },
                    ),
                    if (snapshot.connectionState == ConnectionState.waiting)
                      const SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(child: CircularProgressIndicator()),
                      )
                    else if (snapshot.hasError)
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: _PlayersMessage(
                          icon: Iconsax.warning_2,
                          title: 'تعذر تحميل اللاعبين',
                          message: snapshot.error is ApiException
                              ? (snapshot.error! as ApiException).message
                              : 'حدث خطأ غير متوقع أثناء الاتصال بالخادم.',
                          actionLabel: 'إعادة المحاولة',
                          onAction: () {
                            setState(() {
                              _playersFuture = _loadPlayers();
                            });
                          },
                        ),
                      )
                    else if (visiblePlayers.isEmpty)
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: _PlayersMessage(
                          icon: Iconsax.user_search,
                          title: 'لا يوجد لاعبين',
                          message:
                              'لم يتم تسجيل لاعبين في هذه المرحلة حتى الآن.',
                          actionLabel: 'تحديث',
                          onAction: () {
                            setState(() {
                              _playersFuture = _loadPlayers();
                            });
                          },
                        ),
                      )
                    else
                      SliverPadding(
                        padding: const EdgeInsets.all(16),
                        sliver: SliverList.separated(
                          itemCount: visiblePlayers.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            return PlayerCard(
                              key: ValueKey(visiblePlayers[index].id),
                              player: visiblePlayers[index],
                            );
                          },
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
        floatingActionButton: ValueListenableBuilder<bool>(
          valueListenable: _isFabVisible,
          builder: (context, isVisible, child) {
            return AnimatedSlide(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOut,
              offset: isVisible ? Offset.zero : const Offset(0, 2),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeOut,
                opacity: isVisible ? 1 : 0,
                child: child,
              ),
            );
          },
          child: FloatingActionButton.extended(
            onPressed: () async {
              final saved = await Navigator.push<bool>(
                context,
                MaterialPageRoute(builder: (_) => const PlayerFormPage()),
              );
              if (saved == true && context.mounted) {
                SnackbarUtils.showSuccess(context, 'تم إضافة اللاعب بنجاح');
                setState(() {
                  _playersFuture = _loadPlayers();
                });
              }
            },
            backgroundColor: AppColors.accentBlue,
            elevation: 4,
            icon: const Icon(Icons.person_add_alt_1, color: AppColors.white),
            label: const Text(
              'إضافة لاعب',
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PlayersMessage extends StatelessWidget {
  const _PlayersMessage({
    required this.icon,
    required this.title,
    required this.message,
    required this.actionLabel,
    required this.onAction,
  });

  final IconData icon;
  final String title;
  final String message;
  final String actionLabel;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.mutedText, size: 42),
            const SizedBox(height: 14),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.65),
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 18),
            OutlinedButton(onPressed: onAction, child: Text(actionLabel)),
          ],
        ),
      ),
    );
  }
}
