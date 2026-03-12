// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:state_management_bloc/main.dart';

void main() {
  testWidgets('AnimatedSwitcher toggles compact and expanded card', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Order #1042'), findsOneWidget);
    expect(find.text('Status: Out for delivery'), findsNothing);
    expect(find.text('Show Details'), findsOneWidget);

    await tester.tap(find.text('Show Details'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 900));

    expect(find.text('Status: Out for delivery'), findsOneWidget);
    expect(find.text('Show Compact View'), findsOneWidget);
  });
}
