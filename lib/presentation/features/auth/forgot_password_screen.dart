import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_template/l10n/gen/app_localizations.dart';
import 'package:app_template/presentation/router/routes.dart';
import 'package:app_template/presentation/theme/theme.dart';

/// Forgot password screen with theme foundation.
class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;
  bool _isSuccess = false;

  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: AppDurations.medium,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: AppCurves.emphasized,
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: AppCurves.emphasizedDecelerate,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      // TODO: Replace with actual API call
      await Future.delayed(const Duration(seconds: 1));

      if (mounted) {
        setState(() {
          _isLoading = false;
          _isSuccess = true;
        });
        // Animate the success state
        _animationController.reset();
        _animationController.forward();
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton(onPressed: () => context.goToLogin())),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: _isSuccess
                      ? _buildSuccessContent()
                      : _buildFormContent(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormContent() {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Icon
          Center(
            child: AppIconContainer(
              icon: Icons.lock_reset,
              size: AppIconContainerSize.large,
              color: colorScheme.onPrimaryContainer,
              backgroundColor: colorScheme.primaryContainer,
            ),
          ),

          AppSpacing.verticalGapXl,

          // Title
          Text(
            l10n.forgotPasswordTitle,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

          AppSpacing.verticalGapXs,

          // Subtitle
          Text(
            l10n.forgotPasswordSubtitle,
            style: AppTextStyles.cardSubtitle(context),
            textAlign: TextAlign.center,
          ),

          AppSpacing.verticalGapXl,

          // Email field
          AppEmailField(
            controller: _emailController,
            labelText: l10n.email,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _handleSubmit(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return l10n.emailRequired;
              }
              if (!value.contains('@')) {
                return l10n.emailInvalid;
              }
              return null;
            },
          ),

          AppSpacing.verticalGapXl,

          // Submit button
          AppFilledButton(
            label: l10n.sendResetLink,
            size: AppButtonSize.large,
            expanded: true,
            isLoading: _isLoading,
            onPressed: _isLoading ? null : _handleSubmit,
          ),

          AppSpacing.verticalGapLg,

          // Back to login
          Center(
            child: AppTextButton(
              label: l10n.backToLogin,
              size: AppButtonSize.medium,
              onPressed: () => context.goToLogin(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessContent() {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Success icon with animation
        AppIconContainer(
          icon: Icons.mark_email_read,
          size: AppIconContainerSize.large,
          color: colorScheme.onPrimaryContainer,
          backgroundColor: colorScheme.primaryContainer,
        ),

        AppSpacing.verticalGapXl,

        // Success title
        Text(
          l10n.checkYourEmail,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),

        AppSpacing.verticalGapSm,

        // Success message
        Text(
          l10n.resetLinkSent(_emailController.text),
          style: AppTextStyles.cardSubtitle(context),
          textAlign: TextAlign.center,
        ),

        AppSpacing.verticalGapXl,

        // Back to login button
        AppFilledButton(
          label: l10n.backToLogin,
          size: AppButtonSize.large,
          expanded: true,
          onPressed: () => context.goToLogin(),
        ),

        AppSpacing.verticalGapMd,

        // Resend link
        AppTextButton(
          label: l10n.didNotReceiveEmail,
          size: AppButtonSize.medium,
          onPressed: () {
            setState(() => _isSuccess = false);
            _animationController.reset();
            _animationController.forward();
          },
        ),
      ],
    );
  }
}
