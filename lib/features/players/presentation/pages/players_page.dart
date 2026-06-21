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
  const PlayersPage({super.key, this.showBackButton = true});

  final bool showBackButton;

  @override
  State<PlayersPage> createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayersPage> {
  final _apiClient = ApiClient();
  final ValueNotifier<bool> _isFabVisible = ValueNotifier<bool>(true);
  int? _selectedBirthYear;
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

  List<PlayerSummary> _visiblePlayers(
    List<PlayerSummary> players,
    int? selectedBirthYear,
  ) {
    if (selectedBirthYear == null) {
      return players;
    }
    return players
        .where((player) => _birthYearOf(player) == selectedBirthYear)
        .toList(growable: false);
  }

  List<int> _availableBirthYears(List<PlayerSummary> players) {
    final years = players.map(_birthYearOf).whereType<int>().toSet().toList()
      ..sort((a, b) => b.compareTo(a));
    return years;
  }

  int? _effectiveSelectedBirthYear(List<int> availableBirthYears) {
    if (_selectedBirthYear == null ||
        !availableBirthYears.contains(_selectedBirthYear)) {
      return null;
    }
    return _selectedBirthYear;
  }

  int? _birthYearOf(PlayerSummary player) {
    final birthDate = player.birthDate;
    if (birthDate == null || birthDate.trim().isEmpty) {
      return null;
    }
    final parts = birthDate.split('/');
    if (parts.length == 3) {
      return int.tryParse(parts[2]);
    }
    return DateTime.tryParse(birthDate)?.year;
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
                final birthYears = _availableBirthYears(players);
                final selectedBirthYear = _effectiveSelectedBirthYear(
                  birthYears,
                );
                final visiblePlayers = _visiblePlayers(
                  players,
                  selectedBirthYear,
                );

                return CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: ClampingScrollPhysics(),
                  ),
                  cacheExtent: 700,
                  slivers: [
                    PlayersAppBar(
                      selectedBirthYear: selectedBirthYear,
                      availableBirthYears: birthYears,
                      showBackButton: widget.showBackButton,
                      onBirthYearChanged: (year) {
                        if (_selectedBirthYear == year) {
                          return;
                        }

                        setState(() => _selectedBirthYear = year);
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
