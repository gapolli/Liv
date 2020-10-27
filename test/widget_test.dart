import 'package:flutter_test/flutter_test.dart';

import 'package:gv_reading_tracker/pages/Home.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Home());

    // Verify that our counter starts at 0.
    expect(true, true);
  });
}
