// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Шаблон приложения';

  @override
  String get homeTitle => 'Главная';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get welcomeMessage => 'Добро пожаловать в шаблон приложения!';

  @override
  String get counterLabel => 'Вы нажали кнопку столько раз:';

  @override
  String get appearanceSection => 'Внешний вид';

  @override
  String get darkMode => 'Тёмный режим';

  @override
  String get darkModeSubtitle => 'Использовать тёмную тему';

  @override
  String get language => 'Язык';

  @override
  String get selectLanguage => 'Выберите язык';

  @override
  String get aboutSection => 'О приложении';

  @override
  String get version => 'Версия';

  @override
  String get licenses => 'Лицензии';

  @override
  String get themeMode => 'Режим темы';

  @override
  String get themeModeSystem => 'Системный';

  @override
  String get themeModeLight => 'Светлый';

  @override
  String get themeModeDark => 'Тёмный';

  @override
  String get cancel => 'Отмена';
}
