import 'package:flutter_test/flutter_test.dart';

import 'package:app_template/data/dto/user_dto.dart';

void main() {
  group('UserDto', () {
    group('fromJson', () {
      test('parses minimal required fields', () {
        final json = {'id': 'user-123', 'email': 'test@example.com'};

        final user = UserDto.fromJson(json);

        expect(user.id, 'user-123');
        expect(user.email, 'test@example.com');
        expect(user.fullName, isNull);
        expect(user.avatarUrl, isNull);
        expect(user.isVerified, false);
        expect(user.isActive, false);
        expect(user.roles, isEmpty);
      });

      test('parses all fields with snake_case mapping', () {
        final json = {
          'id': 'user-123',
          'email': 'john@example.com',
          'full_name': 'John Doe',
          'avatar_url': 'https://example.com/avatar.jpg',
          'phone_number': '+1234567890',
          'is_verified': true,
          'is_active': true,
          'created_at': '2024-01-15T10:30:00.000Z',
          'updated_at': '2024-06-20T15:45:00.000Z',
          'roles': ['admin', 'editor'],
        };

        final user = UserDto.fromJson(json);

        expect(user.id, 'user-123');
        expect(user.email, 'john@example.com');
        expect(user.fullName, 'John Doe');
        expect(user.avatarUrl, 'https://example.com/avatar.jpg');
        expect(user.phoneNumber, '+1234567890');
        expect(user.isVerified, true);
        expect(user.isActive, true);
        expect(user.createdAt, isA<DateTime>());
        expect(user.updatedAt, isA<DateTime>());
        expect(user.roles, ['admin', 'editor']);
      });

      test('parses nested profile object', () {
        final json = {
          'id': 'user-123',
          'email': 'test@example.com',
          'profile': {
            'bio': 'Software developer',
            'location': 'New York',
            'website': 'https://johndoe.dev',
            'date_of_birth': '1990-05-15T00:00:00.000Z',
            'gender': 'male',
            'socialLinks': {'twitter': '@johndoe'},
          },
        };

        final user = UserDto.fromJson(json);

        expect(user.profile, isNotNull);
        expect(user.profile!.bio, 'Software developer');
        expect(user.profile!.location, 'New York');
        expect(user.profile!.website, 'https://johndoe.dev');
        expect(user.profile!.dateOfBirth, isA<DateTime>());
        expect(user.profile!.gender, 'male');
        expect(user.profile!.socialLinks, {'twitter': '@johndoe'});
      });
    });

    group('toJson', () {
      test('serializes all fields with snake_case mapping', () {
        const user = UserDto(
          id: 'user-123',
          email: 'test@example.com',
          fullName: 'John Doe',
          isVerified: true,
          roles: ['admin'],
        );

        final json = user.toJson();

        expect(json['id'], 'user-123');
        expect(json['email'], 'test@example.com');
        expect(json['full_name'], 'John Doe');
        expect(json['is_verified'], true);
        expect(json['roles'], ['admin']);
      });
    });

    group('computed properties', () {
      test('isAdmin returns true when user has admin role', () {
        const user = UserDto(
          id: '1',
          email: 'admin@test.com',
          roles: ['admin', 'user'],
        );

        expect(user.isAdmin, true);
      });

      test('isAdmin returns false when user does not have admin role', () {
        const user = UserDto(
          id: '1',
          email: 'user@test.com',
          roles: ['user', 'editor'],
        );

        expect(user.isAdmin, false);
      });

      test('displayName returns fullName when available', () {
        const user = UserDto(
          id: '1',
          email: 'test@example.com',
          fullName: 'John Doe',
        );

        expect(user.displayName, 'John Doe');
      });

      test('displayName falls back to email when fullName is null', () {
        const user = UserDto(id: '1', email: 'test@example.com');

        expect(user.displayName, 'test@example.com');
      });

      test('displayName falls back to email when fullName is empty', () {
        const user = UserDto(id: '1', email: 'test@example.com', fullName: '');

        expect(user.displayName, 'test@example.com');
      });

      test('initials returns two letters from full name', () {
        const user = UserDto(
          id: '1',
          email: 'test@example.com',
          fullName: 'John Doe',
        );

        expect(user.initials, 'JD');
      });

      test('initials returns single letter for single name', () {
        const user = UserDto(
          id: '1',
          email: 'test@example.com',
          fullName: 'John',
        );

        expect(user.initials, 'J');
      });

      test('initials falls back to email first char when no name', () {
        const user = UserDto(id: '1', email: 'test@example.com');

        expect(user.initials, 'T');
      });
    });
  });

  group('AuthTokensDto', () {
    test('fromJson parses tokens correctly', () {
      final json = {
        'access_token': 'eyJhbGciOiJIUzI1NiIs...',
        'refresh_token': 'dGhpcyBpcyBhIHJlZnJl...',
        'token_type': 'Bearer',
        'expires_in': 3600,
        'expires_at': '2024-12-31T23:59:59.000Z',
      };

      final tokens = AuthTokensDto.fromJson(json);

      expect(tokens.accessToken, 'eyJhbGciOiJIUzI1NiIs...');
      expect(tokens.refreshToken, 'dGhpcyBpcyBhIHJlZnJl...');
      expect(tokens.tokenType, 'Bearer');
      expect(tokens.expiresIn, 3600);
      expect(tokens.expiresAt, isA<DateTime>());
    });

    test('authorizationHeader formats correctly', () {
      const tokens = AuthTokensDto(
        accessToken: 'abc123',
        refreshToken: 'xyz789',
        tokenType: 'Bearer',
      );

      expect(tokens.authorizationHeader, 'Bearer abc123');
    });

    test('isExpired returns false when expiresAt is in the future', () {
      final tokens = AuthTokensDto(
        accessToken: 'abc123',
        refreshToken: 'xyz789',
        expiresAt: DateTime.now().add(const Duration(hours: 1)),
      );

      expect(tokens.isExpired, false);
    });

    test('isExpired returns true when expiresAt is in the past', () {
      final tokens = AuthTokensDto(
        accessToken: 'abc123',
        refreshToken: 'xyz789',
        expiresAt: DateTime.now().subtract(const Duration(hours: 1)),
      );

      expect(tokens.isExpired, true);
    });

    test('isExpired returns false when expiresAt is null', () {
      const tokens = AuthTokensDto(
        accessToken: 'abc123',
        refreshToken: 'xyz789',
      );

      expect(tokens.isExpired, false);
    });
  });

  group('LoginRequestDto', () {
    test('toJson serializes correctly', () {
      const request = LoginRequestDto(
        email: 'test@example.com',
        password: 'password123',
        rememberMe: true,
        deviceId: 'device-abc',
      );

      final json = request.toJson();

      expect(json['email'], 'test@example.com');
      expect(json['password'], 'password123');
      expect(json['remember_me'], true);
      expect(json['device_id'], 'device-abc');
    });

    test('default rememberMe is false', () {
      const request = LoginRequestDto(
        email: 'test@example.com',
        password: 'password123',
      );

      expect(request.rememberMe, false);
    });
  });

  group('RegisterRequestDto', () {
    test('toJson serializes correctly', () {
      const request = RegisterRequestDto(
        email: 'new@example.com',
        password: 'securePass123',
        passwordConfirmation: 'securePass123',
        fullName: 'New User',
        acceptTerms: true,
      );

      final json = request.toJson();

      expect(json['email'], 'new@example.com');
      expect(json['password'], 'securePass123');
      expect(json['password_confirmation'], 'securePass123');
      expect(json['full_name'], 'New User');
      expect(json['accept_terms'], true);
    });
  });

  group('UserPreferencesDto', () {
    test('has correct defaults', () {
      const prefs = UserPreferencesDto();

      expect(prefs.language, 'en');
      expect(prefs.theme, 'system');
      expect(prefs.emailNotifications, true);
      expect(prefs.pushNotifications, true);
      expect(prefs.timezone, 'UTC');
    });

    test('fromJson parses correctly', () {
      final json = {
        'language': 'ru',
        'theme': 'dark',
        'email_notifications': false,
        'push_notifications': false,
        'timezone': 'Europe/London',
      };

      final prefs = UserPreferencesDto.fromJson(json);

      expect(prefs.language, 'ru');
      expect(prefs.theme, 'dark');
      expect(prefs.emailNotifications, false);
      expect(prefs.pushNotifications, false);
      expect(prefs.timezone, 'Europe/London');
    });
  });
}
