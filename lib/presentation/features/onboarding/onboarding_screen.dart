import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_template/core/di/onboarding_provider.dart';
import 'package:app_template/l10n/gen/app_localizations.dart';
import 'package:app_template/presentation/router/routes.dart';
import 'package:app_template/presentation/theme/theme.dart';

/// Onboarding screen with step indicator.
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    final initialPage = ref.read(onboardingProvider).currentStepIndex;
    _pageController = PageController(initialPage: initialPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _animateToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: AppDurations.medium,
      curve: AppCurves.standard,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final state = ref.watch(onboardingProvider);
    final notifier = ref.read(onboardingProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Progress indicator
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Step indicator dots
                  Row(
                    children: List.generate(
                      state.steps.length,
                      (index) => Container(
                        width: index == state.currentStepIndex ? 24 : 8,
                        height: 8,
                        margin: const EdgeInsets.only(right: AppSpacing.xs),
                        decoration: BoxDecoration(
                          color: index <= state.currentStepIndex
                              ? colorScheme.primary
                              : colorScheme.outlineVariant,
                          borderRadius: AppRadii.borderRadiusCircular,
                        ),
                      ),
                    ),
                  ),
                  // Skip button
                  TextButton(
                    onPressed: () async {
                      await notifier.skip();
                      if (context.mounted) {
                        context.goToLogin();
                      }
                    },
                    child: Text(l10n.skip),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: PageView.builder(
                itemCount: state.steps.length,
                controller: _pageController,
                onPageChanged: (index) {
                  notifier.goToStep(index);
                },
                itemBuilder: (context, index) {
                  final step = state.steps[index];
                  return _OnboardingStepContent(step: step);
                },
              ),
            ),

            // Bottom buttons
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Row(
                children: [
                  // Back button
                  if (state.hasPrevious)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          notifier.previous();
                          _animateToPage(state.currentStepIndex - 1);
                        },
                        child: Text(l10n.back),
                      ),
                    )
                  else
                    const Spacer(),

                  AppSpacing.horizontalGapMd,

                  // Next/Get Started button
                  Expanded(
                    flex: 2,
                    child: FilledButton(
                      onPressed: () async {
                        if (state.isLastStep) {
                          await notifier.complete();
                          if (context.mounted) {
                            context.goToLogin();
                          }
                        } else {
                          await notifier.next();
                          _animateToPage(state.currentStepIndex + 1);
                        }
                      },
                      child: Text(
                        state.isLastStep ? l10n.getStarted : l10n.next,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingStepContent extends StatelessWidget {
  final OnboardingStep step;

  const _OnboardingStepContent({required this.step});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Illustration placeholder
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer.withValues(alpha: 0.5),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _getStepIcon(step.id),
              size: 80,
              color: colorScheme.primary,
            ),
          ),

          AppSpacing.verticalGapXl,

          // Title
          Text(
            step.title,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

          AppSpacing.verticalGapMd,

          // Description
          Text(
            step.description,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),

          if (step.isOptional) ...[
            AppSpacing.verticalGapSm,
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xs,
              ),
              decoration: BoxDecoration(
                color: colorScheme.tertiaryContainer,
                borderRadius: AppRadii.borderRadiusSm,
              ),
              child: Text(
                'Optional',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onTertiaryContainer,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  IconData _getStepIcon(String stepId) {
    switch (stepId) {
      case 'welcome':
        return Icons.waving_hand;
      case 'features':
        return Icons.auto_awesome;
      case 'personalize':
        return Icons.tune;
      case 'ready':
        return Icons.rocket_launch;
      default:
        return Icons.circle_outlined;
    }
  }
}
