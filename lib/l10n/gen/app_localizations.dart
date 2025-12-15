import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_uz.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
    Locale('uz'),
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'App Template'**
  String get appTitle;

  /// Title for the home screen
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeTitle;

  /// Title for the settings screen
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// Welcome message shown on home screen
  ///
  /// In en, this message translates to:
  /// **'Welcome to App Template!'**
  String get welcomeMessage;

  /// Login screen title
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get authLoginTitle;

  /// Register screen title
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get authRegisterTitle;

  /// Email input hint
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get authEmailHint;

  /// Password input hint
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get authPasswordHint;

  /// Login button text
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get authLoginButton;

  /// Register button text
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get authRegisterButton;

  /// Forgot password link text
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get authForgotPassword;

  /// Personalized welcome message
  ///
  /// In en, this message translates to:
  /// **'Hello, {name}!'**
  String homeWelcomeMessage(String name);

  /// Number of items with plural support
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No items} =1{1 item} other{{count} items}}'**
  String homeItemCount(int count);

  /// Number of unread messages
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No new messages} =1{1 unread message} other{{count} unread messages}}'**
  String homeUnreadMessages(int count);

  /// Gender-aware greeting
  ///
  /// In en, this message translates to:
  /// **'{gender, select, male{Mr. {name}} female{Ms. {name}} other{{name}}}'**
  String commonGenderGreeting(String gender, String name);

  /// Date display format
  ///
  /// In en, this message translates to:
  /// **'Last updated: {date}'**
  String commonDateFormat(DateTime date);

  /// Relative time display
  ///
  /// In en, this message translates to:
  /// **'{time, select, now{Just now} minutes{{count} minutes ago} hours{{count} hours ago} days{{count} days ago} other{{time}}}'**
  String commonTimeAgo(String time, int count);

  /// Label for counter display
  ///
  /// In en, this message translates to:
  /// **'You have pushed the button this many times:'**
  String get counterLabel;

  /// Counter value with plural
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{zero times} =1{once} =2{twice} other{{count} times}}'**
  String counterValue(int count);

  /// Appearance section title
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearanceSection;

  /// Dark mode setting title
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// Dark mode setting subtitle
  ///
  /// In en, this message translates to:
  /// **'Use dark theme'**
  String get darkModeSubtitle;

  /// Language setting title
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Select language dialog title
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// About section title
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutSection;

  /// Version label
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// Licenses label
  ///
  /// In en, this message translates to:
  /// **'Licenses'**
  String get licenses;

  /// Theme mode setting title
  ///
  /// In en, this message translates to:
  /// **'Theme Mode'**
  String get themeMode;

  /// System theme mode
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeModeSystem;

  /// Light theme mode
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeModeLight;

  /// Dark theme mode
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeModeDark;

  /// Cancel button text
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// OK button text
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// Save button text
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Delete button text
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Edit button text
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// Close button text
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// Retry button text
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Generic error message
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorGeneric;

  /// Network error message
  ///
  /// In en, this message translates to:
  /// **'Network error. Please check your connection.'**
  String get errorNetwork;

  /// Not found error message
  ///
  /// In en, this message translates to:
  /// **'The requested resource was not found.'**
  String get errorNotFound;

  /// Loading indicator text
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loadingMessage;

  /// Empty state message
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get emptyStateMessage;

  /// Search input hint
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get searchHint;

  /// No search results message
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResults;

  /// Delete confirmation message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this?'**
  String get confirmDelete;

  /// Yes button text
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No button text
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// Increment button label
  ///
  /// In en, this message translates to:
  /// **'Increment'**
  String get increment;

  /// Empty state title when no items
  ///
  /// In en, this message translates to:
  /// **'No Items'**
  String get noItemsTitle;

  /// Empty state message when no items
  ///
  /// In en, this message translates to:
  /// **'There are no items to display'**
  String get noItemsMessage;

  /// Password field label
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get inputPasswordLabel;

  /// Show password tooltip
  ///
  /// In en, this message translates to:
  /// **'Show password'**
  String get inputShowPassword;

  /// Hide password tooltip
  ///
  /// In en, this message translates to:
  /// **'Hide password'**
  String get inputHidePassword;

  /// Search field hint text
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get inputSearchHint;

  /// Clear button tooltip
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get inputClear;

  /// Phone field label
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get inputPhoneLabel;

  /// Email field label
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get inputEmailLabel;

  /// Email field hint
  ///
  /// In en, this message translates to:
  /// **'example@email.com'**
  String get inputEmailHint;

  /// Email required validation message
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get inputEmailRequired;

  /// Email invalid validation message
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get inputEmailInvalid;

  /// Loading button state text
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get buttonLoading;

  /// Submit action text
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get actionSubmit;

  /// Continue action text
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get actionContinue;

  /// Back action text
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get actionBack;

  /// Next action text
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get actionNext;

  /// Done action text
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get actionDone;

  /// Confirm action text
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get actionConfirm;

  /// Apply action text
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get actionApply;

  /// Reset action text
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get actionReset;

  /// Refresh action text
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get actionRefresh;

  /// Share action text
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get actionShare;

  /// Copy action text
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get actionCopy;

  /// Paste action text
  ///
  /// In en, this message translates to:
  /// **'Paste'**
  String get actionPaste;

  /// General section header
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get sectionGeneral;

  /// Account section header
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get sectionAccount;

  /// Privacy section header
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get sectionPrivacy;

  /// Notifications section header
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get sectionNotifications;

  /// Help section header
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get sectionHelp;

  /// Online status
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get statusOnline;

  /// Offline status
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get statusOffline;

  /// Connecting status
  ///
  /// In en, this message translates to:
  /// **'Connecting...'**
  String get statusConnecting;

  /// Syncing status
  ///
  /// In en, this message translates to:
  /// **'Syncing...'**
  String get statusSyncing;

  /// Subtitle on home screen welcome card
  ///
  /// In en, this message translates to:
  /// **'Flutter Template with Design Tokens'**
  String get homeSubtitle;

  /// Hint text below counter
  ///
  /// In en, this message translates to:
  /// **'Tap the button to increment'**
  String get homeCounterHint;

  /// Quick actions section title
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get quickActionsTitle;

  /// Widget demos section title
  ///
  /// In en, this message translates to:
  /// **'Widget Demos'**
  String get widgetDemosTitle;

  /// Loading data message
  ///
  /// In en, this message translates to:
  /// **'Loading data...'**
  String get loadingData;

  /// Generic error message for demos
  ///
  /// In en, this message translates to:
  /// **'Something went wrong!'**
  String get somethingWentWrong;

  /// Hint to select a demo state
  ///
  /// In en, this message translates to:
  /// **'Select a state to preview'**
  String get selectStateToPreview;

  /// Skeleton loading demo title
  ///
  /// In en, this message translates to:
  /// **'Skeleton Loading'**
  String get skeletonLoadingTitle;

  /// Preferences section title
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferencesSection;

  /// Notifications setting title
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// Notifications setting subtitle
  ///
  /// In en, this message translates to:
  /// **'Receive push notifications'**
  String get notificationsSubtitle;

  /// Analytics setting title
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get analytics;

  /// Analytics setting subtitle
  ///
  /// In en, this message translates to:
  /// **'Help improve the app'**
  String get analyticsSubtitle;

  /// Open source licenses subtitle
  ///
  /// In en, this message translates to:
  /// **'Open source licenses'**
  String get openSourceLicenses;

  /// Privacy policy link title
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// Terms of service link title
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// Footer credit text
  ///
  /// In en, this message translates to:
  /// **'Made with ❤️ using Flutter'**
  String get madeWithFlutter;

  /// Version and build info
  ///
  /// In en, this message translates to:
  /// **'{version} (Build {build})'**
  String versionInfo(String version, String build);

  /// System theme mode description
  ///
  /// In en, this message translates to:
  /// **'Follow device settings'**
  String get themeModeSystemSubtitle;

  /// Light theme mode description
  ///
  /// In en, this message translates to:
  /// **'Always use light theme'**
  String get themeModeLightSubtitle;

  /// Dark theme mode description
  ///
  /// In en, this message translates to:
  /// **'Always use dark theme'**
  String get themeModeDarkSubtitle;

  /// System language option
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get systemLanguage;

  /// System language option subtitle
  ///
  /// In en, this message translates to:
  /// **'Use device language'**
  String get useDeviceLanguage;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru', 'uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
    case 'uz':
      return AppLocalizationsUz();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
