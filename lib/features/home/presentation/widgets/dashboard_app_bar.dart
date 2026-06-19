import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/widgets/app_count_badge.dart';
import 'package:skillhub/features/notifications/presentation/pages/notifications_page.dart';
import 'package:skillhub/features/profile/presentation/pages/profile_page.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: SizedBox(height: 292, child: _DashboardHeader()),
    );
  }
}

class _DashboardHeader extends StatelessWidget {
  const _DashboardHeader();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(34)),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.accentBlueDark,
              AppColors.accentBlue,
              AppColors.accentBlueLight,
            ],
          ),
        ),
        child: Stack(
          children: [
            const Positioned(
              top: -44,
              left: -40,
              child: _HeaderBubble(size: 160, opacity: 0.11),
            ),
            const Positioned(
              bottom: -64,
              right: 28,
              child: _HeaderBubble(size: 210, opacity: 0.12),
            ),
            const Positioned(
              top: 56,
              right: 72,
              child: _HeaderBubble(size: 94, opacity: 0.08),
            ),
            SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 14, 20, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const ProfilePage(),
                              ),
                            );
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
                                'مساء الخير يا كابتن',
                                style: TextStyle(
                                  color: AppColors.white.withValues(
                                    alpha: 0.74,
                                  ),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 2),
                              const Text(
                                'SkillHub',
                                style: TextStyle(
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
                          showBadge: true,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const NotificationsPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Container(
                      height: 54,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.94),
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.navy.withValues(alpha: 0.12),
                            blurRadius: 24,
                            offset: const Offset(0, 14),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Iconsax.search_normal,
                            color: AppColors.textSecondary.withValues(
                              alpha: 0.72,
                            ),
                            size: 22,
                          ),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: Text(
                              'دور على لاعب أو اشتراك',
                              style: TextStyle(
                                color: AppColors.mutedText,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'أقسام سريعة',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          _HeaderCategory(
                            label: 'لاعبين',
                            icon: Iconsax.profile_2user,
                          ),
                          _HeaderCategory(
                            label: 'اشتراكات',
                            icon: Iconsax.card,
                          ),
                          _HeaderCategory(label: 'تقييمات', icon: Iconsax.star),
                          _HeaderCategory(label: 'تقارير', icon: Iconsax.chart),
                          _HeaderCategory(
                            label: 'رسائل',
                            icon: Iconsax.message_text,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  const _HeaderIconButton({
    required this.icon,
    required this.onTap,
    this.showBadge = false,
  });

  final IconData icon;
  final VoidCallback onTap;
  final bool showBadge;

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
        if (showBadge)
          const Positioned(
            top: 2,
            right: 2,
            child: AppCountBadge(label: '2', minSize: 18, fontSize: 10),
          ),
      ],
    );
  }
}

class _HeaderCategory extends StatelessWidget {
  const _HeaderCategory({required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 76,
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
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
            child: Icon(icon, color: AppColors.navy, size: 23),
          ),
          const SizedBox(height: 7),
          FittedBox(
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
        ],
      ),
    );
  }
}

class _HeaderBubble extends StatelessWidget {
  const _HeaderBubble({required this.size, required this.opacity});

  final double size;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: opacity),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
