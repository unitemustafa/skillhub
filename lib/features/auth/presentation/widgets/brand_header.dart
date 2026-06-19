import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/localization/app_localizations.dart';
import 'package:skillhub/core/theme/app_colors.dart';

class BrandHeader extends StatelessWidget {
  const BrandHeader({super.key, required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          height: 96,
          width: 96,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.primary.withValues(alpha: 0.22),
                blurRadius: 30,
                offset: const Offset(0, 14),
              ),
            ],
          ),
          child: const Icon(
            Iconsax.game,
            size: 46,
            color: AppColors.accentBlue,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'SkillHub',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 34,
            height: 1.05,
            fontWeight: FontWeight.w800,
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          l10n.welcomeBack,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            height: 1.6,
            color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.72),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
