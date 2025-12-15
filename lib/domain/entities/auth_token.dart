import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_token.freezed.dart';
part 'auth_token.g.dart';

/// Authentication token data.
@freezed
class AuthToken with _$AuthToken {
  const AuthToken._();

  const factory AuthToken({
    required String accessToken,
    String? refreshToken,
    String? tokenType,
    DateTime? expiresAt,
    @Default([]) List<String> scopes,
  }) = _AuthToken;

  factory AuthToken.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenFromJson(json);

  /// Check if the token is expired.
  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt!);
  }

  /// Check if the token will expire soon (within 5 minutes).
  bool get willExpireSoon {
    if (expiresAt == null) return false;
    final threshold = DateTime.now().add(const Duration(minutes: 5));
    return expiresAt!.isBefore(threshold);
  }

  /// Check if the token is valid (not expired and has access token).
  bool get isValid => accessToken.isNotEmpty && !isExpired;

  /// Check if the token can be refreshed.
  bool get canRefresh => refreshToken != null && refreshToken!.isNotEmpty;
}
