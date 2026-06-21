import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/features/auth/presentation/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  static const _displayDuration = Duration(milliseconds: 1100);
  static const _transitionDuration = Duration(milliseconds: 280);

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(_displayDuration, _navigateToLogin);
  }

  void _navigateToLogin() {
    if (!mounted) {
      return;
    }

    Navigator.of(context).pushReplacement(
      PageRouteBuilder<void>(
        transitionDuration: _transitionDuration,
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(opacity: animation, child: const LoginPage());
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final logoSize = MediaQuery.sizeOf(context).shortestSide < 420
        ? 132.0
        : 154.0;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? const [
                    Color(0xFF05070D),
                    Color(0xFF0B1020),
                    Color(0xFF151B2E),
                  ]
                : const [
                    Color(0xFFFFFFFF),
                    Color(0xFFF6F8FF),
                    Color(0xFFEAF0FF),
                  ],
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: _SplashPatternPainter(
                  color: (isDark ? Colors.white : AppColors.navy).withValues(
                    alpha: isDark ? 0.035 : 0.04,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 54,
              right: -56,
              child: _SplashHalo(
                width: 220,
                height: 120,
                color: AppColors.accentBlue.withValues(alpha: 0.13),
              ).animate().fadeIn(duration: 360.ms).slideX(begin: 0.12, end: 0),
            ),
            Positioned(
              bottom: 70,
              left: -46,
              child: _SplashHalo(
                width: 170,
                height: 96,
                color: AppColors.greenBright.withValues(alpha: 0.12),
              ).animate().fadeIn(duration: 360.ms).slideX(begin: -0.12, end: 0),
            ),
            SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                            width: logoSize,
                            height: logoSize,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(34),
                              border: Border.all(
                                color: AppColors.accentBlue.withValues(
                                  alpha: isDark ? 0.18 : 0.16,
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(
                                    alpha: isDark ? 0.32 : 0.16,
                                  ),
                                  blurRadius: 34,
                                  offset: const Offset(0, 22),
                                ),
                                BoxShadow(
                                  color: AppColors.accentBlue.withValues(
                                    alpha: isDark ? 0.2 : 0.14,
                                  ),
                                  blurRadius: 42,
                                  spreadRadius: -10,
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.asset(
                                'assets/icons/skillhub_logo.png',
                                fit: BoxFit.contain,
                                cacheWidth: 256,
                                cacheHeight: 256,
                              ),
                            ),
                          )
                          .animate()
                          .fadeIn(duration: 520.ms)
                          .scale(
                            begin: const Offset(0.78, 0.78),
                            curve: Curves.easeOutBack,
                          ),
                      const SizedBox(height: 28),
                      Text(
                            'SkillHub',
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0,
                              color: theme.colorScheme.onSurface,
                            ),
                          )
                          .animate(delay: 150.ms)
                          .fadeIn(duration: 420.ms)
                          .slideY(begin: 0.24, end: 0),
                      const SizedBox(height: 12),
                      Text(
                            'منصة إدارة ذكية للأكاديميات واللاعبين',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: theme.textTheme.bodyLarge?.color
                                  ?.withValues(alpha: 0.76),
                              fontWeight: FontWeight.w600,
                              height: 1.5,
                            ),
                          )
                          .animate(delay: 200.ms)
                          .fadeIn(duration: 420.ms)
                          .slideY(begin: 0.22, end: 0),
                      const SizedBox(height: 34),
                      SizedBox(
                        width: 172,
                        child: TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0, end: 1),
                          duration: _displayDuration,
                          curve: Curves.easeInOut,
                          builder: (context, value, child) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(999),
                              child: LinearProgressIndicator(
                                minHeight: 6,
                                value: value,
                                backgroundColor: AppColors.navy.withValues(
                                  alpha: isDark ? 0.28 : 0.08,
                                ),
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  AppColors.accentBlue,
                                ),
                              ),
                            );
                          },
                        ),
                      ).animate(delay: 260.ms).fadeIn(duration: 260.ms),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SplashHalo extends StatelessWidget {
  const _SplashHalo({
    required this.width,
    required this.height,
    required this.color,
  });

  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(999),
          boxShadow: [BoxShadow(color: color, blurRadius: 64, spreadRadius: 6)],
        ),
      ),
    );
  }
}

class _SplashPatternPainter extends CustomPainter {
  const _SplashPatternPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    const spacing = 36.0;
    for (var x = -spacing; x < size.width + spacing; x += spacing) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x + size.height, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _SplashPatternPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
