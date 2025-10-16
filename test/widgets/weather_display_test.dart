import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_lab/widgets/weather_display.dart';

void main() {
  group('WeatherDisplay Widget Tests', () {
    testWidgets('shows loading indicator initially', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: WeatherDisplay())),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pumpAndSettle();
    });

    testWidgets('shows switch, button, dropdown, and card after loading', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: WeatherDisplay())),
      );
      await tester.pumpAndSettle();
      expect(find.byType(Switch), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.byType(DropdownButton<String>), findsOneWidget);
      expect(find.byType(Card), findsOneWidget);
      expect(find.byType(Text), findsWidgets);
    });

    testWidgets('switch toggles temperature unit', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: WeatherDisplay())),
      );
      await tester.pumpAndSettle();
      expect(find.text('Celsius'), findsOneWidget);
      await tester.tap(find.byType(Switch));
      await tester.pump();
      expect(find.text('Fahrenheit'), findsOneWidget);
    });
  });
}
