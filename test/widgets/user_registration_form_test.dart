import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_lab/widgets/user_registration_form.dart';

void main() {
  group('user registration form test with correct inputs', () {
    testWidgets('Validation Messages on empty form fields...', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: UserRegistrationForm())),
      );
      expect(
        find.text('At least 8 characters with numbers and symbols'),
        findsOneWidget,
      );
      await tester.enterText(find.byType(TextField).at(0), 'Abdelrahman');
      await tester.enterText(find.byType(TextField).at(1), 'test@gmail.com');
      await tester.enterText(find.byType(TextField).at(2), 'Aa@123456');
      await tester.enterText(find.byType(TextField).at(3), 'Aa@123456');
      await tester.tap(find.byType(ElevatedButton));

      await tester.pumpAndSettle();
      expect(find.text('Name is required'), findsNothing);
      expect(find.text('Email is required'), findsNothing);
      expect(find.text('Password is required'), findsNothing);
      expect(find.text('Confirm Password is required'), findsNothing);
      expect(find.text('Please enter a valid email'), findsNothing);
      expect(
        find.text(
          'Password must be 8+ chars with upper, lower, number, and symbol',
        ),
        findsNothing,
      );
      expect(find.text('Passwords do not match'), findsNothing);
      await tester.pumpAndSettle();
      expect(find.text('Registration successful!'), findsOneWidget);
    });
  });

  group('user registration form test with wrong inputs', () {
    testWidgets('Validation Messages on empty form fields...', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: UserRegistrationForm())),
      );
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text('Name is required'), findsOneWidget);
      expect(find.text('Email is required'), findsOneWidget);
      expect(find.text('Password is required'), findsOneWidget);
      expect(find.text('Confirm Password is required'), findsOneWidget);
    });
    testWidgets('Validation Message on wrong email format', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: UserRegistrationForm())),
      );
      await tester.enterText(find.byType(TextField).at(1), 'test');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text('Please enter a valid email'), findsOneWidget);
    });
    testWidgets('Validation Message on wrong password format', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: UserRegistrationForm())),
      );
      await tester.enterText(find.byType(TextField).at(2), 'test');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(
        find.text(
          'Password must be 8+ chars with upper, lower, number, and symbol',
        ),
        findsOneWidget,
      );
    });
    testWidgets('Validation Message on wrong confirm password format', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: UserRegistrationForm())),
      );
      await tester.enterText(find.byType(TextField).at(2), 'test');
      await tester.enterText(find.byType(TextField).at(3), 'tesst');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text('Passwords do not match'), findsOneWidget);
    });
  });
}
