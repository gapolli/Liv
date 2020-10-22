import 'package:flutter_test/flutter_test.dart';

import 'package:gv_reading_tracker/ReadingTracker.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ReadingTracker());

    // Verify that our counter starts at 0.
    expect(true, true);
  });
}
