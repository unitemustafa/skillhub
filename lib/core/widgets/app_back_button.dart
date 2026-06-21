import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.onPressed,
    this.color,
    this.enabled = true,
  });

  final VoidCallback? onPressed;
  final Color? color;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.maybeLocaleOf(context);
    final isArabic =
        locale?.languageCode == 'ar' ||
        Directionality.of(context) == TextDirection.rtl;

    return IconButton(
      tooltip: isArabic ? 'رجوع' : 'Back',
      onPressed: enabled
          ? onPressed ?? () => Navigator.of(context).pop()
          : null,
      icon: Icon(
        isArabic ? Iconsax.arrow_right_3 : Iconsax.arrow_left_2,
        color: color ?? Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
