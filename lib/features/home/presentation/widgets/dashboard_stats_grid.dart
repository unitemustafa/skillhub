import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/widgets/app_surface_card.dart';

class DashboardStats {
  const DashboardStats({
    required this.players,
    required this.activePlayers,
    required this.activeSubscriptions,
    required this.expiringSubscriptions,
    required this.evaluations,
    required this.income,
    required this.expenses,
    required this.balance,
    required this.unreadNotifications,
  });

  factory DashboardStats.fromJson(Map<String, dynamic> json) {
    return DashboardStats(
      players: _int(json['players']),
      activePlayers: _int(json['activePlayers']),
      activeSubscriptions: _int(json['activeSubscriptions']),
      expiringSubscriptions: _int(json['expiringSubscriptions']),
      evaluations: _int(json['evaluations']),
      income: _double(json['income']),
      expenses: _double(json['expenses']),
      balance: _double(json['balance']),
      unreadNotifications: _int(json['unreadNotifications']),
    );
  }

  final int players;
  final int activePlayers;
  final int activeSubscriptions;
  final int expiringSubscriptions;
  final int evaluations;
  final double income;
  final double expenses;
  final double balance;
  final int unreadNotifications;

  static int _int(dynamic value) => int.tryParse(value?.toString() ?? '') ?? 0;
  static double _double(dynamic value) =>
      double.tryParse(value?.toString() ?? '') ?? 0;
}

class DashboardStatsGrid extends StatelessWidget {
  const DashboardStatsGrid({super.key, required this.stats});

  final DashboardStats stats;

  @override
  Widget build(BuildContext context) {
    final items = <_StatItem>[
      _StatItem(
        'كل اللاعبين',
        '${stats.players}',
        Iconsax.profile_2user,
        AppColors.textSecondary,
      ),
      _StatItem(
        'لاعبين نشطين',
        '${stats.activePlayers}',
        Iconsax.chart_2,
        AppColors.green,
      ),
      _StatItem(
        'اشتراكات شغالة',
        '${stats.activeSubscriptions}',
        Iconsax.card,
        AppColors.accentBlueDark,
      ),
      _StatItem(
        'قربت تخلص',
        '${stats.expiringSubscriptions}',
        Iconsax.timer_1,
        AppColors.orange,
      ),
      _StatItem(
        'تقييمات الشهر',
        '${stats.evaluations}',
        Iconsax.star,
        AppColors.orange,
      ),
      _StatItem(
        'دخل الشهر',
        '${stats.income.toStringAsFixed(0)} جنيه',
        Iconsax.trend_up,
        AppColors.blue,
        true,
      ),
      _StatItem(
        'مصروفات الشهر',
        '${stats.expenses.toStringAsFixed(0)} جنيه',
        Iconsax.trend_down,
        AppColors.red,
        true,
      ),
      _StatItem(
        'تنبيهات جديدة',
        '${stats.unreadNotifications}',
        Iconsax.notification,
        AppColors.accentBlue,
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 260,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 132,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return AppSurfaceCard(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: item.color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(item.icon, color: item.color, size: 20),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.value,
                    style: TextStyle(
                      fontSize: item.compactValue ? 16 : 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _StatItem {
  const _StatItem(
    this.title,
    this.value,
    this.icon,
    this.color, [
    this.compactValue = false,
  ]);

  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final bool compactValue;
}
