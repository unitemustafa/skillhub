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
  static const _displayDuration = Duration(milliseconds: 900);
  static const _transitionDuration = Duration(milliseconds: 260);

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

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? const [
                    Color(0xFF0B1220),
                    Color(0xFF111A29),
                    Color(0xFF182437),
                  ]
                : const [
                    Color(0xFFF3F6FB),
                    Color(0xFFE8EEF6),
                    Color(0xFFDCE6F2),
                  ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -80,
              right: -40,
              child: _SplashOrb(
                size: 220,
                color: AppColors.orange.withValues(alpha: 0.16),
              ).animate().fadeIn(duration: 280.ms),
            ),
            Positioned(
              bottom: -70,
              left: -30,
              child: _SplashOrb(
                size: 180,
                color: AppColors.accentBlue.withValues(alpha: 0.14),
              ).animate().fadeIn(duration: 280.ms),
            ),
            SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                            width: 154,
                            height: 154,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surface.withValues(
                                alpha: isDark ? 0.9 : 0.94,
                              ),
                              borderRadius: BorderRadius.circular(42),
                              border: Border.all(
                                color: Colors.white.withValues(
                                  alpha: isDark ? 0.08 : 0.45,
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.navy.withValues(
                                    alpha: isDark ? 0.24 : 0.14,
                                  ),
                                  blurRadius: 36,
                                  offset: const Offset(0, 24),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(26),
                              child: Image.asset(
                                'assets/icons/skillhub_logo.png',
                                fit: BoxFit.cover,
                                cacheWidth: 256,
                                cacheHeight: 256,
                              ),
                            ),
                          )
                          .animate()
                          .fadeIn(duration: 500.ms)
                          .scale(
                            begin: const Offset(0.78, 0.78),
                            curve: Curves.easeOutBack,
                          ),
                      const SizedBox(height: 28),
                      Text(
                            'SkillHub',
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.3,
                              color: theme.colorScheme.onSurface,
                            ),
                          )
                          .animate(delay: 150.ms)
                          .fadeIn(duration: 420.ms)
                          .slideY(begin: 0.24, end: 0),
                      const SizedBox(height: 12),
                      Text(
                            'نظام إدارة ذكي للأكاديميات واللاعبين',
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
                                  AppColors.orange,
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

class _SplashOrb extends StatelessWidget {
  const _SplashOrb({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: color, blurRadius: 80, spreadRadius: 12),
          ],
        ),
      ),
    );
  }
}
