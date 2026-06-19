import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/theme/app_colors.dart';

class SkillHubBottomNavBar extends StatelessWidget {
  const SkillHubBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  static const destinations = <_SkillHubNavDestination>[
    _SkillHubNavDestination('الرئيسية', Iconsax.home_2),
    _SkillHubNavDestination('اللاعبين', Iconsax.profile_2user),
    _SkillHubNavDestination('الاشتراكات', Iconsax.card),
    _SkillHubNavDestination('التنبيهات', Iconsax.notification),
    _SkillHubNavDestination('حسابي', Iconsax.user),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      top: false,
      child: Container(
        height: 76,
        margin: const EdgeInsets.fromLTRB(14, 0, 14, 12),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: isDark
                ? AppColors.white.withValues(alpha: 0.08)
                : AppColors.border,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.navy.withValues(alpha: isDark ? 0.24 : 0.12),
              blurRadius: 26,
              offset: const Offset(0, 14),
            ),
          ],
        ),
        child: Row(
          children: [
            for (var index = 0; index < destinations.length; index++)
              Expanded(
                child: _SkillHubNavItem(
                  destination: destinations[index],
                  selected: currentIndex == index,
                  onTap: () => onDestinationSelected(index),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _SkillHubNavItem extends StatelessWidget {
  const _SkillHubNavItem({
    required this.destination,
    required this.selected,
    required this.onTap,
  });

  final _SkillHubNavDestination destination;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final inactiveColor = Theme.of(
      context,
    ).colorScheme.onSurface.withValues(alpha: 0.55);

    return Tooltip(
      message: destination.label,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
          decoration: BoxDecoration(
            color: selected
                ? AppColors.accentBlueSoft.withValues(alpha: 0.82)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                destination.icon,
                size: 22,
                color: selected ? AppColors.accentBlueDark : inactiveColor,
              ),
              const SizedBox(height: 4),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  destination.label,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: selected ? FontWeight.w800 : FontWeight.w700,
                    color: selected ? AppColors.accentBlueDark : inactiveColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillHubNavDestination {
  const _SkillHubNavDestination(this.label, this.icon);

  final String label;
  final IconData icon;
}
