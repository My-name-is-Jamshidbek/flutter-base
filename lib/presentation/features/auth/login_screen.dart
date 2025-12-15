import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_template/core/di/auth_provider.dart';
import 'package:app_template/core/di/onboarding_provider.dart';
import 'package:app_template/l10n/gen/app_localizations.dart';
import 'package:app_template/presentation/router/routes.dart';
import 'package:app_template/presentation/theme/theme.dart';

/// Login screen with theme foundation.
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      await ref
          .read(authProvider.notifier)
          .signIn(
            email: _emailController.text.trim(),
            password: _passwordController.text,
          );
      // Navigation handled by router redirect
    } catch (e) {
      if (mounted) {
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
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final authState = ref.watch(authProvider);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: Form(
              key: _formKey,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Logo
                    Center(
                      child: AppIconContainer(
                        icon: Icons.flutter_dash,
                        size: AppIconContainerSize.xl,
                        color: colorScheme.onPrimaryContainer,
                        backgroundColor: colorScheme.primaryContainer,
                        shape: BoxShape.rectangle,
                        borderRadius: AppRadii.borderRadiusLg,
                      ),
                    ),

                    AppSpacing.verticalGapXl,

                    // Title
                    Text(
                      l10n.loginTitle,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    AppSpacing.verticalGapXs,

                    // Subtitle
                    Text(
                      l10n.loginSubtitle,
                      style: AppTextStyles.cardSubtitle(context),
                      textAlign: TextAlign.center,
                    ),

                    AppSpacing.verticalGapXl,

                    // Email field
                    AppEmailField(
                      controller: _emailController,
                      labelText: l10n.email,
                      textInputAction: TextInputAction.next,
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

                    AppSpacing.verticalGapMd,

                    // Password field
                    AppPasswordField(
                      controller: _passwordController,
                      labelText: l10n.password,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => _handleLogin(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return l10n.passwordRequired;
                        }
                        if (value.length < 6) {
                          return l10n.passwordTooShort;
                        }
                        return null;
                      },
                    ),

                    AppSpacing.verticalGapSm,

                    // Forgot password link
                    Align(
                      alignment: Alignment.centerRight,
                      child: AppTextButton(
                        label: l10n.forgotPassword,
                        size: AppButtonSize.small,
                        onPressed: () => context.pushForgotPassword(),
                      ),
                    ),

                    AppSpacing.verticalGapMd,

                    // Login button
                    AppFilledButton(
                      label: l10n.login,
                      size: AppButtonSize.large,
                      expanded: true,
                      isLoading: authState.isLoading,
                      onPressed: authState.isLoading ? null : _handleLogin,
                    ),

                    AppSpacing.verticalGapLg,

                    // Register link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(l10n.noAccount, style: theme.textTheme.bodyMedium),
                        AppTextButton(
                          label: l10n.register,
                          size: AppButtonSize.small,
                          onPressed: () => context.goToRegister(),
                        ),
                      ],
                    ),

                    AppSpacing.verticalGapMd,

                    // View onboarding link
                    Center(
                      child: AppTextButton(
                        label: l10n.viewOnboarding,
                        size: AppButtonSize.small,
                        onPressed: () {
                          ref.read(onboardingProvider.notifier).reset();
                          context.goToOnboarding();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
