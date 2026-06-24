import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xlsio;

class ReportExportData {
  const ReportExportData({
    required this.title,
    required this.timePeriod,
    required this.status,
    this.tableHeaders = const [],
    this.tableRows = const [],
  });

  final String title;
  final String timePeriod;
  final String status;
  final List<String> tableHeaders;
  final List<List<String>> tableRows;

  String get safeFileName {
    final normalized = title
        .replaceAll(RegExp(r'[\\/:*?"<>|]+'), '')
        .replaceAll(RegExp(r'\s+'), '_')
        .trim();
    final stamp = DateTime.now().toIso8601String().replaceAll(':', '-');
    return '${normalized.isEmpty ? 'report' : normalized}_$stamp';
  }

  List<List<String>> get rows => [
    ['البند', 'القيمة'],
    ['اسم التقرير', title],
    ['الفترة الزمنية', timePeriod],
    ['حالة الاشتراك', status],
    ['تاريخ التصدير', _formatDateTime(DateTime.now())],
  ];

  List<List<String>> get exportTableRows {
    if (tableHeaders.isEmpty) {
      return rows;
    }
    return [
      tableHeaders,
      if (tableRows.isEmpty)
        List<String>.generate(
          tableHeaders.length,
          (index) => index == 0 ? 'لا توجد بيانات مطابقة للتصفية' : '',
        )
      else
        ...tableRows,
    ];
  }

  static String _formatDateTime(DateTime value) {
    final date =
        '${value.year}/${value.month.toString().padLeft(2, '0')}/${value.day.toString().padLeft(2, '0')}';
    final time =
        '${value.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}';
    return '$date $time';
  }
}

class ReportExporter {
  const ReportExporter();

  Future<void> sharePdf(ReportExportData data) async {
    final bytes = await buildPdfBytes(data);
    await Printing.sharePdf(bytes: bytes, filename: '${data.safeFileName}.pdf');
  }

  Future<void> shareExcel(ReportExportData data) async {
    final bytes = Uint8List.fromList(buildExcelBytes(data));
    final filename = '${data.safeFileName}.xlsx';
    await SharePlus.instance.share(
      ShareParams(
        title: data.title,
        subject: data.title,
        text: data.title,
        files: [
          XFile.fromData(
            bytes,
            mimeType:
                'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
          ),
        ],
        fileNameOverrides: [filename],
        downloadFallbackEnabled: true,
      ),
    );
  }

  Future<Uint8List> buildPdfBytes(ReportExportData data) async {
    final regularFont = pw.Font.ttf(
      await rootBundle.load('assets/fonts/Cairo-Regular.ttf'),
    );
    final boldFont = pw.Font.ttf(
      await rootBundle.load('assets/fonts/Cairo-Bold.ttf'),
    );
    final pdf = pw.Document(
      title: data.title,
      creator: 'SkillHub',
      author: 'SkillHub',
    );

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        textDirection: pw.TextDirection.rtl,
        theme: pw.ThemeData.withFont(base: regularFont, bold: boldFont),
        margin: const pw.EdgeInsets.all(32),
        build: (context) => [
          pw.Text(
            data.title,
            style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 8),
          pw.Text(
            'تقرير SkillHub',
            style: const pw.TextStyle(color: PdfColors.grey700, fontSize: 12),
          ),
          pw.SizedBox(height: 24),
          pw.TableHelper.fromTextArray(
            headers: data.rows.first,
            data: data.rows.skip(1).toList(),
            border: pw.TableBorder.all(color: PdfColors.grey300),
            headerDecoration: const pw.BoxDecoration(
              color: PdfColors.blueGrey50,
            ),
            headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            cellAlignment: pw.Alignment.centerRight,
            headerAlignment: pw.Alignment.centerRight,
            cellPadding: const pw.EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
            ),
          ),
          pw.SizedBox(height: 20),
          pw.TableHelper.fromTextArray(
            headers: data.exportTableRows.first,
            data: data.exportTableRows.skip(1).toList(),
            border: pw.TableBorder.all(color: PdfColors.grey300),
            headerDecoration: const pw.BoxDecoration(
              color: PdfColors.blueGrey50,
            ),
            headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            cellAlignment: pw.Alignment.centerRight,
            headerAlignment: pw.Alignment.centerRight,
            cellPadding: const pw.EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 7,
            ),
          ),
        ],
      ),
    );

    return pdf.save();
  }

  List<int> buildExcelBytes(ReportExportData data) {
    final workbook = xlsio.Workbook();
    final sheet = workbook.worksheets[0];
    sheet.name = 'Report';
    sheet.isRightToLeft = true;

    sheet.getRangeByName('A1').setText(data.title);
    sheet.getRangeByName('A1:B1').merge();
    sheet.getRangeByName('A1').cellStyle.bold = true;
    sheet.getRangeByName('A1').cellStyle.fontSize = 16;

    for (var rowIndex = 0; rowIndex < data.rows.length; rowIndex += 1) {
      final row = data.rows[rowIndex];
      final excelRow = rowIndex + 3;
      for (var columnIndex = 0; columnIndex < row.length; columnIndex += 1) {
        sheet
            .getRangeByIndex(excelRow, columnIndex + 1)
            .setText(row[columnIndex]);
      }
    }

    final header = sheet.getRangeByName('A3:B3');
    header.cellStyle.bold = true;
    header.cellStyle.backColor = '#EAF0FF';
    final tableStartRow = data.rows.length + 5;
    final table = data.exportTableRows;
    for (var rowIndex = 0; rowIndex < table.length; rowIndex += 1) {
      final row = table[rowIndex];
      final excelRow = tableStartRow + rowIndex;
      for (var columnIndex = 0; columnIndex < row.length; columnIndex += 1) {
        sheet
            .getRangeByIndex(excelRow, columnIndex + 1)
            .setText(row[columnIndex]);
      }
    }
    final tableHeader = sheet.getRangeByIndex(
      tableStartRow,
      1,
      tableStartRow,
      table.first.length,
    );
    tableHeader.cellStyle.bold = true;
    tableHeader.cellStyle.backColor = '#EAF0FF';
    sheet
            .getRangeByIndex(
              1,
              1,
              tableStartRow + table.length,
              table.first.length,
            )
            .cellStyle
            .fontName =
        'Arial';
    sheet.getRangeByIndex(1, 1).columnWidth = 24;
    for (var column = 2; column <= table.first.length; column += 1) {
      sheet.getRangeByIndex(1, column).columnWidth = 22;
    }

    final bytes = workbook.saveAsStream();
    workbook.dispose();
    return bytes;
  }
}
