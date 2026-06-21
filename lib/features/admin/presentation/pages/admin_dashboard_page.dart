import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skillhub/core/network/api_client.dart';
import 'package:skillhub/core/network/api_exception.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/utils/snackbar_utils.dart';
import 'package:skillhub/core/widgets/app_surface_card.dart';
import 'package:skillhub/features/auth/presentation/pages/login_page.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key, required this.connectedToApi});

  final bool connectedToApi;

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  static const _localUsersKey = 'skillhub_admin_local_users';
  static const _sessionKeys = [
    'skillhub_session_expires_at',
    'skillhub_session_remembered',
    'skillhub_session_is_admin',
    'skillhub_session_close_notice',
    'skillhub_auth_token',
  ];

  final _apiClient = ApiClient();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late Future<List<_AdminUser>> _usersFuture;
  bool _isCreating = false;
  bool _usingLocalUsers = false;
  String _activationPlan = 'monthly';

  @override
  void initState() {
    super.initState();
    _usersFuture = _loadUsers();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<List<_AdminUser>> _loadUsers() async {
    final localUsers = await _loadLocalUsers();

    try {
      final response = await _apiClient.get('/users') as List<dynamic>;
      final apiUsers = response
          .whereType<Map<String, dynamic>>()
          .map((json) => _AdminUser.fromJson(json, source: 'الخادم'))
          .where((user) => user.role != 'admin')
          .toList();

      _usingLocalUsers = false;
      return _mergeUsers(apiUsers, localUsers);
    } on ApiException {
      _usingLocalUsers = true;
      return localUsers;
    }
  }

  Future<List<_AdminUser>> _loadLocalUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final rawUsers = prefs.getStringList(_localUsersKey) ?? const [];
    return rawUsers
        .map((raw) => jsonDecode(raw))
        .whereType<Map<String, dynamic>>()
        .map((json) => _AdminUser.fromJson(json, source: 'محلي'))
        .toList();
  }

  Future<void> _saveLocalUser(_AdminUser user) async {
    final users = _mergeUsers(await _loadLocalUsers(), [user]);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      _localUsersKey,
      users.map((item) => jsonEncode(item.toJson())).toList(),
    );
  }

  List<_AdminUser> _mergeUsers(
    List<_AdminUser> first,
    List<_AdminUser> second,
  ) {
    final byEmail = <String, _AdminUser>{};
    for (final user in [...first, ...second]) {
      byEmail[user.email.toLowerCase()] = user;
    }
    final users = byEmail.values.toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return users;
  }

  Future<void> _createUser() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final user = _AdminUser(
      id: 'local-${DateTime.now().millisecondsSinceEpoch}',
      name: _nameController.text.trim(),
      email: _emailController.text.trim().toLowerCase(),
      role: 'user',
      source: 'محلي',
      activationPlan: _activationPlan,
      activationStartsAt: DateTime.now(),
      activationEndsAt: _activationEndsAt(_activationPlan),
      createdAt: DateTime.now(),
      playersCount: 0,
      monthlyRevenue: 0,
      yearlyRevenue: 0,
    );

    setState(() {
      _isCreating = true;
    });

    try {
      await _apiClient.post('/users', {
        'name': user.name,
        'email': user.email,
        'password': _passwordController.text,
        'role': user.role,
        'activationPlan': user.activationPlan,
      });
    } on ApiException {
      await _saveLocalUser(user);
    } finally {
      if (mounted) {
        _nameController.clear();
        _emailController.clear();
        _passwordController.clear();
        _activationPlan = 'monthly';
        SnackbarUtils.showSuccess(context, 'تم إنشاء حساب العميل');
        setState(() {
          _isCreating = false;
          _usersFuture = _loadUsers();
        });
      }
    }
  }

  Future<void> _deleteLocalUser(_AdminUser user) async {
    final users = (await _loadLocalUsers())
        .where((item) => item.email.toLowerCase() != user.email.toLowerCase())
        .toList();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      _localUsersKey,
      users.map((item) => jsonEncode(item.toJson())).toList(),
    );
  }

  Future<void> _deleteUser(_AdminUser user) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('حذف الحساب'),
        content: Text(
          'سيتم حذف حساب ${user.name} وكل بياناته المرتبطة. هل تريد المتابعة؟',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.red),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('حذف'),
          ),
        ],
      ),
    );

    if (confirmed != true) {
      return;
    }

    try {
      if (user.isLocal) {
        await _deleteLocalUser(user);
      } else {
        await _apiClient.delete('/users/${user.id}');
      }
      if (!mounted) return;
      SnackbarUtils.showSuccess(context, 'تم حذف الحساب');
      setState(() {
        _usersFuture = _loadUsers();
      });
    } on ApiException catch (error) {
      if (!mounted) return;
      SnackbarUtils.showError(context, error.message);
    }
  }

  DateTime? _activationEndsAt(String plan) {
    final now = DateTime.now();
    return switch (plan) {
      'monthly' => DateTime(now.year, now.month + 1, now.day),
      'yearly' => DateTime(now.year + 1, now.month, now.day),
      _ => null,
    };
  }

  Future<void> _logout() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تسجيل خروج'),
        content: const Text('هل تريد تسجيل الخروج من لوحة إدارة التطبيق؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('تسجيل خروج'),
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
    await _apiClient.clearToken();

    if (!mounted) {
      return;
    }

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (_) => false,
    );
  }

  void _openUserOverview(_AdminUser user) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => _AdminUserOverviewPage(user: user)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('إدارة التطبيق'),
        leading: IconButton(
          tooltip: 'تسجيل خروج',
          onPressed: _logout,
          icon: const Icon(Iconsax.logout_1),
        ),
        actions: [
          IconButton(
            tooltip: 'تحديث',
            onPressed: () {
              setState(() {
                _usersFuture = _loadUsers();
              });
            },
            icon: const Icon(Iconsax.refresh),
          ),
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              _usersFuture = _loadUsers();
            });
            await _usersFuture;
          },
          child: FutureBuilder<List<_AdminUser>>(
            future: _usersFuture,
            builder: (context, snapshot) {
              final users = snapshot.data ?? const <_AdminUser>[];
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _AdminHeader(
                    connectedToApi: widget.connectedToApi && !_usingLocalUsers,
                  ),
                  const SizedBox(height: 16),
                  _CreateUserCard(
                    formKey: _formKey,
                    nameController: _nameController,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    activationPlan: _activationPlan,
                    onActivationPlanChanged: (value) {
                      setState(() {
                        _activationPlan = value;
                      });
                    },
                    isCreating: _isCreating,
                    onCreate: _createUser,
                  ),
                  const SizedBox(height: 16),
                  if (snapshot.connectionState == ConnectionState.waiting)
                    const SizedBox(
                      height: 140,
                      child: Center(child: CircularProgressIndicator()),
                    )
                  else
                    _UsersCard(
                      users: users,
                      onUserTap: _openUserOverview,
                      onUserDelete: _deleteUser,
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _AdminUserOverviewPage extends StatelessWidget {
  const _AdminUserOverviewPage({required this.user});

  final _AdminUser user;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(title: const Text('نظرة عامة')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            AppSurfaceCard(
              radius: 18,
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.accentBlueSoft,
                    child: Text(
                      user.initial,
                      style: const TextStyle(
                        color: AppColors.accentBlueDark,
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    user.name,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    user.email,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.textTheme.bodyLarge?.color?.withValues(
                        alpha: 0.68,
                      ),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _OverviewRow(
              icon: Iconsax.security_user,
              label: 'نوع الحساب',
              value: user.role == 'admin' ? 'مدير' : 'عميل',
            ),
            const SizedBox(height: 10),
            _OverviewRow(
              icon: Iconsax.sms,
              label: 'البريد الإلكتروني',
              value: user.email,
              ltrValue: true,
            ),
            const SizedBox(height: 10),
            _OverviewRow(
              icon: Iconsax.calendar,
              label: 'تاريخ الإنشاء',
              value: _formatDate(user.createdAt),
            ),
            const SizedBox(height: 10),
            _OverviewRow(
              icon: Iconsax.timer_1,
              label: 'مدة التفعيل',
              value: user.activationPlanLabel,
            ),
            const SizedBox(height: 10),
            _OverviewRow(
              icon: Iconsax.calendar_tick,
              label: 'نهاية التفعيل',
              value: user.activationEndsAt == null
                  ? 'دائم'
                  : _formatDate(user.activationEndsAt!),
            ),
            const SizedBox(height: 10),
            _OverviewRow(
              icon: Iconsax.profile_2user,
              label: 'عدد اللاعبين',
              value: '${user.playersCount}',
            ),
            const SizedBox(height: 10),
            _OverviewRow(
              icon: Iconsax.money,
              label: 'إيراد الشهر',
              value: user.formatMoney(user.monthlyRevenue),
            ),
            const SizedBox(height: 10),
            _OverviewRow(
              icon: Iconsax.chart_2,
              label: 'إيراد السنة',
              value: user.formatMoney(user.yearlyRevenue),
            ),
          ],
        ),
      ),
    );
  }

  static String _formatDate(DateTime date) {
    return '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}';
  }
}

class _AdminHeader extends StatelessWidget {
  const _AdminHeader({required this.connectedToApi});

  final bool connectedToApi;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppSurfaceCard(
      radius: 18,
      padding: const EdgeInsets.all(18),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.accentBlueSoft,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(
              Iconsax.profile_2user,
              color: AppColors.accentBlueDark,
              size: 30,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'حسابات العملاء',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  connectedToApi
                      ? 'متصل بالخادم'
                      : 'الحسابات تحفظ محليا لحين تحديث الخادم',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: connectedToApi
                        ? AppColors.green
                        : AppColors.orangeDark,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CreateUserCard extends StatelessWidget {
  const _CreateUserCard({
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.activationPlan,
    required this.onActivationPlanChanged,
    required this.isCreating,
    required this.onCreate,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String activationPlan;
  final ValueChanged<String> onActivationPlanChanged;
  final bool isCreating;
  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppSurfaceCard(
      radius: 18,
      padding: const EdgeInsets.all(18),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'إنشاء حساب عميل',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'اسم العميل',
                prefixIcon: Icon(Iconsax.user),
              ),
              validator: (value) {
                if (value == null || value.trim().length < 2) {
                  return 'اكتب اسم صحيح';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textDirection: TextDirection.ltr,
              decoration: const InputDecoration(
                labelText: 'البريد الإلكتروني',
                prefixIcon: Icon(Iconsax.sms),
              ),
              validator: (value) {
                final text = value?.trim() ?? '';
                if (!text.contains('@') || !text.contains('.')) {
                  return 'اكتب بريد إلكتروني صحيح';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              textDirection: TextDirection.ltr,
              decoration: const InputDecoration(
                labelText: 'كلمة المرور',
                prefixIcon: Icon(Iconsax.lock),
              ),
              validator: (value) {
                if (value == null || value.length < 6) {
                  return 'كلمة المرور 6 أحرف على الأقل';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: activationPlan,
              decoration: const InputDecoration(
                labelText: 'مدة تفعيل الحساب',
                prefixIcon: Icon(Iconsax.timer_1),
              ),
              items: const [
                DropdownMenuItem(value: 'monthly', child: Text('شهري')),
                DropdownMenuItem(value: 'yearly', child: Text('سنوي')),
                DropdownMenuItem(value: 'permanent', child: Text('دائم')),
              ],
              onChanged: (value) {
                if (value != null) {
                  onActivationPlanChanged(value);
                }
              },
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 52,
              child: ElevatedButton.icon(
                onPressed: isCreating ? null : onCreate,
                icon: isCreating
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Icon(Iconsax.add),
                label: Text(isCreating ? 'جاري الإنشاء' : 'إنشاء حساب العميل'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UsersCard extends StatelessWidget {
  const _UsersCard({
    required this.users,
    required this.onUserTap,
    required this.onUserDelete,
  });

  final List<_AdminUser> users;
  final ValueChanged<_AdminUser> onUserTap;
  final ValueChanged<_AdminUser> onUserDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppSurfaceCard(
      radius: 18,
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'المستخدمون',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 12),
          if (users.isEmpty)
            Text(
              'لا توجد حسابات عملاء حتى الآن',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.textTheme.bodyMedium?.color?.withValues(
                  alpha: 0.64,
                ),
              ),
            )
          else
            ...users.map(
              (user) => ListTile(
                contentPadding: EdgeInsets.zero,
                onTap: () => onUserTap(user),
                leading: CircleAvatar(
                  backgroundColor: AppColors.accentBlueSoft,
                  child: Text(
                    user.initial,
                    style: const TextStyle(
                      color: AppColors.accentBlueDark,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                title: Text(
                  user.name,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                subtitle: Text(user.email, textDirection: TextDirection.ltr),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      tooltip: 'حذف الحساب',
                      onPressed: () => onUserDelete(user),
                      icon: const Icon(
                        Iconsax.trash,
                        color: AppColors.red,
                        size: 20,
                      ),
                    ),
                    const Icon(Iconsax.arrow_left_2, size: 18),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _OverviewRow extends StatelessWidget {
  const _OverviewRow({
    required this.icon,
    required this.label,
    required this.value,
    this.ltrValue = false,
  });

  final IconData icon;
  final String label;
  final String value;
  final bool ltrValue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppSurfaceCard(
      radius: 16,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(icon, color: AppColors.accentBlueDark),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.textTheme.bodyMedium?.color?.withValues(
                  alpha: 0.68,
                ),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              textDirection: ltrValue ? TextDirection.ltr : null,
              style: const TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }
}

class _AdminUser {
  const _AdminUser({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.source,
    required this.activationPlan,
    required this.activationStartsAt,
    required this.activationEndsAt,
    required this.createdAt,
    required this.playersCount,
    required this.monthlyRevenue,
    required this.yearlyRevenue,
  });

  factory _AdminUser.fromJson(Map<String, dynamic> json, {String? source}) {
    final email = json['email']?.toString() ?? '';
    final stats = json['stats'] is Map
        ? Map<String, dynamic>.from(json['stats'] as Map)
        : const <String, dynamic>{};
    final createdAt =
        DateTime.tryParse(json['createdAt']?.toString() ?? '') ??
        DateTime.now();
    return _AdminUser(
      id: json['id']?.toString() ?? email,
      name: json['name']?.toString() ?? '',
      email: email,
      role: json['role']?.toString() ?? 'user',
      source: source ?? json['source']?.toString() ?? 'محلي',
      activationPlan: json['activationPlan']?.toString() ?? 'monthly',
      activationStartsAt:
          DateTime.tryParse(json['activationStartsAt']?.toString() ?? '') ??
          createdAt,
      activationEndsAt: DateTime.tryParse(
        json['activationEndsAt']?.toString() ?? '',
      ),
      createdAt: createdAt,
      playersCount: int.tryParse(stats['playersCount']?.toString() ?? '') ?? 0,
      monthlyRevenue:
          double.tryParse(stats['monthlyRevenue']?.toString() ?? '') ?? 0,
      yearlyRevenue:
          double.tryParse(stats['yearlyRevenue']?.toString() ?? '') ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'source': source,
      'activationPlan': activationPlan,
      'activationStartsAt': activationStartsAt.toIso8601String(),
      'activationEndsAt': activationEndsAt?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'stats': {
        'playersCount': playersCount,
        'monthlyRevenue': monthlyRevenue,
        'yearlyRevenue': yearlyRevenue,
      },
    };
  }

  String get initial {
    final trimmed = name.trim();
    return trimmed.isEmpty ? '?' : trimmed.characters.first;
  }

  bool get isLocal => source == 'محلي' || id.startsWith('local-');

  String get activationPlanLabel {
    return switch (activationPlan) {
      'yearly' => 'سنوي',
      'permanent' => 'دائم',
      _ => 'شهري',
    };
  }

  String formatMoney(double value) => '${value.toStringAsFixed(0)} جنيه';

  final String id;
  final String name;
  final String email;
  final String role;
  final String source;
  final String activationPlan;
  final DateTime activationStartsAt;
  final DateTime? activationEndsAt;
  final DateTime createdAt;
  final int playersCount;
  final double monthlyRevenue;
  final double yearlyRevenue;
}
