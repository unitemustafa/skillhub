import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/utils/snackbar_utils.dart';
import 'package:skillhub/core/widgets/app_surface_card.dart';
import 'package:skillhub/features/evaluations/domain/models/evaluation_record.dart';
import 'package:skillhub/features/players/domain/models/player_summary.dart';

class EvaluationDetailsPage extends StatelessWidget {
  const EvaluationDetailsPage({
    super.key,
    required this.player,
    required this.record,
  });

  final PlayerSummary player;
  final EvaluationRecord record;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Iconsax.arrow_right_3),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('تفاصيل التقييم'),
          actions: [
            IconButton(
              onPressed: () => SnackbarUtils.showSuccess(
                context,
                'تم تجهيز ملخص التقييم للمشاركة',
              ),
              tooltip: 'مشاركة',
              icon: const Icon(Iconsax.share),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 760),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppSurfaceCard(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: AppColors.accentBlueSoft,
                          child: Text(
                            record.average.toStringAsFixed(1),
                            style: const TextStyle(
                              color: AppColors.accentBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                player.name,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${record.date} • ${record.coach}',
                                style: const TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.green.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'جيد جدًا',
                            style: TextStyle(
                              color: AppColors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppSurfaceCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'درجات المهارات',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 18),
                        ...record.scores.entries.map(
                          (entry) => Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(entry.key),
                                    Text(
                                      '${entry.value}/10',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.accentBlue,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 7),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: LinearProgressIndicator(
                                    value: entry.value / 10,
                                    minHeight: 7,
                                    backgroundColor: AppColors.border,
                                    color: _scoreColor(entry.value),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppSurfaceCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Iconsax.note,
                              color: AppColors.orange,
                              size: 19,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'ملاحظات المدرب',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          record.notes,
                          style: const TextStyle(
                            height: 1.7,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _scoreColor(int score) {
    if (score >= 8) return AppColors.green;
    if (score >= 6) return AppColors.accentBlue;
    return AppColors.orange;
  }
}
