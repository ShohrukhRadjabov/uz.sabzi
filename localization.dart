import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocale {
  static const uzLatin = Locale('uz', 'Latn');
  static const uzCyrillic = Locale('uz', 'Cyrl');
  static const russian = Locale('ru');
  
  static const supportedLocales = [
    uzLatin,
    uzCyrillic,
    russian,
  ];
}

class AppLocaleProvider extends ChangeNotifier {
  Locale _locale = AppLocale.uzLatin;
  
  Locale get locale => _locale;
  
  AppLocaleProvider() {
    _loadSavedLocale();
  }
  
  Future<void> _loadSavedLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final languageCode = prefs.getString('languageCode');
      final countryCode = prefs.getString('countryCode');
      
      if (languageCode != null) {
        _locale = Locale(languageCode, countryCode);
        notifyListeners();
      }
    } catch (e) {
      // Fallback to default locale
    }
  }
  
  Future<void> setLocale(Locale locale) async {
    if (!AppLocale.supportedLocales.contains(locale)) return;
    
    _locale = locale;
    
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('languageCode', locale.languageCode);
      if (locale.countryCode != null) {
        await prefs.setString('countryCode', locale.countryCode!);
      } else {
        await prefs.remove('countryCode');
      }
    } catch (e) {
      // Handle error
    }
    
    notifyListeners();
  }
}

class AppLocalizations {
  final Locale locale;
  
