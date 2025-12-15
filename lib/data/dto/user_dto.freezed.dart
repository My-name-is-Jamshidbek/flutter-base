// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserDto _$UserDtoFromJson(Map<String, dynamic> json) {
  return _UserDto.fromJson(json);
}

/// @nodoc
mixin _$UserDto {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_verified')
  bool get isVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  UserProfileDto? get profile => throw _privateConstructorUsedError;
  List<String> get roles => throw _privateConstructorUsedError;

  /// Serializes this UserDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDtoCopyWith<UserDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) then) =
      _$UserDtoCopyWithImpl<$Res, UserDto>;
  @useResult
  $Res call({
    String id,
    String email,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'is_verified') bool isVerified,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    UserProfileDto? profile,
    List<String> roles,
  });

  $UserProfileDtoCopyWith<$Res>? get profile;
}

/// @nodoc
class _$UserDtoCopyWithImpl<$Res, $Val extends UserDto>
    implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? fullName = freezed,
    Object? avatarUrl = freezed,
    Object? phoneNumber = freezed,
    Object? isVerified = null,
    Object? isActive = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? profile = freezed,
    Object? roles = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            fullName: freezed == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String?,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            phoneNumber: freezed == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            isVerified: null == isVerified
                ? _value.isVerified
                : isVerified // ignore: cast_nullable_to_non_nullable
                      as bool,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            profile: freezed == profile
                ? _value.profile
                : profile // ignore: cast_nullable_to_non_nullable
                      as UserProfileDto?,
            roles: null == roles
                ? _value.roles
                : roles // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileDtoCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $UserProfileDtoCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserDtoImplCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$$UserDtoImplCopyWith(
    _$UserDtoImpl value,
    $Res Function(_$UserDtoImpl) then,
  ) = __$$UserDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String email,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'is_verified') bool isVerified,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    UserProfileDto? profile,
    List<String> roles,
  });

  @override
  $UserProfileDtoCopyWith<$Res>? get profile;
}

/// @nodoc
class __$$UserDtoImplCopyWithImpl<$Res>
    extends _$UserDtoCopyWithImpl<$Res, _$UserDtoImpl>
    implements _$$UserDtoImplCopyWith<$Res> {
  __$$UserDtoImplCopyWithImpl(
    _$UserDtoImpl _value,
    $Res Function(_$UserDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? fullName = freezed,
    Object? avatarUrl = freezed,
    Object? phoneNumber = freezed,
    Object? isVerified = null,
    Object? isActive = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? profile = freezed,
    Object? roles = null,
  }) {
    return _then(
      _$UserDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        fullName: freezed == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        phoneNumber: freezed == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        isVerified: null == isVerified
            ? _value.isVerified
            : isVerified // ignore: cast_nullable_to_non_nullable
                  as bool,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        profile: freezed == profile
            ? _value.profile
            : profile // ignore: cast_nullable_to_non_nullable
                  as UserProfileDto?,
        roles: null == roles
            ? _value._roles
            : roles // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDtoImpl extends _UserDto {
  const _$UserDtoImpl({
    required this.id,
    required this.email,
    @JsonKey(name: 'full_name') this.fullName,
    @JsonKey(name: 'avatar_url') this.avatarUrl,
    @JsonKey(name: 'phone_number') this.phoneNumber,
    @JsonKey(name: 'is_verified') this.isVerified = false,
    @JsonKey(name: 'is_active') this.isActive = false,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
    this.profile,
    final List<String> roles = const [],
  }) : _roles = roles,
       super._();

  factory _$UserDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'is_verified')
  final bool isVerified;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  final UserProfileDto? profile;
  final List<String> _roles;
  @override
  @JsonKey()
  List<String> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  String toString() {
    return 'UserDto(id: $id, email: $email, fullName: $fullName, avatarUrl: $avatarUrl, phoneNumber: $phoneNumber, isVerified: $isVerified, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, profile: $profile, roles: $roles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            const DeepCollectionEquality().equals(other._roles, _roles));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    email,
    fullName,
    avatarUrl,
    phoneNumber,
    isVerified,
    isActive,
    createdAt,
    updatedAt,
    profile,
    const DeepCollectionEquality().hash(_roles),
  );

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDtoImplCopyWith<_$UserDtoImpl> get copyWith =>
      __$$UserDtoImplCopyWithImpl<_$UserDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDtoImplToJson(this);
  }
}

