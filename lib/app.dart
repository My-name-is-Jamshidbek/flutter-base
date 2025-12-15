import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/core/config/app_settings.dart';
import 'package:app_template/l10n/gen/app_localizations.dart';
import 'package:app_template/presentation/router/app_router.dart';
import 'package:app_template/presentation/theme/app_theme.dart';

/// The root widget of the application.
///
/// This widget sets up:
/// - Material 3 theming (light and dark)
/// - Localization (with AppLocalizations)
/// - Navigation (with GoRouter and route guards)
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(appSettingsProvider);
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'App Template',
      debugShowCheckedModeBanner: false,

      // Theme
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: settings.themeMode,

      // Locale
      locale: settings.locale,

      // Localization
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,

      // Router
      routerConfig: router,
    );
  }
}
