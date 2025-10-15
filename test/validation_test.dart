import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_lab/common/validation/form_field_validation.dart';

void main() {
  late FormFieldValidation validation;
  setUp(() {
    validation = FormFieldValidation();
  });
  tearDown(() {
    validation = FormFieldValidation();
  });
  group('Name Validation test -', () {
    test('when name is null or empty then return error message', () {
      //arrange
      String? name;
      //act
      String? result = validation.validateName(name);
      String? result2 = validation.validateName('');
      //assert
      expect(result, 'Name is required');
      expect(result2, 'Name is required');
    });
    test('when name length is less than 2 then return error message', () {
      //arrange
      String? name = 'a';
      //act
      String? result = validation.validateName(name);
      //assert
      expect(result, 'Name must be at least 2 characters');
    });
    test('when name is not contain only letters then return error message', () {
      //arrange
      String? name = '123';
      //act
      String? result = validation.validateName(name);
      //assert
      expect(result, 'Name must contain only letters');
    });
    test('when name is valid then return null', () {
      //arrange
      String? name = 'abdelrahman';
      //act
      String? result = validation.validateName(name);
      //assert
      expect(result, null);
    });
  });

  group('Email Validation test -', () {
    test('when email is null or empty then return error message', () {
      //arrange
      String? email;
      //act
      String? result = validation.validateEmail(email);
      String? result2 = validation.validateEmail('');
      //assert
      expect(result, 'Email is required');
      expect(result2, 'Email is required');
    });
    test('when email is not valid then return error message', () {
      //arrange
      final invalidEmails = [
        '123',
        '123@',
        '123@123',
        'abdel@.com',
        'a@b',
        'a@b.',
      ];

      //act

      for (var email in invalidEmails) {
        String? result = validation.validateEmail(email);
        expect(result, 'Please enter a valid email');
      }
    });

    test('when email is valid then return null', () {
      //arrange
      String? email = 'abdelrahman@gmail.com';
      //act
      String? result = validation.validateEmail(email);
      //assert
      expect(result, null);
    });
  });

  group('Password Validation test -', () {
    test('when password is null or empty then return error message', () {
      //arrange
      String? password;
      //act
      String? result = validation.validatePassword(password);
      String? result2 = validation.validatePassword('');
      //assert
      expect(result, 'Password is required');
      expect(result2, 'Password is required');
    });
    test('when password is not valid then return error message', () {
      //arrange
      final invalidPasswords = [
        'abcd1234',
        'ABCD1234',
        'abcdABCD',
        'Abcd1234',
        'Abcd@12',
      ];
      //act
      //assert
      for (var password in invalidPasswords) {
        String? result = validation.validatePassword(password);
        expect(
          result,
          'Password must be 8+ chars with upper, lower, number, and symbol',
        );
      }
    });
    test('when password is valid then return null', () {
      //arrange
      String? password = 'Abdelra@hman12#';
      //act
      String? result = validation.validatePassword(password);
      //assert
      expect(result, null);
    });
  });

  group('Confirm Password Validation test -', () {
    test(
      'when confirm password is null or empty then return error message',
      () {
        //arrange
        String? confirmPassword;
        //act
        String? result = validation.validateConfirmPassword(
          confirmPassword,
          null,
        );
        String? result2 = validation.validateConfirmPassword('', null);
        //assert
        expect(result, 'Confirm Password is required');
        expect(result2, 'Confirm Password is required');
      },
    );
    test('when confirm password is not valid then return error message', () {
      //arrange
      String? confirmPassword = '123';
      //act
      String? result = validation.validateConfirmPassword(
        confirmPassword,
        '321',
      );
      //assert
      expect(result, 'Passwords do not match');
    });
    test('when confirm password is valid then return null', () {
      //arrange
      String? confirmPassword = 'Abdelra@hman12#';
      //act
      String? result = validation.validateConfirmPassword(
        confirmPassword,
        'Abdelra@hman12#',
      );
      //assert
      expect(result, null);
    });
  });
}
