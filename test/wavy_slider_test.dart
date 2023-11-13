import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wavy_slider/wavy_slider.dart';

void main() {
  testWidgets('WavySlider renders correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WavySlider(
            onChanged: (double value) {
              // Handle onChanged callback
            },
          ),
        ),
      ),
    );

    // Verify that the WavySlider renders correctly.
    expect(find.byType(WavySlider), findsOneWidget);
    expect(find.byType(GestureDetector), findsOneWidget);
    expect(find.byType(Stack), findsOneWidget);
    expect(find.byType(Container), findsNWidgets(3)); // Two Containers in the Stack
    expect(find.byType(WaveLine), findsNWidgets(2)); // One for the slider, one for the background
    expect(find.byType(WavySliderBackground), findsOneWidget);
  });

  // Add more tests as needed...
}
