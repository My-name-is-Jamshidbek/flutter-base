import 'package:flutter_test/flutter_test.dart';

import 'package:app_template/core/utils/extensions.dart';

void main() {
  group('StringExtensions', () {
    group('capitalized', () {
      test('capitalizes first letter of lowercase string', () {
        expect('hello'.capitalized, 'Hello');
      });

      test('keeps first letter capitalized', () {
        expect('Hello'.capitalized, 'Hello');
      });

      test('returns empty string for empty input', () {
        expect(''.capitalized, '');
      });

      test('capitalizes single character', () {
        expect('a'.capitalized, 'A');
      });

      test('handles strings with leading uppercase', () {
        expect('HELLO'.capitalized, 'HELLO');
      });
    });

    group('isValidEmail', () {
      test('returns true for valid email addresses', () {
        expect('test@example.com'.isValidEmail, true);
        expect('user.name@domain.org'.isValidEmail, true);
        expect('user-name@domain.co.uk'.isValidEmail, true);
        expect('user_name@domain.com'.isValidEmail, true);
        expect('user123@domain.com'.isValidEmail, true);
      });

      test('returns false for invalid email addresses', () {
        expect(''.isValidEmail, false);
        expect('invalid'.isValidEmail, false);
        expect('@domain.com'.isValidEmail, false);
        expect('user@'.isValidEmail, false);
        expect('user@domain'.isValidEmail, false);
        expect('user@.com'.isValidEmail, false);
        expect('user name@domain.com'.isValidEmail, false);
      });
    });
  });

  group('DateTimeExtensions', () {
    group('isToday', () {
      test('returns true for today', () {
        final now = DateTime.now();
        expect(now.isToday, true);
      });

      test('returns true for earlier today', () {
        final now = DateTime.now();
        final earlier = DateTime(now.year, now.month, now.day, 0, 0, 1);
        expect(earlier.isToday, true);
      });

      test('returns false for yesterday', () {
        final yesterday = DateTime.now().subtract(const Duration(days: 1));
        expect(yesterday.isToday, false);
      });

      test('returns false for tomorrow', () {
        final tomorrow = DateTime.now().add(const Duration(days: 1));
        expect(tomorrow.isToday, false);
      });
    });

    group('isYesterday', () {
      test('returns true for yesterday', () {
        final yesterday = DateTime.now().subtract(const Duration(days: 1));
        expect(yesterday.isYesterday, true);
      });

      test('returns false for today', () {
        expect(DateTime.now().isYesterday, false);
      });

      test('returns false for two days ago', () {
        final twoDaysAgo = DateTime.now().subtract(const Duration(days: 2));
        expect(twoDaysAgo.isYesterday, false);
      });
    });
  });

  group('NullableExtensions', () {
    group('orElse', () {
      test('returns value when not null', () {
        const String? value = 'hello';
        expect(value.orElse(() => 'default'), 'hello');
      });

      test('returns orElse result when null', () {
        const String? value = null;
        expect(value.orElse(() => 'default'), 'default');
      });

      test('works with other types', () {
        const int? number = null;
        expect(number.orElse(() => 42), 42);
      });
    });
  });
}
