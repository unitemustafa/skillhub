import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/sync/session_service.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/utils/snackbar_utils.dart';
import 'package:skillhub/core/widgets/app_back_button.dart';
import 'package:skillhub/core/widgets/app_surface_card.dart';
import 'package:skillhub/features/evaluations/data/evaluations_repository.dart';
import 'package:skillhub/features/evaluations/domain/models/evaluation_record.dart';
import 'package:skillhub/features/evaluations/presentation/pages/evaluation_details_page.dart';
import 'package:skillhub/features/players/data/players_repository.dart';
import 'package:skillhub/features/players/domain/models/player_summary.dart';
import 'package:skillhub/features/players/presentation/pages/new_evaluation_page.dart';
import 'package:skillhub/features/players/presentation/pages/player_form_page.dart';
import 'package:skillhub/features/evaluations/presentation/pages/evaluations_page.dart';
import 'package:skillhub/features/players/presentation/widgets/player_communication_section.dart';
import 'package:skillhub/features/players/presentation/widgets/player_info_section.dart';
import 'package:skillhub/features/players/presentation/widgets/player_profile_header.dart';
import 'package:skillhub/features/players/presentation/widgets/player_subscriptions_card.dart';

class PlayerDetailsPage extends StatelessWidget {
  const PlayerDetailsPage({super.key, required this.player});

  final PlayerSummary player;
  static final _playersRepository = PlayersRepository();
  static final _evaluationsRepository = EvaluationsRepository();
  static final _sessionService = SessionService();

  Future<EvaluationRecord?> _loadLatestEvaluation() async {
    final session = await _sessionService.readLastSession();
    if (session == null || session.isExpired) {
      return null;
    }
    final records = await _evaluationsRepository.listEvaluations(
      session,
      playerId: player.id,
    );
    return records.isEmpty ? null : records.first;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          leading: const AppBackButton(),
          title: Text(
            'تفاصيل اللاعب',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                Iconsax.edit,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              tooltip: 'تعديل اللاعب',
              onPressed: () async {
                await Navigator.push<bool>(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PlayerFormPage(player: player),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Iconsax.trash, color: AppColors.red),
              tooltip: 'حذف اللاعب',
              onPressed: () => _confirmDelete(context),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PlayerProfileHeader(player: player),
              const SizedBox(height: 24),
              PlayerInfoSection(player: player),
              const SizedBox(height: 24),
              PlayerSubscriptionsCard(player: player),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSectionTitle('آخر تقييم'),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EvaluationsPage(player: player),
                      ),
                    ),
                    child: const Text('عرض السجل'),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              FutureBuilder<EvaluationRecord?>(
                future: _loadLatestEvaluation(),
                builder: (context, snapshot) {
                  final record = snapshot.data;
                  return AppSurfaceCard(
                    child: Column(
                      children: [
                        if (snapshot.connectionState == ConnectionState.waiting)
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 18),
                            child: CircularProgressIndicator(),
                          )
                        else if (record == null)
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              'لا توجد تقييمات لهذا اللاعب حتى الآن',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: AppColors.textSecondary),
                            ),
                          )
                        else
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: AppColors.accentBlueSoft,
                                child: Text(
                                  record.average.toStringAsFixed(1),
                                  style: const TextStyle(
                                    color: AppColors.accentBlue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'تقييم ${record.date}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${_ratingLabel(record.average)} • ${record.coach.isEmpty ? 'بدون مدرب' : record.coach}',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => EvaluationDetailsPage(
                                      player: player,
                                      record: record,
                                    ),
                                  ),
                                ),
                                icon: const Icon(Iconsax.arrow_left_2),
                              ),
                            ],
                          ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NewEvaluationPage(player: player),
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: AppColors.accentBlue,
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            icon: const Icon(
                              Iconsax.chart_square,
                              color: AppColors.accentBlue,
                            ),
                            label: const Text(
                              'تقييم جديد',
                              style: TextStyle(
                                color: AppColors.accentBlue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              PlayerCommunicationSection(player: player),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.navy,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('حذف اللاعب'),
        content: Text(
          'هل تريد حذف ${player.name}؟ لا يمكن التراجع عن هذا الإجراء.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('حذف', style: TextStyle(color: AppColors.red)),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) {
      return;
    }

    final session = await _sessionService.readLastSession();
    if (session == null) {
      if (context.mounted) {
        SnackbarUtils.showError(context, 'يلزم تسجيل الدخول أولاً');
      }
      return;
    }

    await _playersRepository.deletePlayer(session, player);
    if (!context.mounted) {
      return;
    }
    SnackbarUtils.showSuccess(context, 'تم حذف اللاعب');
    Navigator.pop(context, true);
  }

  String _ratingLabel(double average) {
    if (average >= 9) return 'ممتاز';
    if (average >= 8) return 'جيد جدًا';
    if (average >= 6.5) return 'جيد';
    if (average >= 5) return 'مقبول';
    return 'يحتاج متابعة';
  }
}
