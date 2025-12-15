import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app_template/core/di/providers.dart';
import 'package:app_template/presentation/router/guards.dart';

/// Keys for storing onboarding data.
abstract class OnboardingKeys {
  static const String completed = 'onboarding_completed';
  static const String currentStep = 'onboarding_current_step';
  static const String skipped = 'onboarding_skipped';
}

/// Onboarding step data.
class OnboardingStep {
  final String id;
  final String title;
  final String description;
  final String? imagePath;
  final bool isOptional;

  const OnboardingStep({
    required this.id,
    required this.title,
    required this.description,
    this.imagePath,
    this.isOptional = false,
  });
}

/// Onboarding state.
class OnboardingState {
  final List<OnboardingStep> steps;
  final int currentStepIndex;
  final bool isCompleted;
  final bool isSkipped;
  final bool isInitialized;

  const OnboardingState({
    this.steps = const [],
    this.currentStepIndex = 0,
    this.isCompleted = false,
    this.isSkipped = false,
    this.isInitialized = false,
  });

  /// Get the current step.
  OnboardingStep? get currentStep {
    if (currentStepIndex >= 0 && currentStepIndex < steps.length) {
      return steps[currentStepIndex];
    }
    return null;
  }

  /// Whether there's a next step.
  bool get hasNext => currentStepIndex < steps.length - 1;

  /// Whether there's a previous step.
  bool get hasPrevious => currentStepIndex > 0;

  /// Whether this is the last step.
  bool get isLastStep => currentStepIndex == steps.length - 1;

  /// Progress percentage (0.0 - 1.0).
  double get progress {
    if (steps.isEmpty) return 0.0;
    return (currentStepIndex + 1) / steps.length;
  }

  /// Get onboarding status for guards.
  OnboardingStatus get onboardingStatus {
    if (!isInitialized) return OnboardingStatus.inProgress;
    if (isCompleted || isSkipped) return OnboardingStatus.completed;
    if (currentStepIndex > 0) return OnboardingStatus.inProgress;
    return OnboardingStatus.notStarted;
  }

  OnboardingState copyWith({
    List<OnboardingStep>? steps,
    int? currentStepIndex,
    bool? isCompleted,
    bool? isSkipped,
    bool? isInitialized,
  }) {
    return OnboardingState(
      steps: steps ?? this.steps,
      currentStepIndex: currentStepIndex ?? this.currentStepIndex,
      isCompleted: isCompleted ?? this.isCompleted,
      isSkipped: isSkipped ?? this.isSkipped,
      isInitialized: isInitialized ?? this.isInitialized,
    );
  }
}

/// Default onboarding steps.
const defaultOnboardingSteps = [
  OnboardingStep(
    id: 'welcome',
    title: 'Welcome',
    description: 'Welcome to our app! Let\'s get you started.',
    imagePath: null,
  ),
  OnboardingStep(
    id: 'features',
    title: 'Discover Features',
    description: 'Explore all the amazing features we offer.',
    imagePath: null,
  ),
  OnboardingStep(
    id: 'personalize',
    title: 'Personalize',
    description: 'Customize your experience to fit your needs.',
    imagePath: null,
    isOptional: true,
  ),
  OnboardingStep(
    id: 'ready',
    title: 'You\'re Ready!',
    description: 'You\'re all set. Let\'s dive in!',
    imagePath: null,
  ),
];

/// Onboarding notifier.
class OnboardingNotifier extends Notifier<OnboardingState> {
  @override
  OnboardingState build() {
    // Schedule initialization after build returns (state is ready)
    Future.microtask(_initialize);
    return OnboardingState(steps: defaultOnboardingSteps);
  }

  SharedPreferences get _prefs => ref.read(sharedPreferencesProvider);

  /// Initialize from persisted data.
  Future<void> _initialize() async {
    final isCompleted = _prefs.getBool(OnboardingKeys.completed) ?? false;
    final isSkipped = _prefs.getBool(OnboardingKeys.skipped) ?? false;
    final currentStep = _prefs.getInt(OnboardingKeys.currentStep) ?? 0;

    state = state.copyWith(
      isCompleted: isCompleted,
      isSkipped: isSkipped,
      currentStepIndex: isCompleted || isSkipped ? 0 : currentStep,
      isInitialized: true,
    );
  }

  /// Go to next step.
  Future<void> next() async {
    if (state.isLastStep) {
      await complete();
      return;
    }

    final newIndex = state.currentStepIndex + 1;
    await _prefs.setInt(OnboardingKeys.currentStep, newIndex);
    state = state.copyWith(currentStepIndex: newIndex);
  }

  /// Go to previous step.
  void previous() {
    if (!state.hasPrevious) return;
    state = state.copyWith(currentStepIndex: state.currentStepIndex - 1);
  }

  /// Go to specific step.
  void goToStep(int index) {
    if (index < 0 || index >= state.steps.length) return;
    state = state.copyWith(currentStepIndex: index);
  }

  /// Complete onboarding.
  Future<void> complete() async {
    await _prefs.setBool(OnboardingKeys.completed, true);
    await _prefs.remove(OnboardingKeys.currentStep);
    state = state.copyWith(isCompleted: true);
  }

  /// Skip onboarding.
  Future<void> skip() async {
    await _prefs.setBool(OnboardingKeys.skipped, true);
    await _prefs.remove(OnboardingKeys.currentStep);
    state = state.copyWith(isSkipped: true);
  }

  /// Reset onboarding (for testing or user request).
  Future<void> reset() async {
    await Future.wait([
      _prefs.remove(OnboardingKeys.completed),
      _prefs.remove(OnboardingKeys.skipped),
      _prefs.remove(OnboardingKeys.currentStep),
    ]);
    state = OnboardingState(steps: state.steps, isInitialized: true);
  }
}

/// Provider for onboarding state.
final onboardingProvider =
    NotifierProvider<OnboardingNotifier, OnboardingState>(
      OnboardingNotifier.new,
    );

/// Provider for onboarding status (for guards).
final onboardingStatusProvider = Provider<OnboardingStatus>((ref) {
  return ref.watch(onboardingProvider).onboardingStatus;
});

/// Provider for checking if onboarding is completed.
final isOnboardingCompletedProvider = Provider<bool>((ref) {
  final state = ref.watch(onboardingProvider);
  return state.isCompleted || state.isSkipped;
});
