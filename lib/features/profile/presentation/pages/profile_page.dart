import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skillhub/core/localization/app_localizations.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/widgets/app_surface_card.dart';
import 'package:skillhub/features/auth/presentation/pages/login_page.dart';
import 'package:skillhub/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:skillhub/features/profile/presentation/widgets/profile_menu_item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _notificationsEnabled = true;
  XFile? _profileImage;

  Widget _buildAvatarImage() {
    if (_profileImage != null) {
      if (kIsWeb) {
        return ClipOval(
          child: Image.network(
            _profileImage!.path,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        );
      } else {
        return ClipOval(
          child: Image.file(
            File(_profileImage!.path),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        );
      }
    }
    return const Icon(Iconsax.user, size: 40, color: AppColors.accentBlue);
  }

  void _handleLogout() {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final secondaryColor =
        theme.textTheme.bodySmall?.color?.withValues(alpha: 0.72) ??
        AppColors.textSecondary;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        titlePadding: const EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24,
          bottom: 12,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24),
        actionsPadding: const EdgeInsets.only(
          top: 20,
          left: 24,
          right: 24,
          bottom: 20,
        ),
        title: Text(
          l10n.logoutTitle,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
        content: Text(
          l10n.logoutMessage,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: secondaryColor,
            height: 1.5,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                ),
                child: Text(
                  l10n.cancel,
                  style: TextStyle(
                    color: secondaryColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.red,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                    (route) => false,
                  );
                },
                child: Text(
                  l10n.logout,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondaryColor =
        theme.textTheme.bodySmall?.color?.withValues(alpha: 0.72) ??
        AppColors.textSecondary;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: theme.scaffoldBackgroundColor,
            floating: true,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                l10n.isArabic ? Iconsax.arrow_right_3 : Iconsax.arrow_left_2,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              l10n.profile,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            centerTitle: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColors.accentBlue.withValues(
                          alpha: isDark ? 0.18 : 0.1,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: theme.colorScheme.surface,
                          width: 4,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.accentBlue.withValues(alpha: 0.18),
                            blurRadius: 22,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: _buildAvatarImage(),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.systemAdmin,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'admin@skillhub.com',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: secondaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () async {
                        final result = await Navigator.of(context)
                            .push<Map<String, dynamic>?>(
                              MaterialPageRoute(
                                builder: (_) => const EditProfilePage(),
                              ),
                            );
                        if (result != null && mounted) {
                          setState(() {
                            _profileImage = result['image'] as XFile?;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      icon: const Icon(Iconsax.edit_2, size: 18),
                      label: Text(
                        l10n.editProfile,
                        style: const TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ).animate().fade(duration: 400.ms).slideY(begin: 0.1),
                const SizedBox(height: 40),
                Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                            start: 8,
                            bottom: 16,
                          ),
                          child: Text(
                            l10n.appPreferences,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: secondaryColor,
                            ),
                          ),
                        ),

                        ProfileMenuItem(
                          title: l10n.appNotifications,
                          icon: Iconsax.notification,
                          hasSwitch: true,
                          switchValue: _notificationsEnabled,
                          onSwitchChanged: (val) {
                            setState(() => _notificationsEnabled = val);
                          },
                        ),
                      ],
                    )
                    .animate(delay: 200.ms)
                    .fade(duration: 400.ms)
                    .slideY(begin: 0.1),
              ]),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: 30,
            ),
            sliver: SliverToBoxAdapter(
              child:
                  Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: AppSurfaceCard(
                          padding: EdgeInsets.zero,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: _handleLogout,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    textDirection: l10n.isArabic
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: AppColors.red.withValues(
                                            alpha: 0.1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: const Icon(
                                          Iconsax.logout_1,
                                          color: AppColors.red,
                                          size: 20,
                                        ),
                                      ),
                                      const SizedBox(width: 18),
                                      Text(
                                        l10n.logout,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .animate(delay: 300.ms)
                      .fade(duration: 400.ms)
                      .slideY(begin: 0.1),
            ),
          ),
        ],
      ),
    );
  }
}
