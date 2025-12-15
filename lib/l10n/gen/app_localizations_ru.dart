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
  String get authLoginTitle => 'Вход';

  @override
  String get authRegisterTitle => 'Регистрация';

  @override
  String get authEmailHint => 'Электронная почта';

  @override
  String get authPasswordHint => 'Пароль';

  @override
  String get authLoginButton => 'Войти';

  @override
  String get authRegisterButton => 'Зарегистрироваться';

  @override
  String get authForgotPassword => 'Забыли пароль?';

  @override
  String homeWelcomeMessage(String name) {
    return 'Привет, $name!';
  }

  @override
  String homeItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count элементов',
      many: '$count элементов',
      few: '$count элемента',
      one: '1 элемент',
      zero: 'Нет элементов',
    );
    return '$_temp0';
  }

  @override
  String homeUnreadMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count непрочитанных сообщений',
      many: '$count непрочитанных сообщений',
      few: '$count непрочитанных сообщения',
      one: '1 непрочитанное сообщение',
      zero: 'Нет новых сообщений',
    );
    return '$_temp0';
  }

  @override
  String commonGenderGreeting(String gender, String name) {
    String _temp0 = intl.Intl.selectLogic(gender, {
      'male': 'Г-н $name',
      'female': 'Г-жа $name',
      'other': '$name',
    });
    return '$_temp0';
  }

  @override
  String commonDateFormat(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Обновлено: $dateString';
  }

  @override
  String commonTimeAgo(String time, int count) {
    String _temp0 = intl.Intl.selectLogic(time, {
      'now': 'Только что',
      'minutes': '$count минут назад',
      'hours': '$count часов назад',
      'days': '$count дней назад',
      'other': '$time',
    });
    return '$_temp0';
  }

  @override
  String get counterLabel => 'Вы нажали кнопку столько раз:';

  @override
  String counterValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count раз',
      many: '$count раз',
      few: '$count раза',
      two: 'два раза',
      one: 'один раз',
      zero: 'ни разу',
    );
    return '$_temp0';
  }

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

  @override
  String get ok => 'ОК';

  @override
  String get save => 'Сохранить';

  @override
  String get delete => 'Удалить';

  @override
  String get edit => 'Редактировать';

  @override
  String get close => 'Закрыть';

  @override
  String get retry => 'Повторить';

  @override
  String get errorGeneric =>
      'Что-то пошло не так. Пожалуйста, попробуйте снова.';

  @override
  String get errorNetwork => 'Ошибка сети. Проверьте подключение.';

  @override
  String get errorNotFound => 'Запрашиваемый ресурс не найден.';

  @override
  String get loadingMessage => 'Загрузка...';

  @override
  String get emptyStateMessage => 'Нет данных';

  @override
  String get searchHint => 'Поиск...';

  @override
  String get noResults => 'Результатов не найдено';

  @override
  String get confirmDelete => 'Вы уверены, что хотите удалить это?';

  @override
  String get yes => 'Да';

  @override
  String get no => 'Нет';

  @override
  String get increment => 'Увеличить';

  @override
  String get noItemsTitle => 'Нет элементов';

  @override
  String get noItemsMessage => 'Нет элементов для отображения';
}
