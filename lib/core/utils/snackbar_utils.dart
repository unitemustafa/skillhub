import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/theme/app_colors.dart';

class SnackbarUtils {
  static void showSuccess(BuildContext context, String message) {
    _show(
      context,
      message: message,
      title: 'تمت العملية بنجاح',
      color: AppColors.greenBright,
      icon: Iconsax.tick_circle,
    );
  }

  static void showError(BuildContext context, String message) {
    _show(
      context,
      message: message,
      title: 'تعذر إتمام الطلب',
      color: AppColors.redAccent,
      icon: Iconsax.warning_2,
      filled: true,
      duration: const Duration(seconds: 5),
    );
  }

  static void _show(
    BuildContext context, {
    required String title,
    required String message,
    required Color color,
    required IconData icon,
    bool filled = false,
    Duration duration = const Duration(seconds: 3),
  }) {
    final messenger = ScaffoldMessenger.of(context);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final surface = filled ? color : theme.colorScheme.surface;
    final titleColor = filled ? Colors.white : theme.colorScheme.onSurface;
    final messageColor = filled
        ? Colors.white.withValues(alpha: 0.88)
        : theme.colorScheme.onSurfaceVariant;

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          padding: EdgeInsets.zero,
          content: DecoratedBox(
            decoration: BoxDecoration(
              color: surface,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: filled
                    ? Colors.white.withValues(alpha: 0.18)
                    : color.withValues(alpha: 0.28),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.28 : 0.10),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(14, 13, 10, 13),
              child: Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: filled
                          ? Colors.white.withValues(alpha: 0.16)
                          : color.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Icon(
                      icon,
                      color: filled ? Colors.white : color,
                      size: 23,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: titleColor,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          message,
                          style: theme.textTheme.bodySmall?.copyWith(
                            height: 1.45,
                            color: messageColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    tooltip: 'إغلاق',
                    onPressed: messenger.hideCurrentSnackBar,
                    icon: Icon(
                      Icons.close_rounded,
                      size: 20,
                      color: filled ? Colors.white : messageColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 18),
          elevation: 0,
          duration: duration,
          dismissDirection: DismissDirection.horizontal,
        ),
      );
  }
}
