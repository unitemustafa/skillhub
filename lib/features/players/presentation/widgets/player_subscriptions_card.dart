import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/sync/session_service.dart';
import 'package:skillhub/core/sync/sync_service.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/utils/snackbar_utils.dart';
import 'package:skillhub/core/widgets/app_surface_card.dart';

import 'package:skillhub/features/players/domain/models/player_summary.dart';
import 'package:skillhub/features/players/presentation/pages/new_subscription_page.dart';
import 'package:skillhub/features/players/presentation/pages/subscription_history_page.dart';
import 'package:skillhub/features/subscriptions/data/subscriptions_repository.dart';

class PlayerSubscriptionsCard extends StatefulWidget {
  const PlayerSubscriptionsCard({super.key, required this.player});

  final PlayerSummary player;

  @override
  State<PlayerSubscriptionsCard> createState() =>
      _PlayerSubscriptionsCardState();
}

class _PlayerSubscriptionsCardState extends State<PlayerSubscriptionsCard> {
  final _repository = SubscriptionsRepository();
  final _sessionService = SessionService();
  final _syncService = SyncService();
  bool _isRenewing = false;

  Future<void> _renewSubscription() async {
    if (_isRenewing) return;
    setState(() => _isRenewing = true);
    try {
      final session = await _sessionService.readLastSession();
      if (session == null || session.isExpired) {
        throw Exception(
          'يلزم تسجيل الدخول عبر الإنترنت أولًا قبل استخدام الوضع المحلي.',
        );
      }
      final endDate = await _repository.renewSubscription(
        session,
        widget.player,
      );
      final synced = await _trySync();
      if (!mounted) return;
      SnackbarUtils.showSuccess(
        context,
        synced
            ? 'تم تجديد الاشتراك حتى ${_formatDate(endDate)} وتمت المزامنة.'
            : 'تم تجديد الاشتراك حتى ${_formatDate(endDate)} وسيتم المزامنة تلقائيًا.',
      );
    } catch (error) {
      if (!mounted) return;
      SnackbarUtils.showError(context, error.toString());
    } finally {
      if (mounted) {
        setState(() => _isRenewing = false);
      }
    }
  }

  Future<bool> _trySync() async {
    try {
      await _syncService.syncNow();
      return true;
    } catch (_) {
      return false;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildSectionTitle('الاشتراكات'),
        const SizedBox(height: 12),
        AppSurfaceCard(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NewSubscriptionPage(player: widget.player),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        decoration: BoxDecoration(
                          color: AppColors.accentBlue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Column(
                          children: [
                            Text(
                              'اشتراك\nجديد',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 8),
                            Icon(Iconsax.card_add, color: AppColors.white),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SubscriptionHistoryPage(player: widget.player),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(color: AppColors.accentBlue),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Column(
                          children: [
                            Text(
                              'سجل\nالاشتراكات',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.accentBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 8),
                            Icon(Iconsax.clock, color: AppColors.accentBlue),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _isRenewing ? null : _renewSubscription,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.navy,
                    disabledBackgroundColor: AppColors.navy.withValues(
                      alpha: 0.65,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: _isRenewing
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Icon(Iconsax.refresh, color: AppColors.white),
                  label: const Text(
                    'تجديد الاشتراك',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
}
