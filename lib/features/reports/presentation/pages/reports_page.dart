import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/widgets/app_back_button.dart';
import 'package:skillhub/core/widgets/app_surface_card.dart';
import 'package:skillhub/features/reports/presentation/widgets/report_options_bottom_sheet.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  String _selectedTimePeriod = 'كل الوقت';
  String _selectedStatus = 'الكل';

  final List<String> _timePeriods = [
    'هذا الشهر',
    'آخر 3 أشهر',
    'هذه السنة',
    'كل الوقت',
  ];
  final List<String> _statuses = ['الكل', 'نشط', 'منتهي'];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          leading: const AppBackButton(),
          title: Text(
            'التقارير',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              color: AppColors.white,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'الفترة الزمنية',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _timePeriods.map((period) {
                        final isSelected = _selectedTimePeriod == period;
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedTimePeriod = period;
                              });
                            },
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.orange
                                    : AppColors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: isSelected
                                      ? AppColors.orange
                                      : AppColors.border,
                                ),
                              ),
                              child: Text(
                                period,
                                style: TextStyle(
                                  color: isSelected
                                      ? AppColors.white
                                      : AppColors.textPrimary,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'حالة الاشتراك',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: _statuses.map((status) {
                      final isSelected = _selectedStatus == status;
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedStatus = status;
                            });
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.navy
                                  : AppColors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.navy
                                    : AppColors.border,
                              ),
                            ),
                            child: Text(
                              status,
                              style: TextStyle(
                                color: isSelected
                                    ? AppColors.white
                                    : AppColors.textPrimary,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildReportCard(
                      title: 'تقرير اللاعبين',
                      subtitle:
                          'قائمة اللاعبين المسجلين مع حالة اشتراكاتهم ومعلومات أولياء الأمور',
                      icon: Iconsax.profile_2user,
                      color: AppColors.navy,
                    ),
                    const SizedBox(height: 12),
                    _buildReportCard(
                      title: 'تقرير الاشتراكات',
                      subtitle:
                          'سجل الاشتراكات والتجديدات مع تفاصيل المبالغ والتواريخ',
                      icon: Iconsax.card,
                      color: AppColors.orange,
                    ),
                    const SizedBox(height: 12),
                    _buildReportCard(
                      title: 'تقرير الإيرادات',
                      subtitle:
                          'ملخص الإيرادات الكلية والشهرية وإحصائيات الاشتراكات',
                      icon: Iconsax.money,
                      color: AppColors.green,
                    ),
                    const SizedBox(height: 12),
                    _buildReportCard(
                      title: 'تقرير التقييمات',
                      subtitle:
                          'سجل تقييمات اللاعبين بجميع المعايير والتقديرات',
                      icon: Iconsax.chart,
                      color: Colors.purple,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return AppSurfaceCard(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            children: [
              SizedBox(
                width: 90,
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      builder: (context) =>
                          ReportOptionsBottomSheet(reportTitle: title),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'إنشاء PDF',
                    style: TextStyle(color: AppColors.white, fontSize: 12),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 90,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColors.green,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Excel',
                    style: TextStyle(color: AppColors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
