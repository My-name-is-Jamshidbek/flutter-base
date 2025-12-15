import 'package:flutter_test/flutter_test.dart';

/// Common validation functions for form fields.
/// These mirror the validation logic used in the app's form fields.
class Validators {
  /// Validate email address.
  static String? email(
    String? value, {
    String requiredMessage = 'Email is required',
    String invalidMessage = 'Please enter a valid email',
  }) {
    if (value == null || value.isEmpty) {
      return requiredMessage;
    }
    if (!value.contains('@')) {
      return invalidMessage;
    }
    // More comprehensive email validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return invalidMessage;
    }
    return null;
  }

  /// Validate password.
  static String? password(
    String? value, {
    String requiredMessage = 'Password is required',
    String tooShortMessage = 'Password must be at least 6 characters',
    int minLength = 6,
  }) {
    if (value == null || value.isEmpty) {
      return requiredMessage;
    }
    if (value.length < minLength) {
      return tooShortMessage;
    }
    return null;
  }

  /// Validate password confirmation matches.
  static String? confirmPassword(
    String? value,
    String password, {
    String requiredMessage = 'Please confirm your password',
    String mismatchMessage = 'Passwords do not match',
  }) {
    if (value == null || value.isEmpty) {
      return requiredMessage;
    }
    if (value != password) {
      return mismatchMessage;
    }
    return null;
  }

  /// Validate required field.
  static String? required(
    String? value, {
    String message = 'This field is required',
  }) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    return null;
  }

  /// Validate minimum length.
  static String? minLength(String? value, int length, {String? message}) {
    if (value == null || value.length < length) {
      return message ?? 'Must be at least $length characters';
    }
    return null;
  }

  /// Validate maximum length.
  static String? maxLength(String? value, int length, {String? message}) {
    if (value != null && value.length > length) {
      return message ?? 'Must be at most $length characters';
    }
    return null;
  }

  /// Validate phone number.
  static String? phone(
    String? value, {
    String requiredMessage = 'Phone number is required',
    String invalidMessage = 'Please enter a valid phone number',
  }) {
    if (value == null || value.isEmpty) {
      return requiredMessage;
    }
    // Remove common formatting characters
    final cleaned = value.replaceAll(RegExp(r'[\s\-\(\)]'), '');
    // Check for valid phone pattern (allows + prefix)
    final phoneRegex = RegExp(r'^\+?[\d]{10,15}$');
    if (!phoneRegex.hasMatch(cleaned)) {
      return invalidMessage;
    }
    return null;
  }
}

