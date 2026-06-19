import 'package:flutter/material.dart';
import 'package:skillhub/core/theme/app_colors.dart';

class AppCountBadge extends StatelessWidget {
  const AppCountBadge({
    super.key,
    required this.label,
    this.backgroundColor = AppColors.redAccent,
    this.textColor = AppColors.white,
    this.minSize = 20,
    this.fontSize = 11,
  });

  final String label;
  final Color backgroundColor;
  final Color textColor;
  final double minSize;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: minSize, minHeight: minSize),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(minSize),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          height: 1,
        ),
      ),
    );
  }
}
