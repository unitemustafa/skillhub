import 'package:flutter/material.dart';
import 'package:skillhub/core/localization/app_localizations.dart';
import 'package:skillhub/core/theme/app_colors.dart';

class LoginActionsRow extends StatelessWidget {
  const LoginActionsRow({
    super.key,
    required this.rememberMe,
    required this.onRememberChanged,
    required this.onContactSupport,
  });

  final bool rememberMe;
  final ValueChanged<bool> onRememberChanged;
  final VoidCallback onContactSupport;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => onRememberChanged(!rememberMe),
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    value: rememberMe,
                    activeColor: AppColors.accentBlue,
                    checkColor: Colors.white,
                    side: const BorderSide(color: AppColors.border, width: 1.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    onChanged: (value) => onRememberChanged(value ?? false),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  l10n.rememberMe,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.accentBlueDark,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: Size.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: AppColors.accentBlueDark),
            ),
            textStyle: const TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.w800,
            ),
          ),
          onPressed: onContactSupport,
          child: Text(l10n.contactSupport),
        ),
      ],
    );
  }
}
