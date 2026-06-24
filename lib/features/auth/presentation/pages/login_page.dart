import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skillhub/core/localization/app_localizations.dart';
import 'package:skillhub/core/network/api_client.dart';
import 'package:skillhub/core/network/api_exception.dart';
import 'package:skillhub/core/sync/session_service.dart';
import 'package:skillhub/core/utils/snackbar_utils.dart';
import 'package:skillhub/features/admin/presentation/pages/admin_dashboard_page.dart';
import 'package:skillhub/features/auth/presentation/widgets/login_card.dart';
import 'package:skillhub/features/home/presentation/pages/dashboard_page.dart';
import 'package:skillhub/features/profile/data/profile_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const _adminEmail = 'mustafa@admin.com';
  static const _adminPassword = '01266666610';
  static const _rememberPreferenceKey = 'skillhub_remember_me';
  static const _sessionExpiresAtKey = 'skillhub_session_expires_at';
  static const _sessionRememberedKey = 'skillhub_session_remembered';
  static const _sessionIsAdminKey = 'skillhub_session_is_admin';
  static const _sessionCloseNoticeKey = 'skillhub_session_close_notice';
  static const _supportWhatsappUrl = 'https://wa.me/201016487371';
  static const _rememberedSessionDuration = Duration(days: 30);

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _apiClient = ApiClient();
  final _sessionService = SessionService();

  bool _rememberMe = true;
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadSession();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _loadSession() async {
    final prefs = await SharedPreferences.getInstance();
    final rememberPreference = prefs.getBool(_rememberPreferenceKey) ?? true;
    final shouldShowCloseNotice =
        prefs.getBool(_sessionCloseNoticeKey) ?? false;
    final expiresAtValue = prefs.getInt(_sessionExpiresAtKey);
    final isRememberedSession = prefs.getBool(_sessionRememberedKey) ?? false;
    final isAdminSession = prefs.getBool(_sessionIsAdminKey) ?? false;

    if (!mounted) {
      return;
    }

    setState(() {
      _rememberMe = rememberPreference;
    });

    if (shouldShowCloseNotice) {
      await _clearSession();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _showSessionExpiredDialog();
        }
      });
      return;
    }

    if (expiresAtValue == null) {
      return;
    }

    final expiresAt = DateTime.fromMillisecondsSinceEpoch(expiresAtValue);
    if (isRememberedSession && DateTime.now().isBefore(expiresAt)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _openDestination(isAdminLogin: isAdminSession, connectedToApi: true);
        }
      });
      return;
    }

    await _clearSession();
  }

  Future<void> _handleLogin() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final email = _emailController.text.trim().toLowerCase();
    final password = _passwordController.text;
    final isAdminLogin = email == _adminEmail && password == _adminPassword;

    setState(() {
      _isLoading = true;
    });

    try {
      final loginData = await _apiClient.login(email, password);
      if (!mounted) return;
      await _saveSession(isAdminLogin: isAdminLogin, loginData: loginData);
      _openDestination(isAdminLogin: isAdminLogin, connectedToApi: true);
    } on ApiException catch (error) {
      if (!mounted) return;
      if (isAdminLogin) {
        await _saveSession(isAdminLogin: true);
        _openDestination(isAdminLogin: true, connectedToApi: false);
        return;
      }
      SnackbarUtils.showError(context, error.message);
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _saveSession({
    required bool isAdminLogin,
    Map<String, dynamic>? loginData,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_rememberPreferenceKey, _rememberMe);

    if (!_rememberMe) {
      await prefs.setBool(_sessionCloseNoticeKey, true);
      await prefs.remove(_sessionExpiresAtKey);
      await prefs.remove(_sessionRememberedKey);
      await prefs.remove(_sessionIsAdminKey);
      return;
    }

    final expiresAt = DateTime.now().add(_rememberedSessionDuration);
    await prefs.setBool(_sessionCloseNoticeKey, false);
    await prefs.setBool(_sessionRememberedKey, true);
    await prefs.setBool(_sessionIsAdminKey, isAdminLogin);
    await prefs.setInt(_sessionExpiresAtKey, expiresAt.millisecondsSinceEpoch);

    final token = loginData?['token']?.toString();
    final user = loginData?['user'];
    if (token != null && user is Map<String, dynamic>) {
      await ProfileRepository().seedDisplayName(user['name']?.toString());
      await _sessionService.saveOnlineSession(
        accessToken: token,
        userId: user['id']?.toString() ?? user['email']?.toString() ?? '',
        email: user['email']?.toString() ?? '',
        role: user['role']?.toString() ?? (isAdminLogin ? 'admin' : 'user'),
        localSessionExpiresAt: expiresAt,
      );
    }
  }

  Future<void> _clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_sessionExpiresAtKey);
    await prefs.remove(_sessionRememberedKey);
    await prefs.remove(_sessionIsAdminKey);
    await prefs.remove(_sessionCloseNoticeKey);
    await _sessionService.clearCurrentAccount();
    await _apiClient.clearToken();
  }

  Future<void> _showSessionExpiredDialog() async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('انتهت الجلسة'),
          content: const Text(
            'بدون تفعيل افتكرني تنتهي الجلسة بمجرد غلق التطبيق. فعّل افتكرني لو عايز الجلسة تفضل محفوظة لمدة 30 يوم.',
          ),
          actions: [
            TextButton(
              onPressed: () => SystemNavigator.pop(),
              child: const Text('غلق'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _clearSession();
              },
              child: const Text('تسجيل الدخول'),
            ),
          ],
        );
      },
    );
  }

  void _openDestination({
    required bool isAdminLogin,
    required bool connectedToApi,
  }) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => isAdminLogin
            ? AdminDashboardPage(connectedToApi: connectedToApi)
            : DashboardPage(),
      ),
    );
  }

  Future<void> _contactSupport() async {
    final uri = Uri.parse(_supportWhatsappUrl);
    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!launched && mounted) {
      SnackbarUtils.showError(context, 'تعذر فتح واتساب. حاول مرة أخرى.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: ColoredBox(
        color: theme.colorScheme.surface,
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(28, 26, 28, 24),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight - 50,
                  ),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 430),
                      child: LoginCard(
                        l10n: l10n,
                        formKey: _formKey,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        rememberMe: _rememberMe,
                        obscurePassword: _obscurePassword,
                        isLoading: _isLoading,
                        onRememberChanged: (value) {
                          setState(() {
                            _rememberMe = value;
                          });
                          SharedPreferences.getInstance().then((prefs) {
                            prefs.setBool(_rememberPreferenceKey, value);
                          });
                        },
                        onTogglePassword: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        onLogin: _handleLogin,
                        onContactSupport: _contactSupport,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