abstract class _UserDto extends UserDto {
  const factory _UserDto({
    required final String id,
    required final String email,
    @JsonKey(name: 'full_name') final String? fullName,
    @JsonKey(name: 'avatar_url') final String? avatarUrl,
    @JsonKey(name: 'phone_number') final String? phoneNumber,
    @JsonKey(name: 'is_verified') final bool isVerified,
    @JsonKey(name: 'is_active') final bool isActive,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
    @JsonKey(name: 'updated_at') final DateTime? updatedAt,
    final UserProfileDto? profile,
    final List<String> roles,
  }) = _$UserDtoImpl;
  const _UserDto._() : super._();

  factory _UserDto.fromJson(Map<String, dynamic> json) = _$UserDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  @JsonKey(name: 'full_name')
  String? get fullName;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  @JsonKey(name: 'phone_number')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'is_verified')
  bool get isVerified;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  UserProfileDto? get profile;
  @override
  List<String> get roles;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDtoImplCopyWith<_$UserDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserProfileDto _$UserProfileDtoFromJson(Map<String, dynamic> json) {
  return _UserProfileDto.fromJson(json);
}

/// @nodoc
mixin _$UserProfileDto {
  String? get bio => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  Map<String, String> get socialLinks => throw _privateConstructorUsedError;
  UserPreferencesDto? get preferences => throw _privateConstructorUsedError;

  /// Serializes this UserProfileDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileDtoCopyWith<UserProfileDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileDtoCopyWith<$Res> {
  factory $UserProfileDtoCopyWith(
    UserProfileDto value,
    $Res Function(UserProfileDto) then,
  ) = _$UserProfileDtoCopyWithImpl<$Res, UserProfileDto>;
  @useResult
  $Res call({
    String? bio,
    String? location,
    String? website,
    @JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,
    String? gender,
    Map<String, String> socialLinks,
    UserPreferencesDto? preferences,
  });

  $UserPreferencesDtoCopyWith<$Res>? get preferences;
}

