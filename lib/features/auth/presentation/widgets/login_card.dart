import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/localization/app_localizations.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/features/auth/presentation/widgets/labeled_text_field.dart';
import 'package:skillhub/features/auth/presentation/widgets/login_actions_row.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({
    super.key,
    required this.l10n,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.rememberMe,
    required this.obscurePassword,
    required this.isLoading,
    required this.onRememberChanged,
    required this.onTogglePassword,
    required this.onLogin,
    required this.onContactSupport,
  });

  final AppLocalizations l10n;
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool rememberMe;
  final bool obscurePassword;
  final bool isLoading;
  final ValueChanged<bool> onRememberChanged;
  final VoidCallback onTogglePassword;
  final VoidCallback onLogin;
  final VoidCallback onContactSupport;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onSurface;

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: l10n.isArabic
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Container(
              width: 88,
              height: 88,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(26),
                border: Border.all(color: AppColors.border),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accentBlue.withValues(alpha: 0.12),
                    blurRadius: 26,
                    offset: const Offset(0, 14),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/icons/skillhub_logo.png',
                fit: BoxFit.contain,
                cacheWidth: 160,
                cacheHeight: 160,
              ),
            ),
          ),
          const SizedBox(height: 34),
          Text(
            l10n.login,
            textAlign: l10n.isArabic ? TextAlign.right : TextAlign.left,
            style: TextStyle(
              fontSize: 30,
              height: 1.1,
              fontWeight: FontWeight.w900,
              color: textColor,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            l10n.welcomeBack,
            textAlign: l10n.isArabic ? TextAlign.right : TextAlign.left,
            style: TextStyle(
              fontSize: 15,
              height: 1.35,
              fontWeight: FontWeight.w500,
              color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 34),
          LabeledTextField(
            label: l10n.usernameOrEmail,
            controller: emailController,
            hintText: 'admin@skillhub.com',
            icon: Iconsax.sms,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return l10n.enterUsernameOrEmail;
              }
              return null;
            },
          ),
          const SizedBox(height: 18),
          LabeledTextField(
            label: l10n.password,
            controller: passwordController,
            hintText: '••••••••',
            icon: Iconsax.lock,
            obscureText: obscurePassword,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => onLogin(),
            suffix: IconButton(
              tooltip: obscurePassword ? l10n.showPassword : l10n.hidePassword,
              onPressed: onTogglePassword,
              icon: Icon(
                obscurePassword ? Iconsax.eye_slash : Iconsax.eye,
                color: AppColors.mutedText,
                size: 22,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return l10n.enterPassword;
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          LoginActionsRow(
            rememberMe: rememberMe,
            onRememberChanged: onRememberChanged,
            onContactSupport: onContactSupport,
          ),
          const SizedBox(height: 34),
          SizedBox(
            height: 58,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentBlue,
                foregroundColor: Colors.white,
                disabledBackgroundColor: AppColors.accentBlue.withValues(
                  alpha: 0.72,
                ),
                disabledForegroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                shadowColor: Colors.transparent,
              ),
              onPressed: isLoading ? null : onLogin,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 180),
                child: isLoading
                    ? const SizedBox(
                        key: ValueKey('loading'),
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2.4,
                        ),
                      )
                    : Text(
                        l10n.loginAction,
                        key: ValueKey('label'),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
