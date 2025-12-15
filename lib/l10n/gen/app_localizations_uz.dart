// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uzbek (`uz`).
class AppLocalizationsUz extends AppLocalizations {
  AppLocalizationsUz([String locale = 'uz']) : super(locale);

  @override
  String get appTitle => 'Ilova Shabloni';

  @override
  String get homeTitle => 'Bosh sahifa';

  @override
  String get settingsTitle => 'Sozlamalar';

  @override
  String get welcomeMessage => 'Ilova Shabloniga xush kelibsiz!';

  @override
  String get authLoginTitle => 'Kirish';

  @override
  String get authRegisterTitle => 'Ro\'yxatdan o\'tish';

  @override
  String get authEmailHint => 'Elektron pochta';

  @override
  String get authPasswordHint => 'Parol';

  @override
  String get authLoginButton => 'Kirish';

  @override
  String get authRegisterButton => 'Ro\'yxatdan o\'tish';

  @override
  String get authForgotPassword => 'Parolni unutdingizmi?';

  @override
  String homeWelcomeMessage(String name) {
    return 'Salom, $name!';
  }

  @override
  String homeItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ta element',
      one: '1 ta element',
      zero: 'Element yo\'q',
    );
    return '$_temp0';
  }

  @override
  String homeUnreadMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ta o\'qilmagan xabar',
      one: '1 ta o\'qilmagan xabar',
      zero: 'Yangi xabarlar yo\'q',
    );
    return '$_temp0';
  }

  @override
  String commonGenderGreeting(String gender, String name) {
    String _temp0 = intl.Intl.selectLogic(gender, {
      'male': 'Janob $name',
      'female': 'Xonim $name',
      'other': '$name',
    });
    return '$_temp0';
  }

  @override
  String commonDateFormat(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Yangilangan: $dateString';
  }

  @override
  String commonTimeAgo(String time, int count) {
    String _temp0 = intl.Intl.selectLogic(time, {
      'now': 'Hozirgina',
      'minutes': '$count daqiqa oldin',
      'hours': '$count soat oldin',
      'days': '$count kun oldin',
      'other': '$time',
    });
    return '$_temp0';
  }

  @override
  String get counterLabel => 'Siz tugmani shuncha marta bosdingiz:';

  @override
  String counterValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count marta',
      two: 'ikki marta',
      one: 'bir marta',
      zero: 'hech qachon',
    );
    return '$_temp0';
  }

  @override
  String get appearanceSection => 'Ko\'rinish';

  @override
  String get darkMode => 'Qorong\'u rejim';

  @override
  String get darkModeSubtitle => 'Qorong\'u mavzudan foydalanish';

  @override
  String get language => 'Til';

  @override
  String get selectLanguage => 'Tilni tanlang';

  @override
  String get aboutSection => 'Haqida';

  @override
  String get version => 'Versiya';

  @override
  String get licenses => 'Litsenziyalar';

  @override
  String get themeMode => 'Mavzu rejimi';

  @override
  String get themeModeSystem => 'Tizim';

  @override
  String get themeModeLight => 'Yorug\'';

  @override
  String get themeModeDark => 'Qorong\'u';

  @override
  String get cancel => 'Bekor qilish';

  @override
  String get ok => 'OK';

  @override
  String get save => 'Saqlash';

  @override
  String get delete => 'O\'chirish';

  @override
  String get edit => 'Tahrirlash';

  @override
  String get close => 'Yopish';

  @override
  String get retry => 'Qayta urinish';

  @override
  String get errorGeneric => 'Xatolik yuz berdi. Qaytadan urinib ko\'ring.';

  @override
  String get errorNetwork => 'Tarmoq xatosi. Internetni tekshiring.';

  @override
  String get errorNotFound => 'So\'ralgan resurs topilmadi.';

  @override
  String get loadingMessage => 'Yuklanmoqda...';

  @override
  String get emptyStateMessage => 'Ma\'lumot mavjud emas';

  @override
  String get searchHint => 'Qidirish...';

  @override
  String get noResults => 'Natija topilmadi';

  @override
  String get confirmDelete => 'Buni o\'chirishga ishonchingiz komilmi?';

  @override
  String get yes => 'Ha';

  @override
  String get no => 'Yo\'q';

  @override
  String get increment => 'Oshirish';

  @override
  String get noItemsTitle => 'Elementlar yo\'q';

  @override
  String get noItemsMessage => 'Ko\'rsatish uchun elementlar yo\'q';

  @override
  String get inputPasswordLabel => 'Parol';

  @override
  String get inputShowPassword => 'Parolni ko\'rsatish';

  @override
  String get inputHidePassword => 'Parolni yashirish';

  @override
  String get inputSearchHint => 'Qidirish...';

  @override
  String get inputClear => 'Tozalash';

  @override
  String get inputPhoneLabel => 'Telefon raqami';

  @override
  String get inputEmailLabel => 'Elektron pochta';

  @override
  String get inputEmailHint => 'example@email.com';

  @override
  String get inputEmailRequired => 'Elektron pochta talab qilinadi';

  @override
  String get inputEmailInvalid => 'To\'g\'ri email kiriting';

  @override
  String get buttonLoading => 'Yuklanmoqda...';

  @override
  String get actionSubmit => 'Yuborish';

  @override
  String get actionContinue => 'Davom etish';

  @override
  String get actionBack => 'Orqaga';

  @override
  String get actionNext => 'Keyingi';

  @override
  String get actionDone => 'Tayyor';

  @override
  String get actionConfirm => 'Tasdiqlash';

  @override
  String get actionApply => 'Qo\'llash';

  @override
  String get actionReset => 'Qayta tiklash';

  @override
  String get actionRefresh => 'Yangilash';

  @override
  String get actionShare => 'Ulashish';

  @override
  String get actionCopy => 'Nusxalash';

  @override
  String get actionPaste => 'Qo\'yish';

  @override
  String get sectionGeneral => 'Umumiy';

  @override
  String get sectionAccount => 'Hisob';

  @override
  String get sectionPrivacy => 'Maxfiylik';

  @override
  String get sectionNotifications => 'Bildirishnomalar';

  @override
  String get sectionHelp => 'Yordam va qo\'llab-quvvatlash';

  @override
  String get statusOnline => 'Onlayn';

  @override
  String get statusOffline => 'Oflayn';

  @override
  String get statusConnecting => 'Ulanmoqda...';

  @override
  String get statusSyncing => 'Sinxronlanmoqda...';

  @override
  String get homeSubtitle => 'Dizayn tokenlari bilan Flutter shabloni';

  @override
  String get homeCounterHint => 'Oshirish uchun tugmani bosing';

  @override
  String get quickActionsTitle => 'Tezkor amallar';

  @override
  String get widgetDemosTitle => 'Vidjet namoyishlari';

  @override
  String get loadingData => 'Ma\'lumotlar yuklanmoqda...';

  @override
  String get somethingWentWrong => 'Xatolik yuz berdi!';

  @override
  String get selectStateToPreview => 'Ko\'rish uchun holatni tanlang';

  @override
  String get skeletonLoadingTitle => 'Skelet yuklash';

  @override
  String get preferencesSection => 'Sozlamalar';

  @override
  String get notifications => 'Bildirishnomalar';

  @override
  String get notificationsSubtitle => 'Push-bildirishnomalarni qabul qilish';

  @override
  String get analytics => 'Tahlillar';

  @override
  String get analyticsSubtitle => 'Ilovani yaxshilashga yordam bering';

  @override
  String get openSourceLicenses => 'Ochiq kodli litsenziyalar';

  @override
  String get privacyPolicy => 'Maxfiylik siyosati';

  @override
  String get termsOfService => 'Foydalanish shartlari';

  @override
  String get madeWithFlutter => 'Flutter yordamida ❤️ bilan yaratilgan';

  @override
  String versionInfo(String version, String build) {
    return '$version (Build $build)';
  }

  @override
  String get themeModeSystemSubtitle => 'Qurilma sozlamalariga amal qilish';

  @override
  String get themeModeLightSubtitle => 'Doim yorug\' mavzudan foydalanish';

  @override
  String get themeModeDarkSubtitle => 'Doim qorong\'u mavzudan foydalanish';

  @override
  String get systemLanguage => 'Tizim';

  @override
  String get useDeviceLanguage => 'Qurilma tilidan foydalanish';

  @override
  String get networkErrorTimeout =>
      'Ulanish vaqti tugadi. Iltimos, qayta urinib ko\'ring.';

  @override
  String get networkErrorNoConnection =>
      'Internet aloqasi yo\'q. Tarmoqni tekshiring.';

  @override
  String get networkErrorServer => 'Server xatosi. Keyinroq urinib ko\'ring.';

  @override
  String get networkErrorSessionExpired =>
      'Sessiya muddati tugadi. Qayta kiring.';

  @override
  String get networkErrorAccessDenied => 'Sizda bu resursga ruxsat yo\'q.';

  @override
  String get networkErrorNotFound => 'So\'ralgan resurs topilmadi.';

  @override
  String networkErrorResourceNotFound(String resource) {
    return '$resource topilmadi.';
  }

  @override
  String get networkErrorRateLimit =>
      'Juda ko\'p so\'rov. Kuting va qayta urinib ko\'ring.';

  @override
  String get networkErrorCancelled => 'So\'rov bekor qilindi.';

  @override
  String get networkErrorUnknown => 'Kutilmagan xato yuz berdi.';

  @override
  String get networkErrorInvalidCertificate => 'Noto\'g\'ri SSL sertifikati.';

  @override
  String get networkErrorInvalidRequest => 'Noto\'g\'ri so\'rov.';

  @override
  String get networkErrorAuthRequired => 'Autentifikatsiya talab qilinadi.';

  @override
  String get networkErrorValidationFailed => 'Tekshirish xatosi.';

  @override
  String networkRetrying(int attempt, int maxAttempts) {
    return 'Qayta urinish... ($attempt/$maxAttempts)';
  }

  @override
  String get skip => 'O\'tkazib yuborish';

  @override
  String get next => 'Keyingi';

  @override
  String get back => 'Orqaga';

  @override
  String get getStarted => 'Boshlash';

  @override
  String get loginTitle => 'Xush kelibsiz';

  @override
  String get loginSubtitle => 'Davom etish uchun kiring';

  @override
  String get registerTitle => 'Hisob yaratish';

  @override
  String get registerSubtitle => 'Boshlash uchun ro\'yxatdan o\'ting';

  @override
  String get email => 'Elektron pochta';

  @override
  String get password => 'Parol';

  @override
  String get name => 'Ism';

  @override
  String get confirmPassword => 'Parolni tasdiqlang';

  @override
  String get login => 'Kirish';

  @override
  String get register => 'Ro\'yxatdan o\'tish';

  @override
  String get forgotPassword => 'Parolni unutdingizmi?';

  @override
  String get noAccount => 'Hisobingiz yo\'qmi?';

  @override
  String get alreadyHaveAccount => 'Hisobingiz bormi?';

  @override
  String get emailRequired => 'Elektron pochta talab qilinadi';

  @override
  String get emailInvalid => 'To\'g\'ri elektron pochta kiriting';

  @override
  String get passwordRequired => 'Parol talab qilinadi';

  @override
  String get passwordTooShort =>
      'Parol kamida 6 ta belgidan iborat bo\'lishi kerak';

  @override
  String get nameRequired => 'Ism talab qilinadi';

  @override
  String get confirmPasswordRequired => 'Parolni tasdiqlang';

  @override
  String get passwordsDoNotMatch => 'Parollar mos kelmaydi';

  @override
  String get forgotPasswordTitle => 'Parolni tiklash';

  @override
  String get forgotPasswordSubtitle =>
      'Elektron pochtangizni kiriting, biz tiklash havolasini yuboramiz';

  @override
  String get sendResetLink => 'Tiklash havolasini yuborish';

  @override
  String get backToLogin => 'Kirishga qaytish';

  @override
  String get viewOnboarding => 'Tanishuvni ko\'rish';

  @override
  String get checkYourEmail => 'Elektron pochtangizni tekshiring';

  @override
  String resetLinkSent(String email) {
    return 'Parolni tiklash havolasi $email manziliga yuborildi';
  }

  @override
  String get didNotReceiveEmail => 'Xat kelmadimi?';

  @override
  String get profileTitle => 'Profil';

  @override
  String get editProfile => 'Profilni tahrirlash';

  @override
  String get anonymous => 'Anonim';

  @override
  String get followers => 'Obunachilar';

  @override
  String get following => 'Obunalar';

  @override
  String get posts => 'Postlar';

  @override
  String get logout => 'Chiqish';

  @override
  String get logoutConfirmTitle => 'Chiqishni xohlaysizmi?';

  @override
  String get logoutConfirmMessage => 'Haqiqatan ham chiqmoqchimisiz?';

  @override
  String get accountSettings => 'Hisob sozlamalari';

  @override
  String get privacy => 'Maxfiylik';

  @override
  String get errorScreenTitle => 'Xato';

  @override
  String get pageNotFound => 'Sahifa topilmadi';

  @override
  String pageNotFoundMessage(String location) {
    return '\"$location\" manzilida sahifa topilmadi.';
  }

  @override
  String get goHome => 'Bosh sahifaga';

  @override
  String userDetailTitle(int userId) {
    return 'Foydalanuvchi #$userId';
  }

  @override
  String get userDetail => 'Foydalanuvchi ma\'lumotlari';

  @override
  String viewingUserWithId(int userId) {
    return 'ID: $userId foydalanuvchi ko\'rilmoqda';
  }

  @override
  String itemDetailTitle(int itemId) {
    return 'Element #$itemId';
  }

  @override
  String get itemDetail => 'Element ma\'lumotlari';

  @override
  String viewingItemWithId(int itemId) {
    return 'ID: $itemId element ko\'rilmoqda';
  }

  @override
  String get typedRouteParamsDemo =>
      'Bu tiplashtilgan marshut parametrlari namoyishidir.';
}
