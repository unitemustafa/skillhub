import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AppLocalizations {
  const AppLocalizations(this.locale);

  final Locale locale;

  static const supportedLocales = [Locale('ar'), Locale('en')];

  static const delegate = _AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  bool get isArabic => locale.languageCode == 'ar';
  TextDirection get textDirection =>
      isArabic ? TextDirection.rtl : TextDirection.ltr;

  String get appName => 'SkillHub';
  String get arabic => 'العربية';
  String get english => 'English';
  String get systemAdmin => isArabic ? 'مدير الأكاديمية' : 'System Admin';
  String get profile => isArabic ? 'حسابي' : 'Profile';
  String get editProfile => isArabic ? 'تعديل الحساب' : 'Edit Profile';
  String get appPreferences => isArabic ? 'إعدادات التطبيق' : 'App preferences';
  String get changeAppLanguage =>
      isArabic ? 'غيّر لغة التطبيق' : 'Change app language';
  String get chooseAppLanguage =>
      isArabic ? 'اختار لغة التطبيق' : 'Choose app language';
  String get darkMode => isArabic ? 'الوضع الداكن' : 'Dark mode';
  String get darkModeSubtitle =>
      isArabic ? 'شكل هادي ومريح للعين' : 'A calm, comfortable appearance';
  String get appNotifications =>
      isArabic ? 'تنبيهات التطبيق' : 'App notifications';
  String get logout => isArabic ? 'تسجيل خروج' : 'Log out';
  String get logoutTitle => isArabic ? 'تأكيد الخروج' : 'Log out';
  String get logoutMessage => isArabic
      ? 'متأكد إنك عايز تخرج من التطبيق؟'
      : 'Are you sure you want to log out of the app?';
  String get cancel => isArabic ? 'إلغاء' : 'Cancel';
  String get saveChanges => isArabic ? 'حفظ التعديلات' : 'Save changes';
  String get fullName => isArabic ? 'الاسم بالكامل' : 'Full name';
  String get email => isArabic ? 'الإيميل' : 'Email address';
  String get phone => isArabic ? 'رقم الموبايل' : 'Phone number';
  String get enterName => isArabic ? 'اكتب الاسم' : 'Please enter the name';
  String get enterEmail => isArabic ? 'اكتب الإيميل' : 'Please enter the email';
  String get validEmail =>
      isArabic ? 'اكتب إيميل صحيح' : 'Please enter a valid email';
  String get enterPhone =>
      isArabic ? 'اكتب رقم الموبايل' : 'Please enter the phone number';
  String get profileSaved =>
      isArabic ? 'تم حفظ التعديلات بنجاح' : 'Profile updated successfully';

  String get welcomeBack => isArabic
      ? 'أهلاً بيك من تاني، سجل دخولك وكمل إدارة الأكاديمية'
      : 'Welcome back. Sign in to continue';
  String get login => isArabic ? 'تسجيل الدخول' : 'Sign in';
  String get loginAction => isArabic ? 'دخول' : 'Sign in';
  String get usernameOrEmail =>
      isArabic ? 'الإيميل أو اسم المستخدم' : 'Email or username';
  String get enterUsernameOrEmail => isArabic
      ? 'اكتب الإيميل أو اسم المستخدم'
      : 'Please enter your email or username';
  String get password => isArabic ? 'كلمة المرور' : 'Password';
  String get enterPassword =>
      isArabic ? 'اكتب كلمة المرور' : 'Please enter your password';
  String get showPassword => isArabic ? 'إظهار كلمة المرور' : 'Show password';
  String get hidePassword => isArabic ? 'إخفاء كلمة المرور' : 'Hide password';
  String get rememberMe => isArabic ? 'افتكرني' : 'Remember me';
  String get contactSupport => isArabic ? 'كلم الدعم' : 'Contact support';
  String get supportRedirect => isArabic
      ? 'بنحوّلك للدعم الفني...'
      : 'Redirecting you to live support...';
  String get copyright => isArabic
      ? 'SkillHub © 2026. كل الحقوق محفوظة'
      : 'SkillHub © 2026. All rights reserved';

  String get latestNotifications =>
      isArabic ? 'آخر التنبيهات' : 'Latest notifications';
  String get viewAll => isArabic ? 'شوف الكل' : 'View all';
  String get quickActions => isArabic ? 'اختصارات سريعة' : 'Quick actions';
  String get overviewStats => isArabic ? 'نظرة عامة' : 'Overview stats';
  String get monthlyRevenue =>
      isArabic ? 'إيرادات الشهر (آخر 12 شهر)' : 'Monthly revenue';
  String get subscriptionsDistribution =>
      isArabic ? 'توزيع الاشتراكات' : 'Subscriptions distribution';
  String get playersByBirthYear =>
      isArabic ? 'اللاعبين حسب سنة الميلاد' : 'Players by birth year';
  String get ratingsDistribution =>
      isArabic ? 'توزيع التقييمات' : 'Ratings distribution';
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLocalizations.supportedLocales.any(
      (supportedLocale) => supportedLocale.languageCode == locale.languageCode,
    );
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture(AppLocalizations(locale));
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
