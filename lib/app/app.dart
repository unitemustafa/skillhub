import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skillhub/core/localization/app_localizations.dart';
import 'package:skillhub/core/theme/app_theme.dart';
import 'package:skillhub/features/splash/presentation/pages/splash_page.dart';

class SkillHubApp extends StatefulWidget {
  const SkillHubApp({super.key});

  static SkillHubAppState of(BuildContext context) {
    return context.findAncestorStateOfType<SkillHubAppState>()!;
  }

  @override
  State<SkillHubApp> createState() => SkillHubAppState();
}

class SkillHubAppState extends State<SkillHubApp> {
  static const _themeModeKey = 'skillhub_theme_mode';
  static const _localeKey = 'skillhub_locale';

  ThemeMode _themeMode = ThemeMode.system;
  Locale _locale = const Locale('ar');

  ThemeMode get themeMode => _themeMode;
  Locale get locale => _locale;
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLocale = prefs.getString(_localeKey);
    final savedThemeMode = prefs.getString(_themeModeKey);

    if (!mounted) {
      return;
    }

    setState(() {
      if (savedLocale == 'ar' || savedLocale == 'en') {
        _locale = Locale(savedLocale!);
      }
      _themeMode = _themeModeFromString(savedThemeMode);
    });
  }

  Future<void> toggleTheme(bool isDark) async {
    await setThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    setState(() {
      _themeMode = mode;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeModeKey, _themeModeToString(mode));
  }

  Future<void> setLocale(Locale newLocale) async {
    if (newLocale.languageCode != 'ar' && newLocale.languageCode != 'en') {
      return;
    }

    setState(() {
      _locale = Locale(newLocale.languageCode);
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, newLocale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkillHub',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      locale: _locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        final l10n = AppLocalizations.of(context);
        return Directionality(textDirection: l10n.textDirection, child: child!);
      },
      home: const SplashPage(),
    );
  }

  ThemeMode _themeModeFromString(String? value) {
    return switch (value) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      'system' || null => ThemeMode.system,
      _ => ThemeMode.system,
    };
  }

  String _themeModeToString(ThemeMode mode) {
    return switch (mode) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      ThemeMode.system => 'system',
    };
  }
}
