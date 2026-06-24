import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/sync/session_service.dart';
import 'package:skillhub/core/sync/sync_service.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/utils/snackbar_utils.dart';
import 'package:skillhub/core/widgets/app_back_button.dart';
import 'package:skillhub/features/players/domain/models/player_summary.dart';
import 'package:skillhub/features/subscriptions/data/subscriptions_repository.dart';

class NewSubscriptionPage extends StatefulWidget {
  const NewSubscriptionPage({super.key, required this.player});

  final PlayerSummary player;

  @override
  State<NewSubscriptionPage> createState() => _NewSubscriptionPageState();
}

class _NewSubscriptionPageState extends State<NewSubscriptionPage> {
  final _repository = SubscriptionsRepository();
  final _sessionService = SessionService();
  final _syncService = SyncService();
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _notesController = TextEditingController();
  DateTime _startDate = DateTime.now();
  late DateTime _endDate = DateTime(
    _startDate.year,
    _startDate.month + 1,
    _startDate.day,
  );
  bool _isSaving = false;

  @override
  void dispose() {
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickDate({required bool isStart}) async {
    final date = await showDatePicker(
      context: context,
      initialDate: isStart ? _startDate : _endDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );
    if (date == null) return;
    setState(() {
      if (isStart) {
        _startDate = date;
        if (!_endDate.isAfter(_startDate)) {
          _endDate = DateTime(date.year, date.month + 1, date.day);
        }
      } else {
        _endDate = date;
      }
    });
  }

  Future<void> _save() async {
    if (!(_formKey.currentState?.validate() ?? false) || _isSaving) return;
    setState(() => _isSaving = true);
    try {
      final session = await _sessionService.readLastSession();
      if (session == null || session.isExpired) {
        throw Exception(
          'يلزم تسجيل الدخول عبر الإنترنت أولًا قبل استخدام الوضع المحلي.',
        );
      }
      await _repository.createSubscription(session, widget.player, {
        'playerId': widget.player.id,
        'amount': _amountController.text.trim(),
        'startDate': _startDate.toIso8601String(),
        'endDate': _endDate.toIso8601String(),
        'notes': _notesController.text.trim().isEmpty
            ? null
            : _notesController.text.trim(),
      });
      final synced = await _trySync();
      if (!mounted) return;
      SnackbarUtils.showSuccess(
        context,
        synced
            ? 'تم حفظ الاشتراك وتمت المزامنة.'
            : 'تم حفظ الاشتراك وسيتم المزامنة تلقائيًا.',
      );
      Navigator.pop(context, true);
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString(), textAlign: TextAlign.center),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  Future<bool> _trySync() async {
    try {
      await _syncService.syncNow();
      return true;
    } catch (_) {
      return false;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: AppBackButton(enabled: !_isSaving),
          title: Text(
            'اشتراك جديد',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.accentBlueSoft,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Iconsax.user,
                        color: AppColors.accentBlue,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.player.name,
                        style: const TextStyle(
                          color: AppColors.accentBlueDark,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'مبلغ الاشتراك',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'مثال: 500',
                    prefixIcon: Icon(
                      Iconsax.money_4,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  validator: (value) {
                    final amount = double.tryParse((value ?? '').trim());
                    if (amount == null || amount <= 0) {
                      return 'أدخل مبلغ صحيح';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'تاريخ البداية',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  readOnly: true,
                  onTap: () => _pickDate(isStart: true),
                  decoration: InputDecoration(
                    hintText: _formatDate(_startDate),
                    prefixIcon: const Icon(
                      Iconsax.calendar_1,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'تاريخ الانتهاء',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  readOnly: true,
                  onTap: () => _pickDate(isStart: false),
                  decoration: InputDecoration(
                    hintText: _formatDate(_endDate),
                    prefixIcon: const Icon(
                      Iconsax.calendar_1,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  validator: (_) {
                    if (!_endDate.isAfter(_startDate)) {
                      return 'تاريخ الانتهاء يجب أن يكون بعد البداية';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'ملاحظات',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _notesController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: 'ملاحظات اختيارية...',
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(bottom: 50),
                      child: Icon(
                        Iconsax.textalign_justifycenter,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _isSaving ? null : _save,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentBlue,
                      disabledBackgroundColor: AppColors.accentBlue.withValues(
                        alpha: 0.65,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
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
                        : const Icon(Iconsax.card_add, color: AppColors.white),
                    label: const Text(
                      'اشتراك جديد',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
