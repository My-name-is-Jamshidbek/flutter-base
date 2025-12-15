import 'package:flutter/material.dart';

/// Animation duration constants.
///
/// Use these for consistent motion timing throughout the app.
/// Based on Material Design motion principles.
abstract final class AppDurations {
  /// Instant - no animation (0ms)
  static const Duration instant = Duration.zero;

  /// Quick - very fast micro-interactions (100ms)
  static const Duration quick = Duration(milliseconds: 100);

  /// Fast - fast transitions (150ms)
  static const Duration fast = Duration(milliseconds: 150);

  /// Short - standard micro-interactions (200ms)
  static const Duration short = Duration(milliseconds: 200);

  /// Medium - standard transitions (300ms)
  static const Duration medium = Duration(milliseconds: 300);

  /// Long - emphasized transitions (400ms)
  static const Duration long = Duration(milliseconds: 400);

  /// Extra long - complex transitions (500ms)
  static const Duration extraLong = Duration(milliseconds: 500);

  /// Slow - very slow for emphasis (600ms)
  static const Duration slow = Duration(milliseconds: 600);

  // Semantic durations
  /// Page transitions
  static const Duration pageTransition = medium;

  /// Bottom sheet opening
  static const Duration bottomSheet = medium;

  /// Dialog opening
  static const Duration dialog = short;

  /// Snackbar animation
  static const Duration snackbar = short;

  /// FAB animation
  static const Duration fab = short;

  /// Icon animation
  static const Duration icon = fast;

  /// Button press feedback
  static const Duration buttonPress = quick;

  /// Switch toggle
  static const Duration switchToggle = short;

  /// Collapse/expand
  static const Duration collapse = medium;

  /// Fade in/out
  static const Duration fade = short;

  /// Scale animation
  static const Duration scale = short;

  /// Shimmer animation cycle
  static const Duration shimmer = Duration(milliseconds: 1500);
}

/// Animation curve constants.
///
/// Standard curves for consistent easing throughout the app.
abstract final class AppCurves {
  // Standard curves
  /// Standard easing - default for most animations
  static const Curve standard = Curves.easeInOut;

  /// Standard decelerate - for elements entering
  static const Curve standardDecelerate = Curves.easeOut;

  /// Standard accelerate - for elements exiting
  static const Curve standardAccelerate = Curves.easeIn;

  // Emphasized curves
  /// Emphasized - for important animations
  static const Curve emphasized = Curves.easeInOutCubic;

  /// Emphasized decelerate - for emphasized entering
  static const Curve emphasizedDecelerate = Curves.easeOutCubic;

  /// Emphasized accelerate - for emphasized exiting
  static const Curve emphasizedAccelerate = Curves.easeInCubic;

  // Linear
  /// Linear - for continuous animations
  static const Curve linear = Curves.linear;

  // Bounce
  /// Bounce - for playful interactions
  static const Curve bounce = Curves.bounceOut;

  // Elastic
  /// Elastic - for springy effects
  static const Curve elastic = Curves.elasticOut;

  // Overshoot
  /// Overshoot - goes past target then settles
  static const Curve overshoot = Curves.easeOutBack;

  // Semantic curves
  /// Page transition curve
  static const Curve pageTransition = emphasized;

  /// Bottom sheet curve
  static const Curve bottomSheet = standardDecelerate;

  /// Dialog curve
  static const Curve dialog = standardDecelerate;

  /// FAB curve
  static const Curve fab = emphasized;

  /// Collapse/expand curve
  static const Curve collapse = standard;

  /// Fade curve
  static const Curve fade = standard;

  /// Scale curve
  static const Curve scale = emphasized;
}

/// Reduced motion utilities.
///
/// Use these to respect user accessibility preferences.
abstract final class AppMotion {
  /// Check if reduced motion is preferred.
  static bool shouldReduceMotion(BuildContext context) {
    return MediaQuery.of(context).disableAnimations;
  }

  /// Get duration respecting reduced motion preference.
  static Duration getDuration(
    BuildContext context,
    Duration normalDuration, {
    Duration? reducedDuration,
  }) {
    if (shouldReduceMotion(context)) {
      return reducedDuration ?? AppDurations.instant;
    }
    return normalDuration;
  }

  /// Get curve respecting reduced motion preference.
  static Curve getCurve(
    BuildContext context,
    Curve normalCurve, {
    Curve? reducedCurve,
  }) {
    if (shouldReduceMotion(context)) {
      return reducedCurve ?? Curves.linear;
    }
    return normalCurve;
  }
}

