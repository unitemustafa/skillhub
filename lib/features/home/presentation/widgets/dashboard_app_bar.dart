import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/network/api_client.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/widgets/app_blue_header_background.dart';
import 'package:skillhub/core/widgets/app_count_badge.dart';
import 'package:skillhub/features/evaluations/presentation/pages/evaluations_page.dart';
import 'package:skillhub/features/finances/presentation/pages/finances_page.dart';
import 'package:skillhub/features/notifications/presentation/pages/notifications_page.dart';
import 'package:skillhub/features/profile/presentation/pages/profile_page.dart';
import 'package:skillhub/features/reports/presentation/pages/reports_page.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({
    super.key,
    this.onNotificationsTap,
    this.onProfileTap,
  });

  final VoidCallback? onNotificationsTap;
  final VoidCallback? onProfileTap;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 226,
        child: _DashboardHeader(
          onNotificationsTap: onNotificationsTap,
          onProfileTap: onProfileTap,
        ),
      ),
    );
  }
}

class _DashboardHeader extends StatelessWidget {
  const _DashboardHeader({this.onNotificationsTap, this.onProfileTap});

  final VoidCallback? onNotificationsTap;
  final VoidCallback? onProfileTap;

  @override
  Widget build(BuildContext context) {
    return AppBlueHeaderBackground(
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (onProfileTap != null) {
                        onProfileTap!();
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const ProfilePage(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: AppColors.white.withValues(alpha: 0.22),
                        ),
                      ),
                      child: const Icon(
                        Iconsax.user,
                        color: AppColors.white,
                        size: 22,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'مساء الخير',
                          style: TextStyle(
                            color: AppColors.white.withValues(alpha: 0.74),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'مدير الأكاديمية',
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _HeaderIconButton(
                    icon: Iconsax.notification,
                    onTap: () {
                      if (onNotificationsTap != null) {
                        onNotificationsTap!();
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const NotificationsPage(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 22),
              const Text(
                'أقسام سريعة',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: _HeaderCategory(
                      label: 'تقييمات',
                      icon: Iconsax.star,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const EvaluationsPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: _HeaderCategory(
                      label: 'تقارير',
                      icon: Iconsax.chart,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const ReportsPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: _HeaderCategory(
                      label: 'الفلوس',
                      icon: Iconsax.money,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const FinancesPage(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  const _HeaderIconButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          tooltip: 'التنبيهات',
          onPressed: onTap,
          style: IconButton.styleFrom(
            backgroundColor: AppColors.white.withValues(alpha: 0.16),
            foregroundColor: AppColors.white,
            fixedSize: const Size(42, 42),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          icon: Icon(icon, size: 22),
        ),
        Positioned(
          top: 2,
          right: 2,
          child: FutureBuilder<int>(
            future: _loadUnreadNotificationsCount(),
            builder: (context, snapshot) {
              final count = snapshot.data ?? 0;
              if (count <= 0) {
                return const SizedBox.shrink();
              }
              return AppCountBadge(
                label: count > 99 ? '99+' : '$count',
                minSize: 18,
                fontSize: 10,
              );
            },
          ),
        ),
      ],
    );
  }

  Future<int> _loadUnreadNotificationsCount() async {
    final apiClient = ApiClient();
    if (await apiClient.token == null) {
      return 0;
    }

    try {
      final response = await apiClient.get('/notifications');
      final items = response is List<dynamic> ? response : const [];
      return items.where((item) {
        if (item is! Map<String, dynamic>) {
          return false;
        }
        return item['isRead'] != true;
      }).length;
    } catch (_) {
      return 0;
    }
  }
}

class _HeaderCategory extends StatelessWidget {
  const _HeaderCategory({required this.label, required this.icon, this.onTap});

  final String label;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: SizedBox(
        height: 74,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.navy.withValues(alpha: 0.12),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Icon(icon, color: AppColors.navy, size: 22),
            ),
            const SizedBox(height: 6),
            SizedBox(
              height: 22,
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    label,
                    maxLines: 1,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