/// @nodoc
class _$UserProfileDtoCopyWithImpl<$Res, $Val extends UserProfileDto>
    implements $UserProfileDtoCopyWith<$Res> {
  _$UserProfileDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bio = freezed,
    Object? location = freezed,
    Object? website = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? socialLinks = null,
    Object? preferences = freezed,
  }) {
    return _then(
      _value.copyWith(
            bio: freezed == bio
                ? _value.bio
                : bio // ignore: cast_nullable_to_non_nullable
                      as String?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            website: freezed == website
                ? _value.website
                : website // ignore: cast_nullable_to_non_nullable
                      as String?,
            dateOfBirth: freezed == dateOfBirth
                ? _value.dateOfBirth
                : dateOfBirth // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String?,
            socialLinks: null == socialLinks
                ? _value.socialLinks
                : socialLinks // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>,
            preferences: freezed == preferences
                ? _value.preferences
                : preferences // ignore: cast_nullable_to_non_nullable
                      as UserPreferencesDto?,
          )
          as $Val,
    );
  }

  /// Create a copy of UserProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserPreferencesDtoCopyWith<$Res>? get preferences {
    if (_value.preferences == null) {
      return null;
    }

    return $UserPreferencesDtoCopyWith<$Res>(_value.preferences!, (value) {
      return _then(_value.copyWith(preferences: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserProfileDtoImplCopyWith<$Res>
    implements $UserProfileDtoCopyWith<$Res> {
  factory _$$UserProfileDtoImplCopyWith(
    _$UserProfileDtoImpl value,
    $Res Function(_$UserProfileDtoImpl) then,
  ) = __$$UserProfileDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? bio,
    String? location,
    String? website,
    @JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,
    String? gender,
    Map<String, String> socialLinks,
    UserPreferencesDto? preferences,
  });

  @override
  $UserPreferencesDtoCopyWith<$Res>? get preferences;
}

/// @nodoc
class __$$UserProfileDtoImplCopyWithImpl<$Res>
    extends _$UserProfileDtoCopyWithImpl<$Res, _$UserProfileDtoImpl>
    implements _$$UserProfileDtoImplCopyWith<$Res> {
  __$$UserProfileDtoImplCopyWithImpl(
    _$UserProfileDtoImpl _value,
    $Res Function(_$UserProfileDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bio = freezed,
    Object? location = freezed,
    Object? website = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? socialLinks = null,
    Object? preferences = freezed,
  }) {
    return _then(
      _$UserProfileDtoImpl(
        bio: freezed == bio
            ? _value.bio
            : bio // ignore: cast_nullable_to_non_nullable
                  as String?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        website: freezed == website
            ? _value.website
            : website // ignore: cast_nullable_to_non_nullable
                  as String?,
        dateOfBirth: freezed == dateOfBirth
            ? _value.dateOfBirth
            : dateOfBirth // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String?,
        socialLinks: null == socialLinks
            ? _value._socialLinks
            : socialLinks // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        preferences: freezed == preferences
            ? _value.preferences
            : preferences // ignore: cast_nullable_to_non_nullable
                  as UserPreferencesDto?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileDtoImpl implements _UserProfileDto {
  const _$UserProfileDtoImpl({
    this.bio,
    this.location,
    this.website,
    @JsonKey(name: 'date_of_birth') this.dateOfBirth,
    this.gender,
    final Map<String, String> socialLinks = const {},
    this.preferences,
  }) : _socialLinks = socialLinks;

  factory _$UserProfileDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileDtoImplFromJson(json);

  @override
  final String? bio;
  @override
  final String? location;
  @override
  final String? website;
  @override
  @JsonKey(name: 'date_of_birth')
  final DateTime? dateOfBirth;
  @override
  final String? gender;
  final Map<String, String> _socialLinks;
  @override
  @JsonKey()
  Map<String, String> get socialLinks {
    if (_socialLinks is EqualUnmodifiableMapView) return _socialLinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_socialLinks);
  }

  @override
  final UserPreferencesDto? preferences;

  @override
  String toString() {
    return 'UserProfileDto(bio: $bio, location: $location, website: $website, dateOfBirth: $dateOfBirth, gender: $gender, socialLinks: $socialLinks, preferences: $preferences)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileDtoImpl &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            const DeepCollectionEquality().equals(
              other._socialLinks,
              _socialLinks,
            ) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    bio,
    location,
    website,
    dateOfBirth,
    gender,
    const DeepCollectionEquality().hash(_socialLinks),
    preferences,
  );

  /// Create a copy of UserProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileDtoImplCopyWith<_$UserProfileDtoImpl> get copyWith =>
      __$$UserProfileDtoImplCopyWithImpl<_$UserProfileDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileDtoImplToJson(this);
  }
}

abstract class _UserProfileDto implements UserProfileDto {
  const factory _UserProfileDto({
    final String? bio,
    final String? location,
    final String? website,
    @JsonKey(name: 'date_of_birth') final DateTime? dateOfBirth,
    final String? gender,
    final Map<String, String> socialLinks,
    final UserPreferencesDto? preferences,
  }) = _$UserProfileDtoImpl;

  factory _UserProfileDto.fromJson(Map<String, dynamic> json) =
      _$UserProfileDtoImpl.fromJson;

  @override
  String? get bio;
  @override
  String? get location;
  @override
  String? get website;
  @override
  @JsonKey(name: 'date_of_birth')
  DateTime? get dateOfBirth;
  @override
  String? get gender;
  @override
  Map<String, String> get socialLinks;
  @override
  UserPreferencesDto? get preferences;

  /// Create a copy of UserProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileDtoImplCopyWith<_$UserProfileDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserPreferencesDto _$UserPreferencesDtoFromJson(Map<String, dynamic> json) {
  return _UserPreferencesDto.fromJson(json);
}

/// @nodoc
mixin _$UserPreferencesDto {
  String get language => throw _privateConstructorUsedError;
  String get theme => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_notifications')
  bool get emailNotifications => throw _privateConstructorUsedError;
  @JsonKey(name: 'push_notifications')
  bool get pushNotifications => throw _privateConstructorUsedError;
  String get timezone => throw _privateConstructorUsedError;

  /// Serializes this UserPreferencesDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserPreferencesDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserPreferencesDtoCopyWith<UserPreferencesDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPreferencesDtoCopyWith<$Res> {
  factory $UserPreferencesDtoCopyWith(
    UserPreferencesDto value,
    $Res Function(UserPreferencesDto) then,
  ) = _$UserPreferencesDtoCopyWithImpl<$Res, UserPreferencesDto>;
  @useResult
  $Res call({
    String language,
    String theme,
    @JsonKey(name: 'email_notifications') bool emailNotifications,
    @JsonKey(name: 'push_notifications') bool pushNotifications,
    String timezone,
  });
}

/// @nodoc
class _$UserPreferencesDtoCopyWithImpl<$Res, $Val extends UserPreferencesDto>
    implements $UserPreferencesDtoCopyWith<$Res> {
  _$UserPreferencesDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserPreferencesDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? theme = null,
    Object? emailNotifications = null,
    Object? pushNotifications = null,
    Object? timezone = null,
  }) {
    return _then(
      _value.copyWith(
            language: null == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String,
            theme: null == theme
                ? _value.theme
                : theme // ignore: cast_nullable_to_non_nullable
                      as String,
            emailNotifications: null == emailNotifications
                ? _value.emailNotifications
                : emailNotifications // ignore: cast_nullable_to_non_nullable
                      as bool,
            pushNotifications: null == pushNotifications
                ? _value.pushNotifications
                : pushNotifications // ignore: cast_nullable_to_non_nullable
                      as bool,
            timezone: null == timezone
                ? _value.timezone
                : timezone // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserPreferencesDtoImplCopyWith<$Res>
    implements $UserPreferencesDtoCopyWith<$Res> {
  factory _$$UserPreferencesDtoImplCopyWith(
    _$UserPreferencesDtoImpl value,
    $Res Function(_$UserPreferencesDtoImpl) then,
  ) = __$$UserPreferencesDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String language,
    String theme,
    @JsonKey(name: 'email_notifications') bool emailNotifications,
    @JsonKey(name: 'push_notifications') bool pushNotifications,
    String timezone,
  });
}

/// @nodoc
class __$$UserPreferencesDtoImplCopyWithImpl<$Res>
    extends _$UserPreferencesDtoCopyWithImpl<$Res, _$UserPreferencesDtoImpl>
    implements _$$UserPreferencesDtoImplCopyWith<$Res> {
  __$$UserPreferencesDtoImplCopyWithImpl(
    _$UserPreferencesDtoImpl _value,
    $Res Function(_$UserPreferencesDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserPreferencesDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? theme = null,
    Object? emailNotifications = null,
    Object? pushNotifications = null,
    Object? timezone = null,
  }) {
    return _then(
      _$UserPreferencesDtoImpl(
        language: null == language
            ? _value.language
            : language // ignore: cast_nullable_to_non_nullable
                  as String,
        theme: null == theme
            ? _value.theme
            : theme // ignore: cast_nullable_to_non_nullable
                  as String,
        emailNotifications: null == emailNotifications
            ? _value.emailNotifications
            : emailNotifications // ignore: cast_nullable_to_non_nullable
                  as bool,
        pushNotifications: null == pushNotifications
            ? _value.pushNotifications
            : pushNotifications // ignore: cast_nullable_to_non_nullable
                  as bool,
        timezone: null == timezone
            ? _value.timezone
            : timezone // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPreferencesDtoImpl implements _UserPreferencesDto {
  const _$UserPreferencesDtoImpl({
    this.language = 'en',
    this.theme = 'system',
    @JsonKey(name: 'email_notifications') this.emailNotifications = true,
    @JsonKey(name: 'push_notifications') this.pushNotifications = true,
    this.timezone = 'UTC',
  });

  factory _$UserPreferencesDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPreferencesDtoImplFromJson(json);

  @override
  @JsonKey()
  final String language;
  @override
  @JsonKey()
  final String theme;
  @override
  @JsonKey(name: 'email_notifications')
  final bool emailNotifications;
  @override
  @JsonKey(name: 'push_notifications')
  final bool pushNotifications;
  @override
  @JsonKey()
  final String timezone;

  @override
  String toString() {
    return 'UserPreferencesDto(language: $language, theme: $theme, emailNotifications: $emailNotifications, pushNotifications: $pushNotifications, timezone: $timezone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPreferencesDtoImpl &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.emailNotifications, emailNotifications) ||
                other.emailNotifications == emailNotifications) &&
            (identical(other.pushNotifications, pushNotifications) ||
                other.pushNotifications == pushNotifications) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    language,
    theme,
    emailNotifications,
    pushNotifications,
    timezone,
  );

  /// Create a copy of UserPreferencesDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPreferencesDtoImplCopyWith<_$UserPreferencesDtoImpl> get copyWith =>
      __$$UserPreferencesDtoImplCopyWithImpl<_$UserPreferencesDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPreferencesDtoImplToJson(this);
  }
}

abstract class _UserPreferencesDto implements UserPreferencesDto {
  const factory _UserPreferencesDto({
    final String language,
    final String theme,
    @JsonKey(name: 'email_notifications') final bool emailNotifications,
    @JsonKey(name: 'push_notifications') final bool pushNotifications,
    final String timezone,
  }) = _$UserPreferencesDtoImpl;

  factory _UserPreferencesDto.fromJson(Map<String, dynamic> json) =
      _$UserPreferencesDtoImpl.fromJson;

  @override
  String get language;
  @override
  String get theme;
  @override
  @JsonKey(name: 'email_notifications')
  bool get emailNotifications;
  @override
  @JsonKey(name: 'push_notifications')
  bool get pushNotifications;
  @override
  String get timezone;

  /// Create a copy of UserPreferencesDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPreferencesDtoImplCopyWith<_$UserPreferencesDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthTokensDto _$AuthTokensDtoFromJson(Map<String, dynamic> json) {
  return _AuthTokensDto.fromJson(json);
}

/// @nodoc
mixin _$AuthTokensDto {
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'refresh_token')
  String get refreshToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_type')
  String get tokenType => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_in')
  int? get expiresIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_at')
  DateTime? get expiresAt => throw _privateConstructorUsedError;

  /// Serializes this AuthTokensDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthTokensDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthTokensDtoCopyWith<AuthTokensDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthTokensDtoCopyWith<$Res> {
  factory $AuthTokensDtoCopyWith(
    AuthTokensDto value,
    $Res Function(AuthTokensDto) then,
  ) = _$AuthTokensDtoCopyWithImpl<$Res, AuthTokensDto>;
  @useResult
  $Res call({
    @JsonKey(name: 'access_token') String accessToken,
    @JsonKey(name: 'refresh_token') String refreshToken,
    @JsonKey(name: 'token_type') String tokenType,
    @JsonKey(name: 'expires_in') int? expiresIn,
    @JsonKey(name: 'expires_at') DateTime? expiresAt,
  });
}

/// @nodoc
class _$AuthTokensDtoCopyWithImpl<$Res, $Val extends AuthTokensDto>
    implements $AuthTokensDtoCopyWith<$Res> {
  _$AuthTokensDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthTokensDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? tokenType = null,
    Object? expiresIn = freezed,
    Object? expiresAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            accessToken: null == accessToken
                ? _value.accessToken
                : accessToken // ignore: cast_nullable_to_non_nullable
                      as String,
            refreshToken: null == refreshToken
                ? _value.refreshToken
                : refreshToken // ignore: cast_nullable_to_non_nullable
                      as String,
            tokenType: null == tokenType
                ? _value.tokenType
                : tokenType // ignore: cast_nullable_to_non_nullable
                      as String,
            expiresIn: freezed == expiresIn
                ? _value.expiresIn
                : expiresIn // ignore: cast_nullable_to_non_nullable
                      as int?,
            expiresAt: freezed == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AuthTokensDtoImplCopyWith<$Res>
    implements $AuthTokensDtoCopyWith<$Res> {
  factory _$$AuthTokensDtoImplCopyWith(
    _$AuthTokensDtoImpl value,
    $Res Function(_$AuthTokensDtoImpl) then,
  ) = __$$AuthTokensDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'access_token') String accessToken,
    @JsonKey(name: 'refresh_token') String refreshToken,
    @JsonKey(name: 'token_type') String tokenType,
    @JsonKey(name: 'expires_in') int? expiresIn,
    @JsonKey(name: 'expires_at') DateTime? expiresAt,
  });
}

/// @nodoc
class __$$AuthTokensDtoImplCopyWithImpl<$Res>
    extends _$AuthTokensDtoCopyWithImpl<$Res, _$AuthTokensDtoImpl>
    implements _$$AuthTokensDtoImplCopyWith<$Res> {
  __$$AuthTokensDtoImplCopyWithImpl(
    _$AuthTokensDtoImpl _value,
    $Res Function(_$AuthTokensDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthTokensDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? tokenType = null,
    Object? expiresIn = freezed,
    Object? expiresAt = freezed,
  }) {
    return _then(
      _$AuthTokensDtoImpl(
        accessToken: null == accessToken
            ? _value.accessToken
            : accessToken // ignore: cast_nullable_to_non_nullable
                  as String,
        refreshToken: null == refreshToken
            ? _value.refreshToken
            : refreshToken // ignore: cast_nullable_to_non_nullable
                  as String,
        tokenType: null == tokenType
            ? _value.tokenType
            : tokenType // ignore: cast_nullable_to_non_nullable
                  as String,
        expiresIn: freezed == expiresIn
            ? _value.expiresIn
            : expiresIn // ignore: cast_nullable_to_non_nullable
                  as int?,
        expiresAt: freezed == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthTokensDtoImpl extends _AuthTokensDto {
  const _$AuthTokensDtoImpl({
    @JsonKey(name: 'access_token') required this.accessToken,
    @JsonKey(name: 'refresh_token') required this.refreshToken,
    @JsonKey(name: 'token_type') this.tokenType = 'Bearer',
    @JsonKey(name: 'expires_in') this.expiresIn,
    @JsonKey(name: 'expires_at') this.expiresAt,
  }) : super._();

  factory _$AuthTokensDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthTokensDtoImplFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @override
  @JsonKey(name: 'token_type')
  final String tokenType;
  @override
  @JsonKey(name: 'expires_in')
  final int? expiresIn;
  @override
  @JsonKey(name: 'expires_at')
  final DateTime? expiresAt;

  @override
  String toString() {
    return 'AuthTokensDto(accessToken: $accessToken, refreshToken: $refreshToken, tokenType: $tokenType, expiresIn: $expiresIn, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthTokensDtoImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    accessToken,
    refreshToken,
    tokenType,
    expiresIn,
    expiresAt,
  );

  /// Create a copy of AuthTokensDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthTokensDtoImplCopyWith<_$AuthTokensDtoImpl> get copyWith =>
      __$$AuthTokensDtoImplCopyWithImpl<_$AuthTokensDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthTokensDtoImplToJson(this);
  }
}

abstract class _AuthTokensDto extends AuthTokensDto {
  const factory _AuthTokensDto({
    @JsonKey(name: 'access_token') required final String accessToken,
    @JsonKey(name: 'refresh_token') required final String refreshToken,
    @JsonKey(name: 'token_type') final String tokenType,
    @JsonKey(name: 'expires_in') final int? expiresIn,
    @JsonKey(name: 'expires_at') final DateTime? expiresAt,
  }) = _$AuthTokensDtoImpl;
  const _AuthTokensDto._() : super._();

  factory _AuthTokensDto.fromJson(Map<String, dynamic> json) =
      _$AuthTokensDtoImpl.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  String get refreshToken;
  @override
  @JsonKey(name: 'token_type')
  String get tokenType;
  @override
  @JsonKey(name: 'expires_in')
  int? get expiresIn;
  @override
  @JsonKey(name: 'expires_at')
  DateTime? get expiresAt;

  /// Create a copy of AuthTokensDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthTokensDtoImplCopyWith<_$AuthTokensDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginRequestDto _$LoginRequestDtoFromJson(Map<String, dynamic> json) {
  return _LoginRequestDto.fromJson(json);
}

/// @nodoc
mixin _$LoginRequestDto {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'remember_me')
  bool get rememberMe => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_id')
  String? get deviceId => throw _privateConstructorUsedError;

  /// Serializes this LoginRequestDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginRequestDtoCopyWith<LoginRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginRequestDtoCopyWith<$Res> {
  factory $LoginRequestDtoCopyWith(
    LoginRequestDto value,
    $Res Function(LoginRequestDto) then,
  ) = _$LoginRequestDtoCopyWithImpl<$Res, LoginRequestDto>;
  @useResult
  $Res call({
    String email,
    String password,
    @JsonKey(name: 'remember_me') bool rememberMe,
    @JsonKey(name: 'device_id') String? deviceId,
  });
}

/// @nodoc
class _$LoginRequestDtoCopyWithImpl<$Res, $Val extends LoginRequestDto>
    implements $LoginRequestDtoCopyWith<$Res> {
  _$LoginRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? rememberMe = null,
    Object? deviceId = freezed,
  }) {
    return _then(
      _value.copyWith(
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String,
            rememberMe: null == rememberMe
                ? _value.rememberMe
                : rememberMe // ignore: cast_nullable_to_non_nullable
                      as bool,
            deviceId: freezed == deviceId
                ? _value.deviceId
                : deviceId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LoginRequestDtoImplCopyWith<$Res>
    implements $LoginRequestDtoCopyWith<$Res> {
  factory _$$LoginRequestDtoImplCopyWith(
    _$LoginRequestDtoImpl value,
    $Res Function(_$LoginRequestDtoImpl) then,
  ) = __$$LoginRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String email,
    String password,
    @JsonKey(name: 'remember_me') bool rememberMe,
    @JsonKey(name: 'device_id') String? deviceId,
  });
}

/// @nodoc
class __$$LoginRequestDtoImplCopyWithImpl<$Res>
    extends _$LoginRequestDtoCopyWithImpl<$Res, _$LoginRequestDtoImpl>
    implements _$$LoginRequestDtoImplCopyWith<$Res> {
  __$$LoginRequestDtoImplCopyWithImpl(
    _$LoginRequestDtoImpl _value,
    $Res Function(_$LoginRequestDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? rememberMe = null,
    Object? deviceId = freezed,
  }) {
    return _then(
      _$LoginRequestDtoImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        rememberMe: null == rememberMe
            ? _value.rememberMe
            : rememberMe // ignore: cast_nullable_to_non_nullable
                  as bool,
        deviceId: freezed == deviceId
            ? _value.deviceId
            : deviceId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginRequestDtoImpl implements _LoginRequestDto {
  const _$LoginRequestDtoImpl({
    required this.email,
    required this.password,
    @JsonKey(name: 'remember_me') this.rememberMe = false,
    @JsonKey(name: 'device_id') this.deviceId,
  });

  factory _$LoginRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginRequestDtoImplFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  @JsonKey(name: 'remember_me')
  final bool rememberMe;
  @override
  @JsonKey(name: 'device_id')
  final String? deviceId;

  @override
  String toString() {
    return 'LoginRequestDto(email: $email, password: $password, rememberMe: $rememberMe, deviceId: $deviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginRequestDtoImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.rememberMe, rememberMe) ||
                other.rememberMe == rememberMe) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, rememberMe, deviceId);

  /// Create a copy of LoginRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginRequestDtoImplCopyWith<_$LoginRequestDtoImpl> get copyWith =>
      __$$LoginRequestDtoImplCopyWithImpl<_$LoginRequestDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginRequestDtoImplToJson(this);
  }
}

abstract class _LoginRequestDto implements LoginRequestDto {
  const factory _LoginRequestDto({
    required final String email,
    required final String password,
    @JsonKey(name: 'remember_me') final bool rememberMe,
    @JsonKey(name: 'device_id') final String? deviceId,
  }) = _$LoginRequestDtoImpl;

  factory _LoginRequestDto.fromJson(Map<String, dynamic> json) =
      _$LoginRequestDtoImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(name: 'remember_me')
  bool get rememberMe;
  @override
  @JsonKey(name: 'device_id')
  String? get deviceId;

  /// Create a copy of LoginRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginRequestDtoImplCopyWith<_$LoginRequestDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RegisterRequestDto _$RegisterRequestDtoFromJson(Map<String, dynamic> json) {
  return _RegisterRequestDto.fromJson(json);
}

/// @nodoc
mixin _$RegisterRequestDto {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'password_confirmation')
  String get passwordConfirmation => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'accept_terms')
  bool get acceptTerms => throw _privateConstructorUsedError;

  /// Serializes this RegisterRequestDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterRequestDtoCopyWith<RegisterRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterRequestDtoCopyWith<$Res> {
  factory $RegisterRequestDtoCopyWith(
    RegisterRequestDto value,
    $Res Function(RegisterRequestDto) then,
  ) = _$RegisterRequestDtoCopyWithImpl<$Res, RegisterRequestDto>;
  @useResult
  $Res call({
    String email,
    String password,
    @JsonKey(name: 'password_confirmation') String passwordConfirmation,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'accept_terms') bool acceptTerms,
  });
}

/// @nodoc
class _$RegisterRequestDtoCopyWithImpl<$Res, $Val extends RegisterRequestDto>
    implements $RegisterRequestDtoCopyWith<$Res> {
  _$RegisterRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? passwordConfirmation = null,
    Object? fullName = freezed,
    Object? phoneNumber = freezed,
    Object? acceptTerms = null,
  }) {
    return _then(
      _value.copyWith(
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String,
            passwordConfirmation: null == passwordConfirmation
                ? _value.passwordConfirmation
                : passwordConfirmation // ignore: cast_nullable_to_non_nullable
                      as String,
            fullName: freezed == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String?,
            phoneNumber: freezed == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            acceptTerms: null == acceptTerms
                ? _value.acceptTerms
                : acceptTerms // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RegisterRequestDtoImplCopyWith<$Res>
    implements $RegisterRequestDtoCopyWith<$Res> {
  factory _$$RegisterRequestDtoImplCopyWith(
    _$RegisterRequestDtoImpl value,
    $Res Function(_$RegisterRequestDtoImpl) then,
  ) = __$$RegisterRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String email,
    String password,
    @JsonKey(name: 'password_confirmation') String passwordConfirmation,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'accept_terms') bool acceptTerms,
  });
}

