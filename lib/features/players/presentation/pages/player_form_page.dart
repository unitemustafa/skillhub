import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/sync/session_service.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/utils/snackbar_utils.dart';
import 'package:skillhub/core/widgets/app_back_button.dart';
import 'package:skillhub/core/widgets/app_surface_card.dart';
import 'package:skillhub/features/players/domain/models/player_summary.dart';
import 'package:skillhub/features/players/data/players_repository.dart';

class PlayerFormPage extends StatefulWidget {
  const PlayerFormPage({super.key, this.player});

  final PlayerSummary? player;

  @override
  State<PlayerFormPage> createState() => _PlayerFormPageState();
}

class _PlayerFormPageState extends State<PlayerFormPage> {
  final _playersRepository = PlayersRepository();
  final _sessionService = SessionService();
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _guardianController;
  late final TextEditingController _jobController;
  late final TextEditingController _birthDateController;
  String _relation = 'أب';
  bool _isSaving = false;

  bool get _isEditing => widget.player != null;

  @override
  void initState() {
    super.initState();
    final player = widget.player;
    _nameController = TextEditingController(text: player?.name);
    _phoneController = TextEditingController(text: player?.phone);
    _guardianController = TextEditingController(text: player?.guardianName);
    _jobController = TextEditingController(text: player?.guardianJob);
    _birthDateController = TextEditingController(text: player?.birthDate);
    _relation = player?.guardianRelation ?? 'أب';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _guardianController.dispose();
    _jobController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  Future<void> _pickBirthDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime(2012),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (date == null) return;
    _birthDateController.text =
        '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  Future<void> _save() async {
    if (!(_formKey.currentState?.validate() ?? false) || _isSaving) return;

    setState(() => _isSaving = true);
    final body = <String, dynamic>{
      'name': _nameController.text.trim(),
      'birthDate': _dateToIso(_birthDateController.text.trim()),
      'phone': _phoneController.text.trim(),
      'guardianName': _guardianController.text.trim(),
      'guardianRelation': _relation,
      'guardianJob': _jobController.text.trim().isEmpty
          ? null
          : _jobController.text.trim(),
      'isActive': widget.player?.isActive ?? false,
    };

    try {
      final session = await _sessionService.readLastSession();
      if (session == null) {
        if (!mounted) return;
        SnackbarUtils.showError(
          context,
          'يلزم تسجيل الدخول عبر الإنترنت أولًا.',
        );
        return;
      }
      if (_isEditing) {
        await _playersRepository.updatePlayer(session, widget.player!, body);
      } else {
        await _playersRepository.createPlayer(session, body);
      }
      if (!mounted) return;
      SnackbarUtils.showSuccess(
        context,
        'تم الحفظ محليًا وسيتم المزامنة عند رجوع الإنترنت',
      );
      Navigator.pop(context, true);
    } catch (error) {
      if (!mounted) return;
      SnackbarUtils.showError(context, error.toString());
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  String _dateToIso(String value) {
    final parts = value.split('/');
    if (parts.length != 3) {
      return value;
    }
    final day = int.tryParse(parts[0]);
    final month = int.tryParse(parts[1]);
    final year = int.tryParse(parts[2]);
    if (day == null || month == null || year == null) {
      return value;
    }
    return DateTime(year, month, day).toIso8601String();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: AppBackButton(enabled: !_isSaving),
          title: Text(_isEditing ? 'تعديل بيانات اللاعب' : 'إضافة لاعب جديد'),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _Section(
                      title: 'بيانات اللاعب',
                      icon: Iconsax.user,
                      children: [
                        _field(
                          controller: _nameController,
                          label: 'اسم اللاعب بالكامل',
                          icon: Iconsax.user,
                          validator: _required,
                        ),
                        const SizedBox(height: 14),
                        _field(
                          controller: _birthDateController,
                          label: 'تاريخ الميلاد',
                          icon: Iconsax.calendar,
                          readOnly: true,
                          onTap: _pickBirthDate,
                          validator: _required,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _Section(
                      title: 'بيانات ولي الأمر',
                      icon: Iconsax.people,
                      children: [
                        _field(
                          controller: _guardianController,
                          label: 'اسم ولي الأمر',
                          icon: Iconsax.user_octagon,
                          validator: _required,
                        ),
                        const SizedBox(height: 14),
                        DropdownButtonFormField<String>(
                          initialValue: _relation,
                          decoration: const InputDecoration(
                            labelText: 'صلة القرابة',
                            prefixIcon: Icon(Iconsax.people),
                          ),
                          items: const ['أب', 'أم', 'أخ', 'أخت', 'وصي']
                              .map(
                                (value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                ),
                              )
                              .toList(),
                          onChanged: (value) => _relation = value ?? _relation,
                        ),
                        const SizedBox(height: 14),
                        _field(
                          controller: _phoneController,
                          label: 'رقم الهاتف',
                          icon: Iconsax.call,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if ((value ?? '').trim().length < 10) {
                              return 'أدخل رقم هاتف صحيح';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 14),
                        _field(
                          controller: _jobController,
                          label: 'المهنة (اختياري)',
                          icon: Iconsax.briefcase,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 52,
                      child: ElevatedButton.icon(
                        onPressed: _isSaving ? null : _save,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accentBlue,
                          disabledBackgroundColor: AppColors.accentBlue
                              .withValues(alpha: 0.65),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon: _isSaving
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(
                                Iconsax.tick_circle,
                                color: Colors.white,
                              ),
                        label: Text(
                          _isEditing ? 'حفظ التعديلات' : 'إضافة اللاعب',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? _required(String? value) {
    return (value ?? '').trim().isEmpty ? 'هذا الحقل مطلوب' : null;
  }

  Widget _field({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(labelText: label, prefixIcon: Icon(icon)),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({
    required this.title,
    required this.icon,
    required this.children,
  });

  final String title;
  final IconData icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return AppSurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.accentBlue, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...children,
        ],
      ),
    );
  }
}
