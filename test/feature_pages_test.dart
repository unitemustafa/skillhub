import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skillhub/features/communications/presentation/pages/messages_page.dart';
import 'package:skillhub/features/evaluations/presentation/pages/evaluations_page.dart';
import 'package:skillhub/features/finances/presentation/pages/finances_page.dart';
import 'package:skillhub/features/players/domain/models/player_summary.dart';
import 'package:skillhub/features/players/presentation/pages/player_form_page.dart';
import 'package:skillhub/features/subscriptions/presentation/pages/subscriptions_page.dart';

void main() {
  const playerFixture = PlayerSummary(
    id: 'Y-TEST',
    name: 'لاعب اختبار',
    ageLabel: '12 سنة',
    phone: '01000000000',
    guardianName: 'ولي أمر اختبار',
    guardianRelation: 'أب',
    birthDate: '01/01/2014',
  );

  Future<void> pumpPage(WidgetTester tester, Widget page) async {
    tester.view.physicalSize = const Size(1200, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(MaterialApp(home: page));
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump(const Duration(seconds: 9));
  }

  testWidgets('player form supports add mode', (tester) async {
    await pumpPage(tester, const PlayerFormPage());
    expect(find.text('إضافة لاعب جديد'), findsOneWidget);
    expect(find.text('بيانات ولي الأمر'), findsOneWidget);
  });

  testWidgets('subscriptions management page renders', (tester) async {
    await pumpPage(tester, const SubscriptionsPage());
    expect(find.text('إدارة الاشتراكات'), findsOneWidget);
    expect(find.text('الاشتراكات النشطة'), findsOneWidget);
  });

  testWidgets('finances page renders summary and transactions', (tester) async {
    await pumpPage(tester, const FinancesPage());
    expect(find.text('الإيرادات والمصروفات'), findsOneWidget);
    expect(find.text('صافي الرصيد'), findsOneWidget);
  });

  testWidgets('evaluations history page renders', (tester) async {
    await pumpPage(tester, const EvaluationsPage(player: playerFixture));
    expect(find.text('سجل التقييمات'), findsOneWidget);
    expect(find.text('متوسط الأداء'), findsOneWidget);
  });

  testWidgets('messages page renders templates and composer', (tester) async {
    await pumpPage(tester, const MessagesPage(player: playerFixture));
    expect(find.text('الرسائل والتذكيرات'), findsOneWidget);
    expect(find.text('قالب الرسالة'), findsOneWidget);
  });

  testWidgets('feature pages do not overflow on a phone viewport', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final pages = <Widget>[
      const PlayerFormPage(),
      const SubscriptionsPage(),
      const FinancesPage(),
      const EvaluationsPage(player: playerFixture),
      const MessagesPage(player: playerFixture),
    ];

    for (final page in pages) {
      await tester.pumpWidget(MaterialApp(home: page));
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(const Duration(seconds: 9));
      expect(
        tester.takeException(),
        isNull,
        reason: '${page.runtimeType} overflowed on a phone viewport',
      );
    }
  });
}
