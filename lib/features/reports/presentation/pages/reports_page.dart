import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skillhub/core/theme/app_colors.dart';
import 'package:skillhub/core/utils/snackbar_utils.dart';
import 'package:skillhub/core/widgets/app_blue_page_header.dart';
import 'package:skillhub/core/widgets/app_surface_card.dart';
import 'package:skillhub/features/reports/data/report_exporter.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  String _selectedTimePeriod = 'كل الوقت';
  String _selectedStatus = 'الكل';
  bool _isExporting = false;

  static const _reportExporter = ReportExporter();

  static const List<String> _timePeriods = [
    'هذا الشهر',
    'آخر 3 أشهر',
    'هذه السنة',
    'كل الوقت',
  ];
  static const List<String> _statuses = ['الكل', 'نشط', 'منتهي'];

  static const List<_ReportItem> _reports = [
    _ReportItem(
      title: 'تقرير اللاعبين',
      subtitle:
          'قائمة اللاعبين المسجلين مع حالة اشتراكاتهم ومعلومات أولياء الأمور',
      metric: 'بيانات اللاعبين',
      icon: Iconsax.profile_2user,
      color: AppColors.navy,
    ),
    _ReportItem(
      title: 'تقرير الاشتراكات',
      subtitle: 'سجل الاشتراكات والتجديدات مع تفاصيل المبالغ والتواريخ',
      metric: 'حركة الاشتراكات',
      icon: Iconsax.card,
      color: AppColors.orange,
    ),
    _ReportItem(
      title: 'تقرير الإيرادات',
      subtitle: 'ملخص الإيرادات الكلية والشهرية وإحصائيات الاشتراكات',
      metric: 'ملخص مالي',
      icon: Iconsax.money,
      color: AppColors.green,
    ),
    _ReportItem(
      title: 'تقرير التقييمات',
      subtitle: 'سجل تقييمات اللاعبين بجميع المعايير والتقديرات',
      metric: 'أداء اللاعبين',
      icon: Iconsax.chart,
      color: AppColors.accentBlueDark,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: CustomScrollView(
          slivers: [
            const AppBluePageHeader(title: 'التقارير'),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
              sliver: SliverList(
                delegate: SliverChildListDelegate.fixed([
                  _ReportFiltersCard(
                    selectedTimePeriod: _selectedTimePeriod,
                    selectedStatus: _selectedStatus,
                    timePeriods: _timePeriods,
                    statuses: _statuses,
                    onTimePeriodChanged: (value) {
                      setState(() => _selectedTimePeriod = value);
                    },
                    onStatusChanged: (value) {
                      setState(() => _selectedStatus = value);
                    },
                  ),
                  const SizedBox(height: 18),
                  _SectionTitle(count: _reports.length),
                  const SizedBox(height: 10),
                  ..._reports.expand(
                    (report) => [
                      _ReportCard(
                        report: report,
                        isExporting: _isExporting,
                        onPdfPressed: () => _shareReport(
                          report.title,
                          format: _ReportExportFormat.pdf,
                        ),
                        onExcelPressed: () => _shareReport(
                          report.title,
                          format: _ReportExportFormat.excel,
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _shareReport(
    String title, {
    required _ReportExportFormat format,
  }) async {
    if (_isExporting) {
      return;
    }

    setState(() => _isExporting = true);
    final data = ReportExportData(
      title: title,
      timePeriod: _selectedTimePeriod,
      status: _selectedStatus,
    );

    try {
      switch (format) {
        case _ReportExportFormat.pdf:
          await _reportExporter.sharePdf(data);
        case _ReportExportFormat.excel:
          await _reportExporter.shareExcel(data);
      }
    } catch (_) {
      if (!mounted) return;
      SnackbarUtils.showError(context, 'تعذر تجهيز الملف. حاول مرة أخرى.');
    } finally {
      if (mounted) {
        setState(() => _isExporting = false);
      }
    }
  }
}

enum _ReportExportFormat { pdf, excel }

class _ReportFiltersCard extends StatelessWidget {
  const _ReportFiltersCard({
    required this.selectedTimePeriod,
    required this.selectedStatus,
    required this.timePeriods,
    required this.statuses,
    required this.onTimePeriodChanged,
    required this.onStatusChanged,
  });

  final String selectedTimePeriod;
  final String selectedStatus;
  final List<String> timePeriods;
  final List<String> statuses;
  final ValueChanged<String> onTimePeriodChanged;
  final ValueChanged<String> onStatusChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppSurfaceCard(
      radius: 20,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 2, 4, 10),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: AppColors.accentBlueSoft,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Iconsax.document_filter,
                    color: AppColors.accentBlueDark,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'تصفية التقارير',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '$selectedTimePeriod • $selectedStatus',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.58,
                          ),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _FilterSection(
                  icon: Iconsax.calendar,
                  title: 'الفترة الزمنية',
                  selectedValue: selectedTimePeriod,
                  accentColor: AppColors.orange,
                  child: _FilterChipWrap(
                    values: timePeriods,
                    selectedValue: selectedTimePeriod,
                    selectedColor: AppColors.orange,
                    onChanged: onTimePeriodChanged,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _FilterSection(
                  icon: Iconsax.filter,
                  title: 'حالة الاشتراك',
                  selectedValue: selectedStatus,
                  accentColor: AppColors.accentBlueDark,
                  child: _FilterChipWrap(
                    values: statuses,
                    selectedValue: selectedStatus,
                    selectedColor: AppColors.accentBlueDark,
                    onChanged: onStatusChanged,
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

class _FilterSection extends StatelessWidget {
  const _FilterSection({
    required this.icon,
    required this.title,
    required this.selectedValue,
    required this.accentColor,
    required this.child,
  });

  final IconData icon;
  final String title;
  final String selectedValue;
  final Color accentColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: accentColor.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: accentColor.withValues(alpha: 0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Icon(icon, size: 18, color: accentColor),
              ),
              const SizedBox(width: 9),
              Expanded(
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.72),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: accentColor.withValues(alpha: 0.18),
                  ),
                ),
                child: Text(
                  selectedValue,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: accentColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _FilterChipWrap extends StatelessWidget {
  const _FilterChipWrap({
    required this.values,
    required this.selectedValue,
    required this.selectedColor,
    required this.onChanged,
  });

  final List<String> values;
  final String selectedValue;
  final Color selectedColor;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final chipWidth = constraints.maxWidth < 220
            ? constraints.maxWidth
            : constraints.maxWidth >= 320
            ? (constraints.maxWidth - 8) / 2
            : null;

        return Wrap(
          spacing: 8,
          runSpacing: 8,
          children: values.map((value) {
            final isSelected = selectedValue == value;
            return SizedBox(
              width: chipWidth,
              height: 42,
              child: ChoiceChip(
                label: Center(child: Text(value)),
                selected: isSelected,
                onSelected: (_) => onChanged(value),
                showCheckmark: false,
                visualDensity: VisualDensity.standard,
                labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                selectedColor: selectedColor,
                backgroundColor: Theme.of(context).colorScheme.surface,
                side: BorderSide(
                  color: isSelected
                      ? selectedColor
                      : Theme.of(context).dividerColor,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                labelStyle: TextStyle(
                  color: isSelected
                      ? AppColors.white
                      : Theme.of(context).colorScheme.onSurface,
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.w900 : FontWeight.w800,
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Text(
            'التقارير المتاحة',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.orangeSoft,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '$count تقارير',
            style: const TextStyle(
              color: AppColors.orangeDark,
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}

class _ReportCard extends StatelessWidget {
  const _ReportCard({
    required this.report,
    required this.isExporting,
    required this.onPdfPressed,
    required this.onExcelPressed,
  });

  final _ReportItem report;
  final bool isExporting;
  final VoidCallback onPdfPressed;
  final VoidCallback onExcelPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppSurfaceCard(
      radius: 18,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: report.color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(report.icon, color: report.color, size: 27),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            report.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        _ReportBadge(label: report.metric, color: report.color),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      report.subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.62,
                        ),
                        height: 1.45,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          LayoutBuilder(
            builder: (context, constraints) {
              final pdfButton = _ExportButton(
                label: 'PDF',
                icon: Iconsax.document_download,
                color: AppColors.orange,
                onPressed: isExporting ? null : onPdfPressed,
              );
              final excelButton = _ExportButton(
                label: 'Excel',
                icon: Iconsax.document_text,
                color: AppColors.green,
                onPressed: isExporting ? null : onExcelPressed,
              );

              return Row(
                children: [
                  Expanded(child: pdfButton),
                  const SizedBox(width: 10),
                  Expanded(child: excelButton),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ReportBadge extends StatelessWidget {
  const _ReportBadge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 10.5,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class _ExportButton extends StatelessWidget {
  const _ExportButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: color,
          foregroundColor: AppColors.white,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}

class _ReportItem {
  const _ReportItem({
    required this.title,
    required this.subtitle,
    required this.metric,
    required this.icon,
    required this.color,
  });

  final String title;
  final String subtitle;
  final String metric;
  final IconData icon;
  final Color color;
}