void main() {
  group('Validators', () {
    group('email', () {
      test('returns error for null value', () {
        expect(Validators.email(null), isNotNull);
      });

      test('returns error for empty string', () {
        expect(Validators.email(''), isNotNull);
      });

      test('returns error for email without @', () {
        expect(Validators.email('invalidemail.com'), isNotNull);
      });

      test('returns error for email without domain', () {
        expect(Validators.email('user@'), isNotNull);
      });

      test('returns error for email without TLD', () {
        expect(Validators.email('user@domain'), isNotNull);
      });

      test('returns null for valid email', () {
        expect(Validators.email('user@example.com'), isNull);
      });

      test('returns null for valid email with subdomain', () {
        expect(Validators.email('user@mail.example.com'), isNull);
      });

      test('returns null for email with dots in local part', () {
        expect(Validators.email('user.name@example.com'), isNull);
      });

      test('uses custom error messages', () {
        expect(
          Validators.email(null, requiredMessage: 'Custom required'),
          'Custom required',
        );
        expect(
          Validators.email('invalid', invalidMessage: 'Custom invalid'),
          'Custom invalid',
        );
      });
    });

    group('password', () {
      test('returns error for null value', () {
        expect(Validators.password(null), isNotNull);
      });

      test('returns error for empty string', () {
        expect(Validators.password(''), isNotNull);
      });

      test('returns error for password shorter than minLength', () {
        expect(Validators.password('12345'), isNotNull);
      });

      test('returns null for password with exactly minLength', () {
        expect(Validators.password('123456'), isNull);
      });

      test('returns null for password longer than minLength', () {
        expect(Validators.password('1234567890'), isNull);
      });

      test('respects custom minLength', () {
        expect(Validators.password('1234567', minLength: 8), isNotNull);
        expect(Validators.password('12345678', minLength: 8), isNull);
      });

      test('uses custom error messages', () {
        expect(
          Validators.password(null, requiredMessage: 'Password needed'),
          'Password needed',
        );
        expect(
          Validators.password('123', tooShortMessage: 'Too short!'),
          'Too short!',
        );
      });
    });

    group('confirmPassword', () {
      test('returns error for null value', () {
        expect(Validators.confirmPassword(null, 'password'), isNotNull);
      });

      test('returns error for empty string', () {
        expect(Validators.confirmPassword('', 'password'), isNotNull);
      });

      test('returns error when passwords do not match', () {
        expect(Validators.confirmPassword('different', 'password'), isNotNull);
      });

      test('returns null when passwords match', () {
        expect(Validators.confirmPassword('password', 'password'), isNull);
      });

      test('uses custom error messages', () {
        expect(
          Validators.confirmPassword(null, 'pw', requiredMessage: 'Confirm it'),
          'Confirm it',
        );
        expect(
          Validators.confirmPassword('a', 'b', mismatchMessage: 'No match'),
          'No match',
        );
      });
    });

    group('required', () {
      test('returns error for null', () {
        expect(Validators.required(null), isNotNull);
      });

      test('returns error for empty string', () {
        expect(Validators.required(''), isNotNull);
      });

      test('returns error for whitespace only', () {
        expect(Validators.required('   '), isNotNull);
      });

      test('returns null for non-empty string', () {
        expect(Validators.required('value'), isNull);
      });

      test('uses custom message', () {
        expect(
          Validators.required(null, message: 'Field needed'),
          'Field needed',
        );
      });
    });

    group('minLength', () {
      test('returns error for null', () {
        expect(Validators.minLength(null, 5), isNotNull);
      });

      test('returns error for string shorter than length', () {
        expect(Validators.minLength('abc', 5), isNotNull);
      });

      test('returns null for string with exact length', () {
        expect(Validators.minLength('abcde', 5), isNull);
      });

      test('returns null for string longer than length', () {
        expect(Validators.minLength('abcdef', 5), isNull);
      });

      test('uses custom message', () {
        expect(
          Validators.minLength('ab', 5, message: 'Too few chars'),
          'Too few chars',
        );
      });
    });

    group('maxLength', () {
      test('returns null for null', () {
        expect(Validators.maxLength(null, 10), isNull);
      });

      test('returns null for string shorter than length', () {
        expect(Validators.maxLength('abc', 10), isNull);
      });

      test('returns null for string with exact length', () {
        expect(Validators.maxLength('abcdefghij', 10), isNull);
      });

      test('returns error for string longer than length', () {
        expect(Validators.maxLength('abcdefghijk', 10), isNotNull);
      });
    });

    group('phone', () {
      test('returns error for null', () {
        expect(Validators.phone(null), isNotNull);
      });

      test('returns error for empty string', () {
        expect(Validators.phone(''), isNotNull);
      });

      test('returns error for invalid phone number', () {
        expect(Validators.phone('123'), isNotNull);
        expect(Validators.phone('abc'), isNotNull);
      });

      test('returns null for valid phone number', () {
        expect(Validators.phone('1234567890'), isNull);
        expect(Validators.phone('+11234567890'), isNull);
      });

      test('accepts formatted phone numbers', () {
        expect(Validators.phone('(123) 456-7890'), isNull);
        expect(Validators.phone('+1 (123) 456-7890'), isNull);
      });
    });
  });
}
