import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';

import 'package:app_template/core/di/providers.dart';
import 'package:app_template/core/di/auth_provider.dart';
import 'package:app_template/domain/entities/user.dart';

/// Keys for profile cache.
abstract class ProfileCacheKeys {
  static const String userProfile = 'user_profile_cache';
  static const String profileCacheTime = 'user_profile_cache_time';
}

/// Profile state.
class ProfileState {
  final UserProfile? profile;
  final bool isLoading;
  final bool isRefreshing;
  final Object? error;
  final DateTime? lastFetched;

  const ProfileState({
    this.profile,
    this.isLoading = false,
    this.isRefreshing = false,
    this.error,
    this.lastFetched,
  });

  /// Whether profile data is available.
  bool get hasProfile => profile != null;

  /// Whether there was an error.
  bool get hasError => error != null;

  /// Whether the cache is stale (older than 5 minutes).
  bool get isStale {
    if (lastFetched == null) return true;
    return DateTime.now().difference(lastFetched!) > const Duration(minutes: 5);
  }

  ProfileState copyWith({
    UserProfile? profile,
    bool clearProfile = false,
    bool? isLoading,
    bool? isRefreshing,
    Object? error,
    bool clearError = false,
    DateTime? lastFetched,
  }) {
    return ProfileState(
      profile: clearProfile ? null : (profile ?? this.profile),
      isLoading: isLoading ?? this.isLoading,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      error: clearError ? null : (error ?? this.error),
      lastFetched: lastFetched ?? this.lastFetched,
    );
  }
}

/// Profile notifier for managing user profile state.
class ProfileNotifier extends Notifier<ProfileState> {
  @override
  ProfileState build() {
    // Listen to auth state changes
    ref.listen(authProvider, (previous, next) {
      if (next.isAuthenticated &&
          (previous == null || !previous.isAuthenticated)) {
        // User just logged in, fetch profile
        fetchProfile();
      } else if (!next.isAuthenticated &&
          previous != null &&
          previous.isAuthenticated) {
        // User logged out, clear profile
        clearProfile();
      }
    });

    // Initialize from cache
    _initializeFromCache();
    return const ProfileState();
  }

  /// Initialize profile from cached data.
  Future<void> _initializeFromCache() async {
    final prefs = ref.read(sharedPreferencesProvider);
    final cachedProfile = prefs.getString(ProfileCacheKeys.userProfile);
    final cacheTimeStr = prefs.getString(ProfileCacheKeys.profileCacheTime);

    if (cachedProfile != null) {
      try {
        final profileJson = json.decode(cachedProfile) as Map<String, dynamic>;
        final profile = UserProfile.fromJson(profileJson);
        final cacheTime = cacheTimeStr != null
            ? DateTime.tryParse(cacheTimeStr)
            : null;

        state = state.copyWith(profile: profile, lastFetched: cacheTime);

        // If cache is stale, refresh in background
        if (state.isStale && ref.read(authProvider).isAuthenticated) {
          fetchProfile();
        }
      } catch (_) {
        // Invalid cache, clear it
        await _clearCache();
      }
    }
  }

  /// Fetch the user profile from API.
  Future<void> fetchProfile({bool forceRefresh = false}) async {
    if (state.isLoading || state.isRefreshing) return;

    // Don't fetch if not authenticated
    if (!ref.read(authProvider).isAuthenticated) return;

    // Don't fetch if cache is fresh and not forcing refresh
    if (!forceRefresh && !state.isStale && state.hasProfile) return;

    final isRefresh = state.hasProfile;
    state = state.copyWith(
      isLoading: !isRefresh,
      isRefreshing: isRefresh,
      clearError: true,
    );

    try {
      // TODO: Replace with actual API call
      // final result = await ref.read(profileRepositoryProvider).getProfile();

      await Future.delayed(const Duration(milliseconds: 500));

      final currentUser = ref.read(currentUserProvider);
      if (currentUser == null) {
        state = state.copyWith(isLoading: false, isRefreshing: false);
        return;
      }

      final profile = UserProfile(
        user: currentUser,
        bio: 'Hello, I\'m using this app!',
        location: null,
        stats: const UserStats(
          followersCount: 100,
          followingCount: 50,
          postsCount: 25,
        ),
      );

      await _cacheProfile(profile);
      state = state.copyWith(
        profile: profile,
        isLoading: false,
        isRefreshing: false,
        lastFetched: DateTime.now(),
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, isRefreshing: false, error: e);
    }
  }

  /// Update the user profile.
  Future<void> updateProfile({
    String? name,
    String? bio,
    String? location,
    String? website,
  }) async {
    if (!ref.read(authProvider).isAuthenticated) return;
    if (state.profile == null) return;

    state = state.copyWith(isLoading: true, clearError: true);

    try {
      // TODO: Replace with actual API call
      await Future.delayed(const Duration(milliseconds: 500));

      final updatedUser = state.profile!.user.copyWith(
        name: name ?? state.profile!.user.name,
      );

      final updatedProfile = state.profile!.copyWith(
        user: updatedUser,
        bio: bio ?? state.profile!.bio,
        location: location ?? state.profile!.location,
        website: website ?? state.profile!.website,
      );

      // Update auth state with new user info
      await ref.read(authProvider.notifier).updateUser(updatedUser);

      await _cacheProfile(updatedProfile);
      state = state.copyWith(
        profile: updatedProfile,
        isLoading: false,
        lastFetched: DateTime.now(),
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e);
      rethrow;
    }
  }

  /// Clear the profile.
  void clearProfile() {
    _clearCache();
    state = const ProfileState();
  }

  /// Cache the profile locally.
  Future<void> _cacheProfile(UserProfile profile) async {
    final prefs = ref.read(sharedPreferencesProvider);
    await Future.wait([
      prefs.setString(
        ProfileCacheKeys.userProfile,
        json.encode(profile.toJson()),
      ),
      prefs.setString(
        ProfileCacheKeys.profileCacheTime,
        DateTime.now().toIso8601String(),
      ),
    ]);
  }

  /// Clear the profile cache.
  Future<void> _clearCache() async {
    final prefs = ref.read(sharedPreferencesProvider);
    await Future.wait([
      prefs.remove(ProfileCacheKeys.userProfile),
      prefs.remove(ProfileCacheKeys.profileCacheTime),
    ]);
  }
}

/// Provider for profile state.
final profileProvider = NotifierProvider<ProfileNotifier, ProfileState>(
  ProfileNotifier.new,
);

/// Provider for current user profile.
final userProfileProvider = Provider<UserProfile?>((ref) {
  return ref.watch(profileProvider).profile;
});
