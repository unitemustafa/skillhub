import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/widgets/app_back_button.dart';
import 'package:skillhub/core/widgets/app_surface_card.dart';
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
              AppSurfaceCard(
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: AppColors.accentBlueSoft,
                          child: Text(
                            '8.2',
                            style: TextStyle(
                              color: AppColors.accentBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'تقييم يونيو 2026',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'جيد جدًا • كابتن أحمد',
                                style: TextStyle(
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
                              builder: (_) => EvaluationsPage(player: player),
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
                          side: const BorderSide(color: AppColors.accentBlue),
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
    if (confirmed == true && context.mounted) Navigator.pop(context, true);
  }
}