/// @nodoc
class __$$RegisterRequestDtoImplCopyWithImpl<$Res>
    extends _$RegisterRequestDtoCopyWithImpl<$Res, _$RegisterRequestDtoImpl>
    implements _$$RegisterRequestDtoImplCopyWith<$Res> {
  __$$RegisterRequestDtoImplCopyWithImpl(
    _$RegisterRequestDtoImpl _value,
    $Res Function(_$RegisterRequestDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? passwordConfirmation = null,
    Object? fullName = freezed,
    Object? phoneNumber = freezed,
    Object? acceptTerms = null,
  }) {
    return _then(
      _$RegisterRequestDtoImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        passwordConfirmation: null == passwordConfirmation
            ? _value.passwordConfirmation
            : passwordConfirmation // ignore: cast_nullable_to_non_nullable
                  as String,
        fullName: freezed == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String?,
        phoneNumber: freezed == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        acceptTerms: null == acceptTerms
            ? _value.acceptTerms
            : acceptTerms // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterRequestDtoImpl implements _RegisterRequestDto {
  const _$RegisterRequestDtoImpl({
    required this.email,
    required this.password,
    @JsonKey(name: 'password_confirmation') required this.passwordConfirmation,
    @JsonKey(name: 'full_name') this.fullName,
    @JsonKey(name: 'phone_number') this.phoneNumber,
    @JsonKey(name: 'accept_terms') this.acceptTerms = false,
  });

  factory _$RegisterRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterRequestDtoImplFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'accept_terms')
  final bool acceptTerms;

  @override
  String toString() {
    return 'RegisterRequestDto(email: $email, password: $password, passwordConfirmation: $passwordConfirmation, fullName: $fullName, phoneNumber: $phoneNumber, acceptTerms: $acceptTerms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterRequestDtoImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                other.passwordConfirmation == passwordConfirmation) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.acceptTerms, acceptTerms) ||
                other.acceptTerms == acceptTerms));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    email,
    password,
    passwordConfirmation,
    fullName,
    phoneNumber,
    acceptTerms,
  );

  /// Create a copy of RegisterRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterRequestDtoImplCopyWith<_$RegisterRequestDtoImpl> get copyWith =>
      __$$RegisterRequestDtoImplCopyWithImpl<_$RegisterRequestDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterRequestDtoImplToJson(this);
  }
}

abstract class _RegisterRequestDto implements RegisterRequestDto {
  const factory _RegisterRequestDto({
    required final String email,
    required final String password,
    @JsonKey(name: 'password_confirmation')
    required final String passwordConfirmation,
    @JsonKey(name: 'full_name') final String? fullName,
    @JsonKey(name: 'phone_number') final String? phoneNumber,
    @JsonKey(name: 'accept_terms') final bool acceptTerms,
  }) = _$RegisterRequestDtoImpl;

  factory _RegisterRequestDto.fromJson(Map<String, dynamic> json) =
      _$RegisterRequestDtoImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(name: 'password_confirmation')
  String get passwordConfirmation;
  @override
  @JsonKey(name: 'full_name')
  String? get fullName;
  @override
  @JsonKey(name: 'phone_number')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'accept_terms')
  bool get acceptTerms;

  /// Create a copy of RegisterRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterRequestDtoImplCopyWith<_$RegisterRequestDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
