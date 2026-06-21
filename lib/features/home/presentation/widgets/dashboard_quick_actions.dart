import 'package:flutter/material.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/widgets/app_surface_card.dart';

import 'package:iconsax/iconsax.dart';
import 'package:skillhub/features/reports/presentation/pages/reports_page.dart';
import 'package:skillhub/features/subscriptions/presentation/pages/subscriptions_page.dart';
import 'package:skillhub/features/finances/presentation/pages/finances_page.dart';

class DashboardQuickActions extends StatelessWidget {
  const DashboardQuickActions({
    super.key,
    required this.onPlayersTap,
    this.onSubscriptionsTap,
  });

  final VoidCallback onPlayersTap;
  final VoidCallback? onSubscriptionsTap;

  @override
  Widget build(BuildContext context) {
    final actions = [
      _QuickActionItem(
        title: 'اللاعبين',
        icon: Icons.sports_basketball,
        color: AppColors.accentBlueDark,
        onTap: onPlayersTap,
      ),
      _QuickActionItem(
        title: 'الاشتراكات',
        icon: Iconsax.card,
        color: AppColors.textSecondary,
        onTap:
            onSubscriptionsTap ??
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SubscriptionsPage()),
            ),
      ),
      _QuickActionItem(
        title: 'الفلوس',
        icon: Iconsax.money,
        color: AppColors.orange,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const FinancesPage()),
        ),
      ),
      _QuickActionItem(
        title: 'التقارير',
        icon: Iconsax.chart,
        color: AppColors.green,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ReportsPage()),
          );
        },
      ),
    ];

    return Row(
      children: [
        for (var index = 0; index < actions.length; index++) ...[
          Expanded(
            child: _QuickActionCard(
              title: actions[index].title,
              icon: actions[index].icon,
              color: actions[index].color,
              onTap: actions[index].onTap,
            ),
          ),
          if (index != actions.length - 1) const SizedBox(width: 8),
        ],
      ],
    );
  }
}

class _QuickActionItem {
  const _QuickActionItem({
    required this.title,
    required this.icon,
    required this.color,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;
}

class _QuickActionCard extends StatelessWidget {
  const _QuickActionCard({
    required this.title,
    required this.icon,
    required this.color,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppSurfaceCard(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 6),
      radius: 18,
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: color.withValues(alpha: 0.12),
            child: Icon(icon, color: color, size: 23),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