/// Page transition builders for different platforms.
abstract final class AppPageTransitions {
  /// Get the default page transitions theme.
  static PageTransitionsTheme get theme => const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: _AndroidPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.windows: _FadePageTransitionsBuilder(),
      TargetPlatform.linux: _FadePageTransitionsBuilder(),
      TargetPlatform.fuchsia: _AndroidPageTransitionsBuilder(),
    },
  );

  /// Fade transition builder.
  static Widget fadeTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation.drive(
        Tween<double>(
          begin: 0,
          end: 1,
        ).chain(CurveTween(curve: AppCurves.fade)),
      ),
      child: child,
    );
  }

  /// Slide up transition builder.
  static Widget slideUpTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final tween = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).chain(CurveTween(curve: AppCurves.pageTransition));

    return SlideTransition(
      position: animation.drive(tween),
      child: FadeTransition(opacity: animation, child: child),
    );
  }

  /// Scale transition builder.
  static Widget scaleTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final tween = Tween<double>(
      begin: 0.95,
      end: 1.0,
    ).chain(CurveTween(curve: AppCurves.scale));

    return ScaleTransition(
      scale: animation.drive(tween),
      child: FadeTransition(opacity: animation, child: child),
    );
  }
}

class _AndroidPageTransitionsBuilder extends PageTransitionsBuilder {
  const _AndroidPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // Check for reduced motion
    if (AppMotion.shouldReduceMotion(context)) {
      return child;
    }

    return SlideTransition(
      position: animation.drive(
        Tween<Offset>(
          begin: const Offset(0.25, 0),
          end: Offset.zero,
        ).chain(CurveTween(curve: AppCurves.pageTransition)),
      ),
      child: FadeTransition(
        opacity: animation.drive(
          Tween<double>(
            begin: 0,
            end: 1,
          ).chain(CurveTween(curve: AppCurves.fade)),
        ),
        child: child,
      ),
    );
  }
}

class _FadePageTransitionsBuilder extends PageTransitionsBuilder {
  const _FadePageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // Check for reduced motion
    if (AppMotion.shouldReduceMotion(context)) {
      return child;
    }

    return FadeTransition(
      opacity: animation.drive(
        Tween<double>(
          begin: 0,
          end: 1,
        ).chain(CurveTween(curve: AppCurves.fade)),
      ),
      child: child,
    );
  }
}

/// Animated widget wrappers with consistent timing.
class AppAnimatedOpacity extends StatelessWidget {
  /// Child widget.
  final Widget child;

  /// Target opacity.
  final double opacity;

  /// Animation duration.
  final Duration? duration;

  /// Animation curve.
  final Curve? curve;

  /// Respect reduced motion preference.
  final bool respectReducedMotion;

  const AppAnimatedOpacity({
    super.key,
    required this.child,
    required this.opacity,
    this.duration,
    this.curve,
    this.respectReducedMotion = true,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveDuration = respectReducedMotion
        ? AppMotion.getDuration(context, duration ?? AppDurations.fade)
        : (duration ?? AppDurations.fade);

    final effectiveCurve = respectReducedMotion
        ? AppMotion.getCurve(context, curve ?? AppCurves.fade)
        : (curve ?? AppCurves.fade);

    return AnimatedOpacity(
      opacity: opacity,
      duration: effectiveDuration,
      curve: effectiveCurve,
      child: child,
    );
  }
}

/// Animated scale with consistent timing.
class AppAnimatedScale extends StatelessWidget {
  /// Child widget.
  final Widget child;

  /// Target scale.
  final double scale;

  /// Animation duration.
  final Duration? duration;

  /// Animation curve.
  final Curve? curve;

  /// Respect reduced motion preference.
  final bool respectReducedMotion;

  const AppAnimatedScale({
    super.key,
    required this.child,
    required this.scale,
    this.duration,
    this.curve,
    this.respectReducedMotion = true,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveDuration = respectReducedMotion
        ? AppMotion.getDuration(context, duration ?? AppDurations.scale)
        : (duration ?? AppDurations.scale);

    final effectiveCurve = respectReducedMotion
        ? AppMotion.getCurve(context, curve ?? AppCurves.scale)
        : (curve ?? AppCurves.scale);

    return AnimatedScale(
      scale: scale,
      duration: effectiveDuration,
      curve: effectiveCurve,
      child: child,
    );
  }
}
