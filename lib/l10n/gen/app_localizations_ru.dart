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

  @override
  String get inputPasswordLabel => 'Пароль';

  @override
  String get inputShowPassword => 'Показать пароль';

  @override
  String get inputHidePassword => 'Скрыть пароль';

  @override
  String get inputSearchHint => 'Поиск...';

  @override
  String get inputClear => 'Очистить';

  @override
  String get inputPhoneLabel => 'Номер телефона';

  @override
  String get inputEmailLabel => 'Электронная почта';

  @override
  String get inputEmailHint => 'example@email.com';

  @override
  String get inputEmailRequired => 'Электронная почта обязательна';

  @override
  String get inputEmailInvalid => 'Введите корректный email';

  @override
  String get buttonLoading => 'Загрузка...';

  @override
  String get actionSubmit => 'Отправить';

  @override
  String get actionContinue => 'Продолжить';

  @override
  String get actionBack => 'Назад';

  @override
  String get actionNext => 'Далее';

  @override
  String get actionDone => 'Готово';

  @override
  String get actionConfirm => 'Подтвердить';

  @override
  String get actionApply => 'Применить';

  @override
  String get actionReset => 'Сбросить';

  @override
  String get actionRefresh => 'Обновить';

  @override
  String get actionShare => 'Поделиться';

  @override
  String get actionCopy => 'Копировать';

  @override
  String get actionPaste => 'Вставить';

  @override
  String get sectionGeneral => 'Общие';

  @override
  String get sectionAccount => 'Аккаунт';

  @override
  String get sectionPrivacy => 'Конфиденциальность';

  @override
  String get sectionNotifications => 'Уведомления';

  @override
  String get sectionHelp => 'Помощь и поддержка';

  @override
  String get statusOnline => 'В сети';

  @override
  String get statusOffline => 'Не в сети';

  @override
  String get statusConnecting => 'Подключение...';

  @override
  String get statusSyncing => 'Синхронизация...';

  @override
  String get homeSubtitle => 'Шаблон Flutter с дизайн-токенами';

  @override
  String get homeCounterHint => 'Нажмите кнопку для увеличения';

  @override
  String get quickActionsTitle => 'Быстрые действия';

  @override
  String get widgetDemosTitle => 'Демо виджетов';

  @override
  String get loadingData => 'Загрузка данных...';

  @override
  String get somethingWentWrong => 'Что-то пошло не так!';

  @override
  String get selectStateToPreview => 'Выберите состояние для просмотра';

  @override
  String get skeletonLoadingTitle => 'Скелетная загрузка';

  @override
  String get preferencesSection => 'Настройки';

  @override
  String get notifications => 'Уведомления';

  @override
  String get notificationsSubtitle => 'Получать push-уведомления';

  @override
  String get analytics => 'Аналитика';

  @override
  String get analyticsSubtitle => 'Помогите улучшить приложение';

  @override
  String get openSourceLicenses => 'Лицензии открытого кода';

  @override
  String get privacyPolicy => 'Политика конфиденциальности';

  @override
  String get termsOfService => 'Условия использования';

  @override
  String get madeWithFlutter => 'Сделано с ❤️ на Flutter';

  @override
  String versionInfo(String version, String build) {
    return '$version (Сборка $build)';
  }

  @override
  String get themeModeSystemSubtitle => 'Следовать настройкам устройства';

  @override
  String get themeModeLightSubtitle => 'Всегда использовать светлую тему';

  @override
  String get themeModeDarkSubtitle => 'Всегда использовать тёмную тему';

  @override
  String get systemLanguage => 'Системный';

  @override
  String get useDeviceLanguage => 'Использовать язык устройства';

  @override
  String get networkErrorTimeout =>
      'Время ожидания истекло. Попробуйте ещё раз.';

  @override
  String get networkErrorNoConnection =>
      'Нет подключения к интернету. Проверьте сеть.';

  @override
  String get networkErrorServer => 'Ошибка сервера. Попробуйте позже.';

  @override
  String get networkErrorSessionExpired => 'Сессия истекла. Войдите снова.';

  @override
  String get networkErrorAccessDenied => 'У вас нет доступа к этому ресурсу.';

  @override
  String get networkErrorNotFound => 'Запрашиваемый ресурс не найден.';

  @override
  String networkErrorResourceNotFound(String resource) {
    return '$resource не найден.';
  }

  @override
  String get networkErrorRateLimit =>
      'Слишком много запросов. Подождите и попробуйте снова.';

  @override
  String get networkErrorCancelled => 'Запрос отменён.';

  @override
  String get networkErrorUnknown => 'Произошла непредвиденная ошибка.';

  @override
  String get networkErrorInvalidCertificate =>
      'Недействительный SSL-сертификат.';

  @override
  String get networkErrorInvalidRequest => 'Неверный запрос.';

  @override
  String get networkErrorAuthRequired => 'Требуется авторизация.';

  @override
  String get networkErrorValidationFailed => 'Ошибка валидации.';

  @override
  String networkRetrying(int attempt, int maxAttempts) {
    return 'Повторная попытка... ($attempt/$maxAttempts)';
  }

  @override
  String get skip => 'Пропустить';

  @override
  String get next => 'Далее';

  @override
  String get back => 'Назад';

  @override
  String get getStarted => 'Начать';

  @override
  String get loginTitle => 'С возвращением';

  @override
  String get loginSubtitle => 'Войдите, чтобы продолжить';

  @override
  String get registerTitle => 'Создать аккаунт';

  @override
  String get registerSubtitle => 'Зарегистрируйтесь, чтобы начать';

  @override
  String get email => 'Электронная почта';

  @override
  String get password => 'Пароль';

  @override
  String get name => 'Имя';

  @override
  String get confirmPassword => 'Подтвердите пароль';

  @override
  String get login => 'Войти';

  @override
  String get register => 'Зарегистрироваться';

  @override
  String get forgotPassword => 'Забыли пароль?';

  @override
  String get noAccount => 'Нет аккаунта?';

  @override
  String get alreadyHaveAccount => 'Уже есть аккаунт?';

  @override
  String get emailRequired => 'Введите электронную почту';

  @override
  String get emailInvalid => 'Введите корректный адрес электронной почты';

  @override
  String get passwordRequired => 'Введите пароль';

  @override
  String get passwordTooShort => 'Пароль должен содержать минимум 6 символов';

  @override
  String get nameRequired => 'Введите имя';

  @override
  String get confirmPasswordRequired => 'Подтвердите пароль';

  @override
  String get passwordsDoNotMatch => 'Пароли не совпадают';

  @override
  String get forgotPasswordTitle => 'Сброс пароля';

  @override
  String get forgotPasswordSubtitle =>
      'Введите вашу почту, и мы отправим ссылку для сброса';

  @override
  String get sendResetLink => 'Отправить ссылку';

  @override
  String get backToLogin => 'Вернуться к входу';

  @override
  String get viewOnboarding => 'Посмотреть введение';

  @override
  String get checkYourEmail => 'Проверьте почту';

  @override
  String resetLinkSent(String email) {
    return 'Мы отправили ссылку для сброса пароля на $email';
  }

  @override
  String get didNotReceiveEmail => 'Не получили письмо?';

  @override
  String get profileTitle => 'Профиль';

  @override
  String get editProfile => 'Редактировать профиль';

  @override
  String get anonymous => 'Аноним';

  @override
  String get followers => 'Подписчики';

  @override
  String get following => 'Подписки';

  @override
  String get posts => 'Публикации';

  @override
  String get logout => 'Выйти';

  @override
  String get logoutConfirmTitle => 'Выйти?';

  @override
  String get logoutConfirmMessage => 'Вы уверены, что хотите выйти?';

  @override
  String get accountSettings => 'Настройки аккаунта';

  @override
  String get privacy => 'Конфиденциальность';

  @override
  String get errorScreenTitle => 'Ошибка';

  @override
  String get pageNotFound => 'Страница не найдена';

  @override
  String pageNotFoundMessage(String location) {
    return 'Страница по адресу \"$location\" не найдена.';
  }

  @override
  String get goHome => 'На главную';

  @override
  String userDetailTitle(int userId) {
    return 'Пользователь #$userId';
  }

  @override
  String get userDetail => 'Информация о пользователе';

  @override
  String viewingUserWithId(int userId) {
    return 'Просмотр пользователя с ID: $userId';
  }

  @override
  String itemDetailTitle(int itemId) {
    return 'Элемент #$itemId';
  }

  @override
  String get itemDetail => 'Информация об элементе';

  @override
  String viewingItemWithId(int itemId) {
    return 'Просмотр элемента с ID: $itemId';
  }

  @override
  String get typedRouteParamsDemo =>
      'Это демонстрация типизированных параметров маршрута.';
}
