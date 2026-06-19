import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/features/reports/presentation/pages/print_preview_page.dart';

class ReportOptionsBottomSheet extends StatelessWidget {
  const ReportOptionsBottomSheet({super.key, required this.reportTitle});

  final String reportTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: Theme.of(context).bottomSheetTheme.backgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.border,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'خيارات التقرير',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.navy,
            ),
          ),
          const SizedBox(height: 32),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PrintPreviewPage(reportTitle: reportTitle),
                ),
              );
            },
            leading: const Icon(Iconsax.eye, color: AppColors.textPrimary),
            title: const Text(
              'معاينة التقرير',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: const Icon(
              Iconsax.arrow_left_2,
              color: AppColors.textSecondary,
              size: 16,
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(Iconsax.share, color: AppColors.accentBlue),
            title: const Text(
              'مشاركة PDF',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
