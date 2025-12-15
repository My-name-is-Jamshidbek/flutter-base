// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'App Template';

  @override
  String get homeTitle => 'Home';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get welcomeMessage => 'Welcome to App Template!';

  @override
  String get authLoginTitle => 'Login';

  @override
  String get authRegisterTitle => 'Register';

  @override
  String get authEmailHint => 'Email';

  @override
  String get authPasswordHint => 'Password';

  @override
  String get authLoginButton => 'Sign In';

  @override
  String get authRegisterButton => 'Sign Up';

  @override
  String get authForgotPassword => 'Forgot password?';

  @override
  String homeWelcomeMessage(String name) {
    return 'Hello, $name!';
  }

  @override
  String homeItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
      zero: 'No items',
    );
    return '$_temp0';
  }

  @override
  String homeUnreadMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count unread messages',
      one: '1 unread message',
      zero: 'No new messages',
    );
    return '$_temp0';
  }

  @override
  String commonGenderGreeting(String gender, String name) {
    String _temp0 = intl.Intl.selectLogic(gender, {
      'male': 'Mr. $name',
      'female': 'Ms. $name',
      'other': '$name',
    });
    return '$_temp0';
  }

  @override
  String commonDateFormat(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Last updated: $dateString';
  }

  @override
  String commonTimeAgo(String time, int count) {
    String _temp0 = intl.Intl.selectLogic(time, {
      'now': 'Just now',
      'minutes': '$count minutes ago',
      'hours': '$count hours ago',
      'days': '$count days ago',
      'other': '$time',
    });
    return '$_temp0';
  }

  @override
  String get counterLabel => 'You have pushed the button this many times:';

  @override
  String counterValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count times',
      two: 'twice',
      one: 'once',
      zero: 'zero times',
    );
    return '$_temp0';
  }

  @override
  String get appearanceSection => 'Appearance';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get darkModeSubtitle => 'Use dark theme';

  @override
  String get language => 'Language';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get aboutSection => 'About';

  @override
  String get version => 'Version';

  @override
  String get licenses => 'Licenses';

  @override
  String get themeMode => 'Theme Mode';

  @override
  String get themeModeSystem => 'System';

  @override
  String get themeModeLight => 'Light';

  @override
  String get themeModeDark => 'Dark';

  @override
  String get cancel => 'Cancel';

  @override
  String get ok => 'OK';

  @override
  String get save => 'Save';

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  @override
  String get close => 'Close';

  @override
  String get retry => 'Retry';

  @override
  String get errorGeneric => 'Something went wrong. Please try again.';

  @override
  String get errorNetwork => 'Network error. Please check your connection.';

  @override
  String get errorNotFound => 'The requested resource was not found.';

  @override
  String get loadingMessage => 'Loading...';

  @override
  String get emptyStateMessage => 'No data available';

  @override
  String get searchHint => 'Search...';

  @override
  String get noResults => 'No results found';

  @override
  String get confirmDelete => 'Are you sure you want to delete this?';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get increment => 'Increment';

  @override
  String get noItemsTitle => 'No Items';

  @override
  String get noItemsMessage => 'There are no items to display';

  @override
  String get inputPasswordLabel => 'Password';

  @override
  String get inputShowPassword => 'Show password';

  @override
  String get inputHidePassword => 'Hide password';

  @override
  String get inputSearchHint => 'Search...';

  @override
  String get inputClear => 'Clear';

  @override
  String get inputPhoneLabel => 'Phone Number';

  @override
  String get inputEmailLabel => 'Email';

  @override
  String get inputEmailHint => 'example@email.com';

  @override
  String get inputEmailRequired => 'Email is required';

  @override
  String get inputEmailInvalid => 'Enter a valid email';

  @override
  String get buttonLoading => 'Loading...';

  @override
  String get actionSubmit => 'Submit';

  @override
  String get actionContinue => 'Continue';

  @override
  String get actionBack => 'Back';

  @override
  String get actionNext => 'Next';

  @override
  String get actionDone => 'Done';

  @override
  String get actionConfirm => 'Confirm';

  @override
  String get actionApply => 'Apply';

  @override
  String get actionReset => 'Reset';

  @override
  String get actionRefresh => 'Refresh';

  @override
  String get actionShare => 'Share';

  @override
  String get actionCopy => 'Copy';

  @override
  String get actionPaste => 'Paste';

  @override
  String get sectionGeneral => 'General';

  @override
  String get sectionAccount => 'Account';

  @override
  String get sectionPrivacy => 'Privacy';

  @override
  String get sectionNotifications => 'Notifications';

  @override
  String get sectionHelp => 'Help & Support';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusOffline => 'Offline';

  @override
  String get statusConnecting => 'Connecting...';

  @override
  String get statusSyncing => 'Syncing...';

  @override
  String get homeSubtitle => 'Flutter Template with Design Tokens';

  @override
  String get homeCounterHint => 'Tap the button to increment';

  @override
  String get quickActionsTitle => 'Quick Actions';

  @override
  String get widgetDemosTitle => 'Widget Demos';

  @override
  String get loadingData => 'Loading data...';

  @override
  String get somethingWentWrong => 'Something went wrong!';

  @override
  String get selectStateToPreview => 'Select a state to preview';

  @override
  String get skeletonLoadingTitle => 'Skeleton Loading';

  @override
  String get preferencesSection => 'Preferences';

  @override
  String get notifications => 'Notifications';

  @override
  String get notificationsSubtitle => 'Receive push notifications';

  @override
  String get analytics => 'Analytics';

  @override
  String get analyticsSubtitle => 'Help improve the app';

  @override
  String get openSourceLicenses => 'Open source licenses';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get madeWithFlutter => 'Made with ❤️ using Flutter';

  @override
  String versionInfo(String version, String build) {
    return '$version (Build $build)';
  }

  @override
  String get themeModeSystemSubtitle => 'Follow device settings';

  @override
  String get themeModeLightSubtitle => 'Always use light theme';

  @override
  String get themeModeDarkSubtitle => 'Always use dark theme';

  @override
  String get systemLanguage => 'System';

  @override
  String get useDeviceLanguage => 'Use device language';

  @override
  String get networkErrorTimeout => 'Connection timed out. Please try again.';

  @override
  String get networkErrorNoConnection =>
      'No internet connection. Please check your network.';

  @override
  String get networkErrorServer => 'Server error. Please try again later.';

  @override
  String get networkErrorSessionExpired =>
      'Session expired. Please log in again.';

  @override
  String get networkErrorAccessDenied =>
      'You don\'t have permission to access this.';

  @override
  String get networkErrorNotFound => 'The requested resource was not found.';

  @override
  String networkErrorResourceNotFound(String resource) {
    return '$resource not found.';
  }

  @override
  String get networkErrorRateLimit =>
      'Too many requests. Please wait and try again.';

  @override
  String get networkErrorCancelled => 'Request was cancelled.';

  @override
  String get networkErrorUnknown => 'An unexpected error occurred.';

  @override
  String get networkErrorInvalidCertificate => 'Invalid SSL certificate.';

  @override
  String get networkErrorInvalidRequest => 'Invalid request.';

  @override
  String get networkErrorAuthRequired => 'Authentication required.';

  @override
  String get networkErrorValidationFailed => 'Validation failed.';

  @override
  String networkRetrying(int attempt, int maxAttempts) {
    return 'Retrying... ($attempt/$maxAttempts)';
  }
}
