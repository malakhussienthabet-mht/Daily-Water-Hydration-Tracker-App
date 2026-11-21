import 'package:flutter_test/flutter_test.dart';
import 'package:dailywater_and_hydrationtracker/main.dart';

void main() {
  testWidgets('App loads smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Water Tracker'), findsOneWidget);
    expect(find.text('Calculate Water Intake'), findsOneWidget);
  });
}
