import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skillhub/app/app.dart';
import 'package:skillhub/core/localization/app_localizations.dart';
import 'package:skillhub/core/network/api_client.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/widgets/app_blue_page_header.dart';
import 'package:skillhub/core/widgets/app_surface_card.dart';
import 'package:skillhub/features/auth/presentation/pages/login_page.dart';
import 'package:skillhub/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:skillhub/features/profile/presentation/widgets/profile_menu_item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, this.showBackButton = true});

  final bool showBackButton;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static const _sessionKeys = [
    'skillhub_session_expires_at',
    'skillhub_session_remembered',
    'skillhub_session_is_admin',
    'skillhub_session_close_notice',
    'skillhub_auth_token',
  ];

  bool _notificationsEnabled = true;
  XFile? _profileImage;

  String _themeModeLabel(AppLocalizations l10n, ThemeMode mode) {
    return switch (mode) {
      ThemeMode.system => l10n.isArabic ? 'تلقائي' : 'System',
      ThemeMode.light => l10n.isArabic ? 'فاتح' : 'Light',
      ThemeMode.dark => l10n.isArabic ? 'داكن' : 'Dark',
    };
  }

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

  Future<void> _handleLogout() async {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final secondaryColor =
        theme.textTheme.bodySmall?.color?.withValues(alpha: 0.72) ??
        AppColors.textSecondary;

    final confirmed = await showDialog<bool>(
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
                onPressed: () => Navigator.of(ctx).pop(false),
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
                onPressed: () => Navigator.of(ctx).pop(true),
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

    if (confirmed != true) {
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    for (final key in _sessionKeys) {
      await prefs.remove(key);
    }
    await ApiClient().clearToken();
    if (!mounted) return;

    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (_) => false,
    );
  }

  Future<void> _showThemeModeSheet() async {
    final appState = SkillHubApp.of(context);
    final l10n = context.l10n;
    final selected = await showModalBottomSheet<ThemeMode>(
      context: context,
      backgroundColor: Colors.transparent,
      showDragHandle: false,
      builder: (sheetContext) {
        final theme = Theme.of(sheetContext);
        final modes = <ThemeMode>[
          ThemeMode.system,
          ThemeMode.light,
          ThemeMode.dark,
        ];

        return SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.fromLTRB(18, 10, 18, 22),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(28),
              ),
              border: Border.all(
                color: theme.colorScheme.outline.withValues(alpha: 0.7),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.42),
                  blurRadius: 28,
                  offset: const Offset(0, -10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    width: 42,
                    height: 5,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onSurface.withValues(
                        alpha: 0.78,
                      ),
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                Row(
                  textDirection: l10n.isArabic
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withValues(
                          alpha: 0.12,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Iconsax.moon,
                        color: theme.colorScheme.primary,
                        size: 21,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      l10n.isArabic ? 'مظهر التطبيق' : 'App theme',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  l10n.isArabic
                      ? 'اختر المظهر المناسب لطريقة استخدامك.'
                      : 'Choose the appearance that suits you.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.textTheme.bodySmall?.color?.withValues(
                      alpha: 0.68,
                    ),
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 18),
                for (final mode in modes)
                  _ThemeModeChoiceCard(
                    label: _themeModeLabel(l10n, mode),
                    subtitle: mode == ThemeMode.system
                        ? Text(
                            l10n.isArabic
                                ? 'يتغير تلقائيا حسب إعدادات الجهاز.'
                                : 'Follows your device theme',
                          )
                        : null,
                    icon: switch (mode) {
                      ThemeMode.system => Iconsax.mobile,
                      ThemeMode.light => Iconsax.sun_1,
                      ThemeMode.dark => Iconsax.moon,
                    },
                    selected: appState.themeMode == mode,
                    onTap: () => Navigator.of(sheetContext).pop(mode),
                  ),
              ],
            ),
          ),
        );
      },
    );

    if (selected != null) {
      await appState.setThemeMode(selected);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final secondaryColor =
        theme.textTheme.bodySmall?.color?.withValues(alpha: 0.72) ??
        AppColors.textSecondary;
    final appState = SkillHubApp.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          AppBluePageHeader(
            title: l10n.profile,
            showBackButton: widget.showBackButton,
            pinned: false,
            floating: false,
            snap: false,
            bottomHeight: 224,
            bottom: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 108,
                  height: 108,
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(
                      alpha: isDark ? 0.18 : 0.2,
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.white, width: 4),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.navy.withValues(alpha: 0.16),
                        blurRadius: 24,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: _buildAvatarImage(),
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.systemAdmin,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'admin@skillhub.com',
                  style: TextStyle(
                    color: AppColors.white.withValues(alpha: 0.76),
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 14),
                OutlinedButton.icon(
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
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.white,
                    side: BorderSide(
                      color: AppColors.white.withValues(alpha: 0.7),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Iconsax.edit_2, size: 17),
                  label: Text(
                    l10n.editProfile,
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
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
                          title: l10n.isArabic ? 'مظهر التطبيق' : 'App theme',
                          trailingText: _themeModeLabel(
                            l10n,
                            appState.themeMode,
                          ),
                          icon: Iconsax.moon,
                          onTap: _showThemeModeSheet,
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
                                  horizontal: 18,
                                ),
                                child: Row(
                                  textDirection: l10n.isArabic
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                  children: [
                                    Text(
                                      l10n.logout,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.red,
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: AppColors.red.withValues(
                                          alpha: 0.1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Icon(
                                        Iconsax.logout_1,
                                        color: AppColors.red,
                                        size: 20,
                                      ),
                                    ),
                                  ],
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

class _ThemeModeChoiceCard extends StatelessWidget {
  const _ThemeModeChoiceCard({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
    this.subtitle,
  });

  final String label;
  final Widget? subtitle;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final borderColor = selected
        ? theme.colorScheme.primary
        : theme.colorScheme.outline.withValues(alpha: 0.46);
    final backgroundColor = selected
        ? theme.colorScheme.primary.withValues(alpha: 0.11)
        : theme.colorScheme.surface;
    final secondaryColor =
        theme.textTheme.bodySmall?.color?.withValues(alpha: 0.72) ??
        AppColors.textSecondary;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOut,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: borderColor, width: selected ? 1.4 : 1),
              boxShadow: [
                if (!selected)
                  BoxShadow(
                    color: Colors.black.withValues(
                      alpha: theme.brightness == Brightness.dark ? 0.16 : 0.04,
                    ),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
              ],
            ),
            child: Row(
              textDirection: l10n.isArabic
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: selected
                        ? theme.colorScheme.primary.withValues(alpha: 0.16)
                        : theme.colorScheme.onSurface.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: selected
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSurface,
                    size: 23,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: l10n.isArabic
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        textAlign: l10n.isArabic
                            ? TextAlign.right
                            : TextAlign.left,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      if (subtitle != null) ...[
                        const SizedBox(height: 3),
                        DefaultTextStyle.merge(
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: secondaryColor,
                            height: 1.35,
                            fontWeight: FontWeight.w600,
                          ),
                          child: subtitle!,
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selected
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onSurface.withValues(alpha: 0.38),
                      width: 2,
                    ),
                  ),
                  child: selected
                      ? Center(
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
