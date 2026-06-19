import 'package:flutter/material.dart';
import 'package:skillhub/core/theme/app_colors.dart';

class AppSectionHeader extends StatelessWidget {
  const AppSectionHeader({
    super.key,
    required this.title,
    this.trailing,
    this.prefix,
    this.showAccent = true,
  });

  final String title;
  final Widget? trailing;
  final Widget? prefix;
  final bool showAccent;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        if (showAccent) ...[
          Container(
            width: 4,
            height: 22,
            decoration: BoxDecoration(
              color: AppColors.accentBlue,
              borderRadius: BorderRadius.circular(99),
            ),
          ),
          const SizedBox(width: 8),
        ],
        if (prefix case final prefix?) ...[prefix, const SizedBox(width: 8)],
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
        const Spacer(),
        ...(trailing == null ? const <Widget>[] : <Widget>[trailing!]),
      ],
    );
  }
}
