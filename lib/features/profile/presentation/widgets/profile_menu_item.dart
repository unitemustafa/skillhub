import 'package:flutter/material.dart';
import 'package:skillhub/core/localization/app_localizations.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/widgets/app_surface_card.dart';
import 'package:iconsax/iconsax.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.title,
    required this.icon,
    this.subtitle,
    this.trailingText,
    this.hasSwitch = false,
    this.switchValue = false,
    this.onSwitchChanged,
    this.onTap,
    this.isDestructive = false,
  });

  final String title;
  final IconData icon;
  final String? subtitle;
  final String? trailingText;
  final bool hasSwitch;
  final bool switchValue;
  final ValueChanged<bool>? onSwitchChanged;
  final VoidCallback? onTap;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final color = isDestructive ? AppColors.red : theme.colorScheme.onSurface;
    final iconColor = isDestructive ? AppColors.red : theme.colorScheme.primary;
    final secondaryColor =
        theme.textTheme.bodySmall?.color?.withValues(alpha: 0.72) ??
        AppColors.textSecondary;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: AppSurfaceCard(
        padding: EdgeInsets.zero,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: hasSwitch
                ? () => onSwitchChanged?.call(!switchValue)
                : onTap,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: iconColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(icon, color: iconColor, size: 20),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: color,
                          ),
                        ),
                        if (subtitle != null) ...[
                          const SizedBox(height: 3),
                          Text(
                            subtitle!,
                            style: TextStyle(
                              fontSize: 12.5,
                              height: 1.35,
                              color: secondaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (trailingText != null) ...[
                    Text(
                      trailingText!,
                      style: TextStyle(
                        fontSize: 13,
                        color: secondaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                  if (hasSwitch)
                    Switch(
                      value: switchValue,
                      onChanged: onSwitchChanged,
                      activeTrackColor: AppColors.greenBright,
                    )
                  else if (!isDestructive)
                    Icon(
                      l10n.isArabic
                          ? Iconsax.arrow_left_2
                          : Iconsax.arrow_right_3,
                      color: secondaryColor,
                      size: 18,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
