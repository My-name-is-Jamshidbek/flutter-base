import 'package:freezed_annotation/freezed_annotation.dart';

import 'entities.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// User entity representing the authenticated user.
@freezed
class User extends BaseEntity with _$User {
  const factory User({
    required String id,
    required String email,
    String? name,
    String? avatarUrl,
    String? phoneNumber,
    @Default(false) bool emailVerified,
    @Default(false) bool phoneVerified,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

/// User profile with additional details.
@freezed
class UserProfile extends BaseEntity with _$UserProfile {
  const factory UserProfile({
    required User user,
    String? bio,
    String? location,
    String? website,
    @Default([]) List<String> interests,
    @Default({}) Map<String, dynamic> preferences,
    UserStats? stats,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

/// User statistics.
@freezed
class UserStats with _$UserStats {
  const factory UserStats({
    @Default(0) int followersCount,
    @Default(0) int followingCount,
    @Default(0) int postsCount,
    DateTime? lastActiveAt,
  }) = _UserStats;

  factory UserStats.fromJson(Map<String, dynamic> json) =>
      _$UserStatsFromJson(json);
}
