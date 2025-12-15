// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDtoImpl _$$UserDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserDtoImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      fullName: json['full_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      phoneNumber: json['phone_number'] as String?,
      isVerified: json['is_verified'] as bool? ?? false,
      isActive: json['is_active'] as bool? ?? false,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      profile: json['profile'] == null
          ? null
          : UserProfileDto.fromJson(json['profile'] as Map<String, dynamic>),
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
    );

Map<String, dynamic> _$$UserDtoImplToJson(_$UserDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'full_name': instance.fullName,
      'avatar_url': instance.avatarUrl,
      'phone_number': instance.phoneNumber,
      'is_verified': instance.isVerified,
      'is_active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'profile': instance.profile,
      'roles': instance.roles,
    };

_$UserProfileDtoImpl _$$UserProfileDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileDtoImpl(
      bio: json['bio'] as String?,
      location: json['location'] as String?,
      website: json['website'] as String?,
      dateOfBirth: json['date_of_birth'] == null
          ? null
          : DateTime.parse(json['date_of_birth'] as String),
      gender: json['gender'] as String?,
      socialLinks:
          (json['socialLinks'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      preferences: json['preferences'] == null
          ? null
          : UserPreferencesDto.fromJson(
              json['preferences'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$UserProfileDtoImplToJson(
  _$UserProfileDtoImpl instance,
) => <String, dynamic>{
  'bio': instance.bio,
  'location': instance.location,
  'website': instance.website,
  'date_of_birth': instance.dateOfBirth?.toIso8601String(),
  'gender': instance.gender,
  'socialLinks': instance.socialLinks,
  'preferences': instance.preferences,
};

_$UserPreferencesDtoImpl _$$UserPreferencesDtoImplFromJson(
  Map<String, dynamic> json,
) => _$UserPreferencesDtoImpl(
  language: json['language'] as String? ?? 'en',
  theme: json['theme'] as String? ?? 'system',
  emailNotifications: json['email_notifications'] as bool? ?? true,
  pushNotifications: json['push_notifications'] as bool? ?? true,
  timezone: json['timezone'] as String? ?? 'UTC',
);

Map<String, dynamic> _$$UserPreferencesDtoImplToJson(
  _$UserPreferencesDtoImpl instance,
) => <String, dynamic>{
  'language': instance.language,
  'theme': instance.theme,
  'email_notifications': instance.emailNotifications,
  'push_notifications': instance.pushNotifications,
  'timezone': instance.timezone,
};

_$AuthTokensDtoImpl _$$AuthTokensDtoImplFromJson(Map<String, dynamic> json) =>
    _$AuthTokensDtoImpl(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      tokenType: json['token_type'] as String? ?? 'Bearer',
      expiresIn: (json['expires_in'] as num?)?.toInt(),
      expiresAt: json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String),
    );

Map<String, dynamic> _$$AuthTokensDtoImplToJson(_$AuthTokensDtoImpl instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
      'expires_at': instance.expiresAt?.toIso8601String(),
    };

_$LoginRequestDtoImpl _$$LoginRequestDtoImplFromJson(
  Map<String, dynamic> json,
) => _$LoginRequestDtoImpl(
  email: json['email'] as String,
  password: json['password'] as String,
  rememberMe: json['remember_me'] as bool? ?? false,
  deviceId: json['device_id'] as String?,
);

Map<String, dynamic> _$$LoginRequestDtoImplToJson(
  _$LoginRequestDtoImpl instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'remember_me': instance.rememberMe,
  'device_id': instance.deviceId,
};

_$RegisterRequestDtoImpl _$$RegisterRequestDtoImplFromJson(
  Map<String, dynamic> json,
) => _$RegisterRequestDtoImpl(
  email: json['email'] as String,
  password: json['password'] as String,
  passwordConfirmation: json['password_confirmation'] as String,
  fullName: json['full_name'] as String?,
  phoneNumber: json['phone_number'] as String?,
  acceptTerms: json['accept_terms'] as bool? ?? false,
);

Map<String, dynamic> _$$RegisterRequestDtoImplToJson(
  _$RegisterRequestDtoImpl instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'password_confirmation': instance.passwordConfirmation,
  'full_name': instance.fullName,
  'phone_number': instance.phoneNumber,
  'accept_terms': instance.acceptTerms,
};
