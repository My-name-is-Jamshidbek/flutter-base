import 'package:flutter/widgets.dart';

import '../../l10n/gen/app_localizations.dart';
import 'failures.dart';

/// Extension to get localized error messages for Failures.
///
/// Usage:
/// ```dart
/// final message = failure.localizedMessage(context);
/// // or
/// final message = failure.localizedMessageFrom(AppLocalizations.of(context)!);
/// ```
extension LocalizedFailure on Failure {
  /// Get the localized user-friendly error message.
  String localizedMessage(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return localizedMessageFrom(l10n);
  }

  /// Get the localized error message using the provided localizations instance.
  String localizedMessageFrom(AppLocalizations l10n) {
    return switch (this) {
      NetworkFailure(isTimeout: true) => l10n.networkErrorTimeout,
      NetworkFailure(isConnectionError: true) => l10n.networkErrorNoConnection,
      NetworkFailure() => l10n.networkErrorUnknown,
      ServerFailure() => l10n.networkErrorServer,
      AuthFailure(isTokenExpired: true) => l10n.networkErrorSessionExpired,
      AuthFailure(isForbidden: true) => l10n.networkErrorAccessDenied,
      AuthFailure() => l10n.networkErrorAuthRequired,
      ValidationFailure() => l10n.networkErrorValidationFailed,
      NotFoundFailure(:final resource) =>
        resource != null
            ? l10n.networkErrorResourceNotFound(resource)
            : l10n.networkErrorNotFound,
      RateLimitFailure() => l10n.networkErrorRateLimit,
      CancelledFailure() => l10n.networkErrorCancelled,
      CacheFailure(:final message) => message,
      UnknownFailure() => l10n.networkErrorUnknown,
    };
  }
}

/// Helper class for network-related localized strings.
///
/// Use this when you need access to network error messages without a Failure.
class NetworkL10n {
  NetworkL10n._(this._l10n);

  final AppLocalizations _l10n;

  /// Create from BuildContext.
  factory NetworkL10n.of(BuildContext context) {
    return NetworkL10n._(AppLocalizations.of(context));
  }

  /// Connection timeout error message.
  String get timeout => _l10n.networkErrorTimeout;

  /// No internet connection error message.
  String get noConnection => _l10n.networkErrorNoConnection;

  /// Server error message.
  String get serverError => _l10n.networkErrorServer;

  /// Session expired error message.
  String get sessionExpired => _l10n.networkErrorSessionExpired;

  /// Access denied error message.
  String get accessDenied => _l10n.networkErrorAccessDenied;

  /// Resource not found error message.
  String get notFound => _l10n.networkErrorNotFound;

  /// Resource not found error message with resource name.
  String resourceNotFound(String resource) =>
      _l10n.networkErrorResourceNotFound(resource);

  /// Rate limit error message.
  String get rateLimit => _l10n.networkErrorRateLimit;

  /// Request cancelled error message.
  String get cancelled => _l10n.networkErrorCancelled;

  /// Unknown error message.
  String get unknown => _l10n.networkErrorUnknown;

  /// Invalid SSL certificate error message.
  String get invalidCertificate => _l10n.networkErrorInvalidCertificate;

  /// Invalid request error message.
  String get invalidRequest => _l10n.networkErrorInvalidRequest;

  /// Authentication required error message.
  String get authRequired => _l10n.networkErrorAuthRequired;

  /// Validation failed error message.
  String get validationFailed => _l10n.networkErrorValidationFailed;

  /// Retrying message with attempt count.
  String retrying({required int attempt, required int maxAttempts}) =>
      _l10n.networkRetrying(attempt, maxAttempts);
}
