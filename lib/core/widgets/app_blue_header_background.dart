import 'package:flutter/material.dart';
import 'package:skillhub/core/theme/app_colors.dart';

class AppBlueHeaderBackground extends StatelessWidget {
  const AppBlueHeaderBackground({
    super.key,
    required this.child,
    this.borderRadius = const BorderRadius.vertical(
      bottom: Radius.circular(34),
    ),
  });

  final Widget child;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
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
            child,
          ],
        ),
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
