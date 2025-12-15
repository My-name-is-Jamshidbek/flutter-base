import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_template/core/di/auth_provider.dart';
import 'package:app_template/core/di/profile_provider.dart';
import 'package:app_template/l10n/gen/app_localizations.dart';
import 'package:app_template/presentation/router/routes.dart';
import 'package:app_template/presentation/theme/theme.dart';

/// Profile screen with theme foundation.
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final profileState = ref.watch(profileProvider);
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.profileTitle),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            iconSize: AppIconSizes.appBar,
            tooltip: l10n.editProfile,
            onPressed: () {
              // TODO: Navigate to edit profile
            },
          ),
        ],
      ),
      body: profileState.isLoading && !profileState.hasProfile
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () => ref
                  .read(profileProvider.notifier)
                  .fetchProfile(forceRefresh: true),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  children: [
                    // Avatar section
                    _ProfileHeader(user: user),

                    AppSpacing.verticalGapXl,

                    // Stats section
                    if (profileState.profile?.stats != null)
                      _StatsCard(stats: profileState.profile!.stats!),

                    if (profileState.profile?.stats != null)
                      AppSpacing.verticalGapLg,

                    // Bio section
                    if (profileState.profile?.bio != null) ...[
                      AppCard(
                        outlined: true,
                        padding: AppSurfaces.cardPaddingStandard,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bio',
                              style: AppTextStyles.sectionHeader(context),
                            ),
                            AppSpacing.verticalGapSm,
                            Text(
                              profileState.profile!.bio!,
                              style: theme.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      AppSpacing.verticalGapLg,
                    ],

                    // Actions section
                    _ActionsSection(
                      onSettingsTap: () => context.goToSettings(),
                      onLogoutTap: () => _showLogoutDialog(context, ref),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Future<void> _showLogoutDialog(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context);

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.logoutConfirmTitle),
        content: Text(l10n.logoutConfirmMessage),
        actions: [
          AppTextButton(
            label: l10n.cancel,
            onPressed: () => Navigator.of(context).pop(false),
          ),
          AppFilledButton(
            label: l10n.logout,
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref.read(authProvider.notifier).signOut();
    }
  }
}

/// Profile header with avatar and name.
class _ProfileHeader extends StatelessWidget {
  final dynamic user;

  const _ProfileHeader({this.user});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Column(
      children: [
        // Avatar
        AppAvatar(
          name: user?.name,
          imageUrl: user?.avatarUrl,
          size: AppAvatarSize.xl,
        ),

        AppSpacing.verticalGapMd,

        // Name
        Text(
          user?.name ?? l10n.anonymous,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),

        AppSpacing.verticalGapXs,

        // Email
        Text(user?.email ?? '', style: AppTextStyles.cardSubtitle(context)),
      ],
    );
  }
}

/// Stats card with followers, following, posts count.
class _StatsCard extends StatelessWidget {
  final dynamic stats;

  const _StatsCard({required this.stats});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final dividerColor = Theme.of(context).colorScheme.outlineVariant;

    return AppCard(
      outlined: true,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _StatItem(
            value: stats.followersCount.toString(),
            label: l10n.followers,
          ),
          Container(width: 1, height: 40, color: dividerColor),
          _StatItem(
            value: stats.followingCount.toString(),
            label: l10n.following,
          ),
          Container(width: 1, height: 40, color: dividerColor),
          _StatItem(value: stats.postsCount.toString(), label: l10n.posts),
        ],
      ),
    );
  }
}

/// Single stat item widget.
class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(label, style: AppTextStyles.caption(context)),
      ],
    );
  }
}

/// Actions section with settings and logout.
class _ActionsSection extends StatelessWidget {
  final VoidCallback onSettingsTap;
  final VoidCallback onLogoutTap;

  const _ActionsSection({
    required this.onSettingsTap,
    required this.onLogoutTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          AppListTile(
            title: l10n.settingsTitle,
            leading: AppIconContainer(
              icon: Icons.settings_outlined,
              size: AppIconContainerSize.small,
              color: colorScheme.onSurfaceVariant,
              backgroundColor: colorScheme.surfaceContainerHighest,
            ),
            showDisclosure: true,
            onTap: onSettingsTap,
          ),
          Divider(
            indent: AppSpacing.lg,
            endIndent: AppSpacing.lg,
            height: 1,
            color: colorScheme.outlineVariant,
          ),
          AppListTile(
            title: l10n.logout,
            leading: AppIconContainer(
              icon: Icons.logout,
              size: AppIconContainerSize.small,
              color: colorScheme.onErrorContainer,
              backgroundColor: colorScheme.errorContainer,
            ),
            onTap: onLogoutTap,
          ),
        ],
      ),
    );
  }
}