  AppLocalizations(this.locale);
  
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }
  
  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();
  
  static final Map<String, Map<String, String>> _localizedValues = {
    'uz_Latn': {
      'app_name': 'Sabzi',
      'app_description': 'Mahalliy bozor',
      'select_language': 'Tilni tanlang',
      'continue': 'Davom etish',
      'phone_auth': 'Telefon raqam bilan kirish',
      'enter_phone': 'Telefon raqamingizni kiriting',
      'or': 'yoki',
      'google_signin': 'Google orqali kirish',
      'oneid_signin': 'OneID orqali kirish',
      'mobileid_signin': 'Mobile-ID orqali kirish',
      'verification_code': 'Tasdiqlash kodi',
      'enter_verification_code': 'Telefoningizga yuborilgan kodni kiriting',
      'verify': 'Tasdiqlash',
      'resend_code': 'Kodni qayta yuborish',
      'home': 'Bosh sahifa',
      'nearby': 'Yaqin atrofda',
      'add': 'Qo\'shish',
      'chat': 'Xabarlar',
      'profile': 'Profil',
      'all_categories': 'Barcha toifalar',
      'electronics': 'Elektronika',
      'clothing': 'Kiyim-kechak',
      'furniture': 'Mebel',
      'transport': 'Transport',
      'real_estate': 'Ko\'chmas mulk',
      'currency': 'so\'m',
      'distance': 'km',
      'time_ago_minute': 'daqiqa oldin',
      'time_ago_hour': 'soat oldin',
      'time_ago_day': 'kun oldin',
      'new_listing': 'Yangi e\'lon',
      'type_message': 'Xabar yozing...',
      'my_profile': 'Mening profilim',
      'my_listings': 'Mening e\'lonlarim',
      'sold_items': 'Sotilgan narsalar',
      'favorites': 'Sevimlilar',
      'settings': 'Sozlamalar',
      'help': 'Yordam',
      'ratings': 'baho',
      'description': 'Tavsif',
      'seller': 'Sotuvchi',
      'other_listings': 'Boshqa e\'lonlar',
      'start_chat': 'Xabar yozish',
    },
    'uz_Cyrl': {
      'app_name': 'Сабзи',
      'app_description': 'Маҳаллий бозор',
      'select_language': 'Тилни танланг',
      'continue': 'Давом этиш',
      'phone_auth': 'Телефон рақам билан кириш',
      'enter_phone': 'Телефон рақамингизни киритинг',
      'or': 'ёки',
      'google_signin': 'Google орқали кириш',
      'oneid_signin': 'OneID орқали кириш',
      'mobileid_signin': 'Mobile-ID орқали кириш',
      'verification_code': 'Тасдиқлаш коди',
      'enter_verification_code': 'Телефонингизга юборилган кодни киритинг',
      'verify': 'Тасдиқлаш',
      'resend_code': 'Кодни қайта юбориш',
      'home': 'Бош саҳифа',
      'nearby': 'Яқин атрофда',
      'add': 'Қўшиш',
      'chat': 'Хабарлар',
      'profile': 'Профил',
      'all_categories': 'Барча тоифалар',
      'electronics': 'Электроника',
      'clothing': 'Кийим-кечак',
      'furniture': 'Мебел',
      'transport': 'Транспорт',
      'real_estate': 'Кўчмас мулк',
      'currency': 'сўм',
      'distance': 'км',
      'time_ago_minute': 'дақиқа олдин',
      'time_ago_hour': 'соат олдин',
      'time_ago_day': 'кун олдин',
      'new_listing': 'Янги эълон',
      'type_message': 'Хабар ёзинг...',
      'my_profile': 'Менинг профилим',
      'my_listings': 'Менинг эълонларим',
      'sold_items': 'Сотилган нарсалар',
      'favorites': 'Севимлилар',
      'settings': 'Созламалар',
      'help': 'Ёрдам',
      'ratings': 'баҳо',
      'description': 'Тавсиф',
      'seller': 'Сотувчи',
      'other_listings': 'Бошқа эълонлар',
      'start_chat': 'Хабар ёзиш',
    },
    'ru': {
      'app_name': 'Сабзи',
      'app_description': 'Локальный рынок',
      'select_language': 'Выберите язык',
      'continue': 'Продолжить',
      'phone_auth': 'Вход по номеру телефона',
      'enter_phone': 'Введите номер телефона',
      'or': 'или',
      'google_signin': 'Войти через Google',
      'oneid_signin': 'Войти через OneID',
      'mobileid_signin': 'Войти через Mobile-ID',
      'verification_code': 'Код подтверждения',
      'enter_verification_code': 'Введите код, отправленный на ваш телефон',
      'verify': 'Подтвердить',
      'resend_code': 'Отправить код повторно',
      'home': 'Главная',
      'nearby': 'Поблизости',
      'add': 'Добавить',
      'chat': 'Сообщения',
      'profile': 'Профиль',
      'all_categories': 'Все категории',
      'electronics': 'Электроника',
      'clothing': 'Одежда',
      'furniture': 'Мебель',
      'transport': 'Транспорт',
      'real_estate': 'Недвижимость',
      'currency': 'сум',
      'distance': 'км',
      'time_ago_minute': 'минут назад',
      'time_ago_hour': 'часов назад',
      'time_ago_day': 'дней назад',
      'new_listing': 'Новое объявление',
      'type_message': 'Напишите сообщение...',
      'my_profile': 'Мой профиль',
      'my_listings': 'Мои объявления',
      'sold_items': 'Проданные товары',
      'favorites': 'Избранное',
      'settings': 'Настройки',
      'help': 'Помощь',
      'ratings': 'оценок',
      'description': 'Описание',
      'seller': 'Продавец',
      'other_listings': 'Другие объявления',
      'start_chat': 'Написать сообщение',
    },
  };
  
  String get(String key) {
    String localeKey;
    
    if (locale.languageCode == 'uz') {
      if (locale.countryCode == 'Latn') {
        localeKey = 'uz_Latn';
      } else {
        localeKey = 'uz_Cyrl';
      }
    } else {
      localeKey = 'ru';
    }
    
    return _localizedValues[localeKey]?[key] ?? key;
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();
  
  @override
  bool isSupported(Locale locale) {
    return ['uz', 'ru'].contains(locale.languageCode);
  }
  
  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }
  
  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
