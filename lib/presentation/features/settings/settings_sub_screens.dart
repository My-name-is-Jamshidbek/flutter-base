import 'package:flutter/material.dart';

import 'package:app_template/l10n/gen/app_localizations.dart';
import 'package:app_template/presentation/theme/theme.dart';

/// Account settings screen with theme foundation.
class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.accountSettings), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          children: [
            // Header icon
            AppIconContainer(
              icon: Icons.account_circle_outlined,
              size: AppIconContainerSize.large,
              color: colorScheme.primary,
              backgroundColor: colorScheme.primaryContainer,
            ),

            AppSpacing.verticalGapLg,

            // Title
            Text(
              l10n.accountSettings,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),

            AppSpacing.verticalGapSm,

            // Description
            Text(
              'Manage your account settings here.',
              style: AppTextStyles.cardSubtitle(context),
              textAlign: TextAlign.center,
            ),

            AppSpacing.verticalGapXl,

            // Placeholder actions card
            AppCard(
              outlined: true,
              child: AppSection(
                title: 'Account',
                showDividers: true,
                children: [
                  AppListTile(
                    title: 'Change Email',
                    subtitle: 'Update your email address',
                    leading: Icon(
                      Icons.email_outlined,
                      size: AppIconSizes.listLeading,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    showDisclosure: true,
                    onTap: () {
                      // TODO: Implement
                    },
                  ),
                  AppListTile(
                    title: 'Change Password',
                    subtitle: 'Update your password',
                    leading: Icon(
                      Icons.lock_outlined,
                      size: AppIconSizes.listLeading,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    showDisclosure: true,
                    onTap: () {
                      // TODO: Implement
                    },
                  ),
                  AppListTile(
                    title: 'Delete Account',
                    subtitle: 'Permanently delete your account',
                    leading: Icon(
                      Icons.delete_outline,
                      size: AppIconSizes.listLeading,
                      color: colorScheme.error,
                    ),
                    showDisclosure: true,
                    onTap: () {
                      // TODO: Implement
                    },
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

/// Notification settings screen with theme foundation.
class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool _pushEnabled = true;
  bool _emailEnabled = false;
  bool _marketingEnabled = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.notifications), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          children: [
            // Header icon
            AppIconContainer(
              icon: Icons.notifications_outlined,
              size: AppIconContainerSize.large,
              color: colorScheme.primary,
              backgroundColor: colorScheme.primaryContainer,
            ),

            AppSpacing.verticalGapLg,

            // Title
            Text(
              l10n.notifications,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),

            AppSpacing.verticalGapSm,

            // Description
            Text(
              'Manage your notification preferences here.',
              style: AppTextStyles.cardSubtitle(context),
              textAlign: TextAlign.center,
            ),

            AppSpacing.verticalGapXl,

            // Notification toggles card
            AppCard(
              outlined: true,
              child: AppSection(
                title: 'Notifications',
                showDividers: true,
                children: [
                  SwitchListTile(
                    title: const Text('Push Notifications'),
                    subtitle: const Text('Receive push notifications'),
                    secondary: Icon(
                      Icons.notifications_active_outlined,
                      size: AppIconSizes.listLeading,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    value: _pushEnabled,
                    onChanged: (value) => setState(() => _pushEnabled = value),
                  ),
                  SwitchListTile(
                    title: const Text('Email Notifications'),
                    subtitle: const Text('Receive email updates'),
                    secondary: Icon(
                      Icons.email_outlined,
                      size: AppIconSizes.listLeading,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    value: _emailEnabled,
                    onChanged: (value) => setState(() => _emailEnabled = value),
                  ),
                  SwitchListTile(
                    title: const Text('Marketing'),
                    subtitle: const Text('Receive promotional content'),
                    secondary: Icon(
                      Icons.campaign_outlined,
                      size: AppIconSizes.listLeading,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    value: _marketingEnabled,
                    onChanged: (value) =>
                        setState(() => _marketingEnabled = value),
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

/// Privacy settings screen with theme foundation.
class PrivacySettingsScreen extends StatefulWidget {
  const PrivacySettingsScreen({super.key});

  @override
  State<PrivacySettingsScreen> createState() => _PrivacySettingsScreenState();
}

class _PrivacySettingsScreenState extends State<PrivacySettingsScreen> {
  bool _analyticsEnabled = true;
  bool _crashReportingEnabled = true;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.privacy), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          children: [
            // Header icon
            AppIconContainer(
              icon: Icons.privacy_tip_outlined,
              size: AppIconContainerSize.large,
              color: colorScheme.primary,
              backgroundColor: colorScheme.primaryContainer,
            ),

            AppSpacing.verticalGapLg,

            // Title
            Text(
              l10n.privacy,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),

            AppSpacing.verticalGapSm,

            // Description
            Text(
              'Manage your privacy settings here.',
              style: AppTextStyles.cardSubtitle(context),
              textAlign: TextAlign.center,
            ),

            AppSpacing.verticalGapXl,

            // Privacy toggles card
            AppCard(
              outlined: true,
              child: AppSection(
                title: 'Data & Privacy',
                showDividers: true,
                children: [
                  SwitchListTile(
                    title: const Text('Analytics'),
                    subtitle: const Text('Help improve the app'),
                    secondary: Icon(
                      Icons.analytics_outlined,
                      size: AppIconSizes.listLeading,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    value: _analyticsEnabled,
                    onChanged: (value) =>
                        setState(() => _analyticsEnabled = value),
                  ),
                  SwitchListTile(
                    title: const Text('Crash Reporting'),
                    subtitle: const Text('Send crash reports'),
                    secondary: Icon(
                      Icons.bug_report_outlined,
                      size: AppIconSizes.listLeading,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    value: _crashReportingEnabled,
                    onChanged: (value) =>
                        setState(() => _crashReportingEnabled = value),
                  ),
                ],
              ),
            ),

            AppSpacing.verticalGapLg,

            // Legal links card
            AppCard(
              outlined: true,
              child: AppSection(
                title: 'Legal',
                showDividers: true,
                children: [
                  AppListTile(
                    title: l10n.privacyPolicy,
                    leading: Icon(
                      Icons.policy_outlined,
                      size: AppIconSizes.listLeading,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    showDisclosure: true,
                    onTap: () {
                      // TODO: Open privacy policy
                    },
                  ),
                  AppListTile(
                    title: l10n.termsOfService,
                    leading: Icon(
                      Icons.description_outlined,
                      size: AppIconSizes.listLeading,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    showDisclosure: true,
                    onTap: () {
                      // TODO: Open terms of service
                    },
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
