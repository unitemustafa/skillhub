import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:skillhub/features/reports/data/report_exporter.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const exporter = ReportExporter();
  const reportData = ReportExportData(
    title: 'تقرير الاشتراكات',
    timePeriod: 'كل الوقت',
    status: 'الكل',
  );

  test('builds valid PDF bytes', () async {
    final bytes = await exporter.buildPdfBytes(reportData);
    expect(bytes.length, greaterThan(100));
    expect(ascii.decode(bytes.take(4).toList()), '%PDF');
  });

  test('builds valid Excel xlsx bytes', () {
    final bytes = exporter.buildExcelBytes(reportData);
    expect(bytes.length, greaterThan(100));
    expect(ascii.decode(bytes.take(2).toList()), 'PK');
  });
}
