import 'package:flutter_test/flutter_test.dart';
import 'package:skillhub/app/app.dart';

void main() {
  testWidgets('splash screen transitions to the login page', (tester) async {
    await tester.pumpWidget(const SkillHubApp());

    expect(find.text('منصة إدارة ذكية للأكاديميات واللاعبين'), findsOneWidget);
    expect(find.text('تسجيل الدخول'), findsNothing);

    await tester.pump(const Duration(milliseconds: 2800));
    await tester.pumpAndSettle();

    expect(find.text('تسجيل الدخول'), findsOneWidget);
    expect(find.text('الإيميل أو اسم المستخدم'), findsOneWidget);
    expect(find.text('كلمة المرور'), findsOneWidget);
    expect(find.text('افتكرني'), findsOneWidget);
    expect(find.text('كلم الدعم'), findsOneWidget);
    expect(find.text('دخول'), findsOneWidget);
  });
}
