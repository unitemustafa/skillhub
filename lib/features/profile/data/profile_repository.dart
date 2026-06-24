import 'package:shared_preferences/shared_preferences.dart';
import 'package:skillhub/core/localization/app_localizations.dart';
import 'package:skillhub/core/sync/session_service.dart';

class ProfileData {
  const ProfileData({
    required this.displayName,
    required this.email,
    this.imagePath,
  });

  final String displayName;
  final String email;
  final String? imagePath;
}

class ProfileRepository {
  static const _displayNameKey = 'skillhub_profile_display_name';
  static const _imagePathKey = 'skillhub_profile_image_path';

  final _sessionService = SessionService();

  Future<ProfileData> loadProfile([AppLocalizations? l10n]) async {
    final prefs = await SharedPreferences.getInstance();
    final session = await _sessionService.readLastSession();
    final savedName = prefs.getString(_displayNameKey)?.trim();
    final email = session?.email ?? 'admin@skillhub.com';

    return ProfileData(
      displayName: savedName?.isNotEmpty == true
          ? savedName!
          : l10n?.systemAdmin ?? 'مدير الأكاديمية',
      email: email,
      imagePath: prefs.getString(_imagePathKey),
    );
  }

  Future<void> saveProfile({
    required String displayName,
    String? imagePath,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_displayNameKey, displayName.trim());
    if (imagePath == null || imagePath.isEmpty) {
      await prefs.remove(_imagePathKey);
    } else {
      await prefs.setString(_imagePathKey, imagePath);
    }
  }

  Future<void> seedDisplayName(String? displayName) async {
    final name = displayName?.trim();
    if (name == null || name.isEmpty) {
      return;
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_displayNameKey, name);
  }
}
