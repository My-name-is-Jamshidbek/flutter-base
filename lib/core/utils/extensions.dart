import 'package:flutter/material.dart';

/// Extension methods for BuildContext for easier access to theme and media query.
extension BuildContextExtensions on BuildContext {
  /// Get the current theme.
  ThemeData get theme => Theme.of(this);

  /// Get the current text theme.
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Get the current color scheme.
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Get the screen size.
  Size get screenSize => MediaQuery.sizeOf(this);

  /// Get the screen width.
  double get screenWidth => screenSize.width;

  /// Get the screen height.
  double get screenHeight => screenSize.height;

  /// Get the current brightness.
  Brightness get brightness => MediaQuery.platformBrightnessOf(this);

  /// Check if the current theme is dark.
  bool get isDarkMode => brightness == Brightness.dark;

  /// Get the view insets (keyboard, etc.).
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  /// Get the view padding (notches, etc.).
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);

  /// Show a snackbar.
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? colorScheme.error : null,
      ),
    );
  }
}

/// Extension methods for nullable types.
extension NullableExtensions<T> on T? {
  /// Returns the value if not null, otherwise returns the result of [orElse].
  T orElse(T Function() orElse) => this ?? orElse();
}

/// Extension methods for String.
extension StringExtensions on String {
  /// Capitalize the first letter of the string.
  String get capitalized {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Check if the string is a valid email.
  bool get isValidEmail {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }
}

/// Extension methods for DateTime.
extension DateTimeExtensions on DateTime {
  /// Check if the date is today.
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Check if the date is yesterday.
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }
}
