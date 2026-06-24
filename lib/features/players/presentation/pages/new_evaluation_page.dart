import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/sync/session_service.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/widgets/app_back_button.dart';
import 'package:skillhub/core/widgets/app_surface_card.dart';
import 'package:skillhub/features/evaluations/data/evaluations_repository.dart';
import 'package:skillhub/features/players/domain/models/player_summary.dart';

class NewEvaluationPage extends StatefulWidget {
  const NewEvaluationPage({super.key, required this.player});

  final PlayerSummary player;

  @override
  State<NewEvaluationPage> createState() => _NewEvaluationPageState();
}

class _NewEvaluationPageState extends State<NewEvaluationPage> {
  final _repository = EvaluationsRepository();
  final _sessionService = SessionService();
  final _coachController = TextEditingController(text: 'كابتن محمد');
  final _notesController = TextEditingController();
  final Map<String, double> _scores = {
    'اللياقة': 5,
    'السرعة': 5,
    'المهارة': 5,
    'الالتزام': 5,
    'العمل الجماعي': 5,
  };
  DateTime _evaluationDate = DateTime.now();
  bool _isSaving = false;

  @override
  void dispose() {
    _coachController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _evaluationDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (date == null) return;
    setState(() => _evaluationDate = date);
  }

  Future<void> _save() async {
    if (_coachController.text.trim().length < 2 || _isSaving) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('أدخل اسم المدرب', textAlign: TextAlign.center),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
      return;
    }

    setState(() => _isSaving = true);
    try {
      final session = await _sessionService.readLastSession();
      if (session == null || session.isExpired) {
        throw Exception(
          'يلزم تسجيل الدخول عبر الإنترنت أولًا قبل استخدام الوضع المحلي.',
        );
      }
      await _repository.createEvaluation(session, widget.player, {
        'playerId': widget.player.id,
        'coach': _coachController.text.trim(),
        'evaluationDate': _evaluationDate.toIso8601String(),
        'fitness': _scores['اللياقة']!.round(),
        'speed': _scores['السرعة']!.round(),
        'skill': _scores['المهارة']!.round(),
        'discipline': _scores['الالتزام']!.round(),
        'teamwork': _scores['العمل الجماعي']!.round(),
        'notes': _notesController.text.trim(),
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'تم الحفظ محليًا وسيتم المزامنة عند رجوع الإنترنت',
            textAlign: TextAlign.center,
          ),
          behavior: SnackBarBehavior.floating,
        ),
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
            'تقييم جديد',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.accentBlueSoft,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.player.name,
                        style: const TextStyle(
                          color: AppColors.accentBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Iconsax.user,
                        color: AppColors.accentBlue,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              AppSurfaceCard(
                child: Column(
                  children: [
                    TextField(
                      controller: _coachController,
                      decoration: const InputDecoration(
                        labelText: 'اسم المدرب',
                        prefixIcon: Icon(Iconsax.user_edit),
                      ),
                    ),
                    const SizedBox(height: 12),
                    InkWell(
                      onTap: _pickDate,
                      borderRadius: BorderRadius.circular(12),
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'تاريخ التقييم',
                          prefixIcon: Icon(Iconsax.calendar),
                        ),
                        child: Text(_formatDate(_evaluationDate)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              AppSurfaceCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'درجات التقييم',
                      style: TextStyle(
                        color: AppColors.navy,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ..._scores.keys.map((metric) => _buildSliderRow(metric)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _notesController,
                minLines: 3,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'ملاحظات',
                  prefixIcon: Icon(Iconsax.note),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
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
                  child: _isSaving
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          'حفظ التقييم',
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
    );
  }

  Widget _buildSliderRow(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: AppColors.accentBlue,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  _scores[title]!.round().toString(),
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Directionality(
            textDirection: TextDirection.ltr,
            child: Slider(
              value: _scores[title]!,
              min: 1,
              max: 10,
              divisions: 9,
              onChanged: (value) {
                setState(() {
                  _scores[title] = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
