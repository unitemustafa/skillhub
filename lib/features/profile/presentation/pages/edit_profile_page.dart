import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skillhub/core/localization/app_localizations.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/utils/snackbar_utils.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: 'مدير النظام');
  final _emailController = TextEditingController(text: 'admin@skillhub.com');
  XFile? _imageFile;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (_formKey.currentState?.validate() ?? false) {
      SnackbarUtils.showSuccess(context, context.l10n.profileSaved);
      Navigator.of(context).pop({'image': _imageFile});
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );
      if (pickedFile != null) {
        setState(() {
          _imageFile = pickedFile;
        });
      }
    } catch (e) {
      if (mounted) {
        SnackbarUtils.showError(
          context,
          context.l10n.isArabic
              ? 'حدث خطأ أثناء تحديد الصورة'
              : 'Error selecting image',
        );
      }
    }
  }

  void _showImageSourceBottomSheet() {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final isArabic = l10n.isArabic;
    final secondaryColor =
        theme.textTheme.bodySmall?.color?.withValues(alpha: 0.72) ??
        AppColors.textSecondary;

    showModalBottomSheet(
      context: context,
      backgroundColor: theme.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: theme.dividerColor.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                isArabic ? 'صورة الملف الشخصي' : 'Profile Picture',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                isArabic
                    ? 'اختر مصدر الصورة لتحديث ملفك الشخصي'
                    : 'Select image source to update your profile',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: secondaryColor,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSourceOption(
                    icon: Iconsax.camera,
                    label: isArabic ? 'الكاميرا' : 'Camera',
                    color: AppColors.accentBlue,
                    onTap: () {
                      Navigator.pop(ctx);
                      _pickImage(ImageSource.camera);
                    },
                  ),
                  _buildSourceOption(
                    icon: Iconsax.gallery,
                    label: isArabic ? 'المعرض' : 'Gallery',
                    color: AppColors.greenBright,
                    onTap: () {
                      Navigator.pop(ctx);
                      _pickImage(ImageSource.gallery);
                    },
                  ),
                  if (_imageFile != null)
                    _buildSourceOption(
                      icon: Iconsax.trash,
                      label: isArabic ? 'إزالة' : 'Remove',
                      color: AppColors.red,
                      onTap: () {
                        Navigator.pop(ctx);
                        setState(() {
                          _imageFile = null;
                        });
                      },
                    ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSourceOption({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 90,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 26),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarImage() {
    if (_imageFile != null) {
      if (kIsWeb) {
        return ClipOval(
          child: Image.network(
            _imageFile!.path,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        );
      } else {
        return ClipOval(
          child: Image.file(
            File(_imageFile!.path),
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        );
      }
    }
    return const Icon(Iconsax.user, size: 50, color: AppColors.accentBlue);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            l10n.isArabic ? Iconsax.arrow_right_3 : Iconsax.arrow_left_2,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          l10n.editProfile,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Avatar Section
              Center(
                child: Stack(
                  children: [
                    InkWell(
                      onTap: _showImageSourceBottomSheet,
                      borderRadius: BorderRadius.circular(60),
                      child: Container(
                        width: 120,
                        height: 120,
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
                              color: AppColors.accentBlue.withValues(
                                alpha: 0.2,
                              ),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: _buildAvatarImage(),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _showImageSourceBottomSheet,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: theme.colorScheme.surface,
                              width: 2,
                            ),
                          ),
                          child: const Icon(
                            Iconsax.camera,
                            color: AppColors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ).animate().scale(duration: 400.ms, curve: Curves.easeOutBack),
              ),
              const SizedBox(height: 40),

              // Fields Section
              _buildTextField(
                controller: _nameController,
                label: l10n.fullName,
                icon: Iconsax.user_edit,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.enterName;
                  }
                  return null;
                },
              ).animate().fade(delay: 100.ms).slideY(begin: 0.1),

              const SizedBox(height: 20),

              _buildTextField(
                controller: _emailController,
                label: l10n.email,
                icon: Iconsax.sms,
                readOnly: true,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.enterEmail;
                  }
                  if (!value.contains('@')) {
                    return l10n.validEmail;
                  }
                  return null;
                },
              ).animate().fade(delay: 200.ms).slideY(begin: 0.1),

              const SizedBox(height: 40),

              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                    shadowColor: theme.colorScheme.primary.withValues(
                      alpha: 0.3,
                    ),
                  ),
                  child: Text(
                    l10n.saveChanges,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ).animate().fade(delay: 400.ms).slideY(begin: 0.1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    bool readOnly = false,
  }) {
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onSurface;
    final mutedColor =
        theme.textTheme.bodySmall?.color?.withValues(alpha: 0.72) ??
        AppColors.textSecondary;

    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      showCursor: !readOnly,
      enableInteractiveSelection: !readOnly,
      keyboardType: keyboardType,
      validator: validator,
      style: TextStyle(
        color: readOnly ? mutedColor : textColor,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: mutedColor),
        prefixIcon: Icon(icon, color: mutedColor),
        filled: true,
        fillColor: readOnly
            ? theme.scaffoldBackgroundColor.withValues(alpha: 0.55)
            : theme.inputDecorationTheme.fillColor,
        contentPadding: const EdgeInsets.all(20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: theme.dividerColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: theme.dividerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.red, width: 2),
        ),
      ),
    );
  }
}
