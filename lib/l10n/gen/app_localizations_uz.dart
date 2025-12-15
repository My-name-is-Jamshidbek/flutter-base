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
}
