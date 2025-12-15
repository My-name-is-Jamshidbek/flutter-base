import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

/// User data transfer object.
///
/// Example DTO demonstrating freezed/json_serializable patterns:
/// - Field renaming with @JsonKey
/// - Default values
/// - Nullable fields
/// - Nested objects
/// - Date parsing
@freezed
class UserDto with _$UserDto {
  const UserDto._();

  const factory UserDto({
    required String id,
    required String email,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @Default(false) @JsonKey(name: 'is_verified') bool isVerified,
    @Default(false) @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    UserProfileDto? profile,
    @Default([]) List<String> roles,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  /// Whether the user has admin privileges.
  bool get isAdmin => roles.contains('admin');

  /// Display name fallback to email.
  String get displayName => fullName?.isNotEmpty == true ? fullName! : email;

  /// Returns initials from the full name.
  String get initials {
    if (fullName == null || fullName!.isEmpty) {
      return email[0].toUpperCase();
    }
    final parts = fullName!.split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return parts[0][0].toUpperCase();
  }
}

/// User profile data transfer object.
@freezed
class UserProfileDto with _$UserProfileDto {
  const factory UserProfileDto({
    String? bio,
    String? location,
    String? website,
    @JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,
    String? gender,
    @Default({}) Map<String, String> socialLinks,
    UserPreferencesDto? preferences,
  }) = _UserProfileDto;

  factory UserProfileDto.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDtoFromJson(json);
}

/// User preferences data transfer object.
@freezed
class UserPreferencesDto with _$UserPreferencesDto {
  const factory UserPreferencesDto({
    @Default('en') String language,
    @Default('system') String theme,
    @Default(true)
    @JsonKey(name: 'email_notifications')
    bool emailNotifications,
    @Default(true) @JsonKey(name: 'push_notifications') bool pushNotifications,
    @Default('UTC') String timezone,
  }) = _UserPreferencesDto;

  factory UserPreferencesDto.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesDtoFromJson(json);
}

/// Auth tokens data transfer object.
@freezed
class AuthTokensDto with _$AuthTokensDto {
  const AuthTokensDto._();

  const factory AuthTokensDto({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    @JsonKey(name: 'token_type') @Default('Bearer') String tokenType,
    @JsonKey(name: 'expires_in') int? expiresIn,
    @JsonKey(name: 'expires_at') DateTime? expiresAt,
  }) = _AuthTokensDto;

  factory AuthTokensDto.fromJson(Map<String, dynamic> json) =>
      _$AuthTokensDtoFromJson(json);

  /// Whether the access token is expired.
  bool get isExpired {
    if (expiresAt != null) {
      return DateTime.now().isAfter(expiresAt!);
    }
    return false;
  }

  /// Authorization header value.
  String get authorizationHeader => '$tokenType $accessToken';
}

/// Login request data transfer object.
@freezed
class LoginRequestDto with _$LoginRequestDto {
  const factory LoginRequestDto({
    required String email,
    required String password,
    @JsonKey(name: 'remember_me') @Default(false) bool rememberMe,
    @JsonKey(name: 'device_id') String? deviceId,
  }) = _LoginRequestDto;

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestDtoFromJson(json);
}

/// Register request data transfer object.
@freezed
class RegisterRequestDto with _$RegisterRequestDto {
  const factory RegisterRequestDto({
    required String email,
    required String password,
    @JsonKey(name: 'password_confirmation')
    required String passwordConfirmation,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @Default(false) @JsonKey(name: 'accept_terms') bool acceptTerms,
  }) = _RegisterRequestDto;

  factory RegisterRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestDtoFromJson(json);
}
