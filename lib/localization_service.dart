import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationService extends Translations {
  static final langs = ['English', 'Hindi', 'Punjabi', 'Assamese', 'Telugu', 'Tamil', 'Bengali', 'Marathi', 'Kannada', 'Odia', 'Gujarati', 'Malayalam'];
  // Available languages
  static final locales = {
    'English': const Locale('en', 'US'),
    'Hindi': const Locale('hi', 'IN'),
    'Punjabi': const Locale('pa', 'IN'),
    'Assamese': const Locale('as', 'IN'),
    'Telugu': const Locale('te', 'IN'),
    'Tamil': const Locale('ta', 'IN'),
    'Bengali': const Locale('bn', 'IN'),
    'Marathi': const Locale('mr', 'IN'),
    'Kannada': const Locale('kn', 'IN'),
    'Odia': const Locale('or', 'IN'),
    'Gujarati': const Locale('gu', 'IN'),
    'Malayalam': const Locale('ml', 'IN'),
  };

  static const Locale fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {'en_US': {'hello': 'Hello', 'language': 'Language','home': 'Home','orders': 'Orders', 'sell': 'Sell', 'shopkeepers': 'Shopkeepers','categories': 'Categories','what_are_you_looking_for': 'What are you looking for?','books_recommended_for_you': 'Books recommended for you','trending_books': 'Trending Books','browse_categories': 'Browse categories','my_orders': 'My Orders','_shopkeepers': 'Shopkeepers','_sell': 'Sell','my_notifications': 'My Notifications','favourites': 'Favourites','my_store': 'My Store','fill_book_details': 'Fill Book Details'},
  'hi_IN': {'hello': 'नमस्ते', 'language': 'भाषा','home': 'होम', 'orders': 'ऑर्डर', 'sell': 'बेचना', 'shopkeepers': 'दुकानदार','categories': 'श्रेणियाँ','what_are_you_looking_for': 'आप क्या ढूंढ रहे हैं?','books_recommended_for_you': 'आपके लिए सुझाई गई पुस्तकें','trending_books': 'लोकप्रिय पुस्तकें','browse_categories': 'श्रेणियाँ देखें','my_orders': 'मेरे ऑर्डर','_shopkeepers': 'दुकानदार','_sell': 'बेचना','my_notifications': 'मेरी सूचनाएँ','favourites': 'पसंदीदा','my_store': 'मेरी दुकान','fill_book_details': 'किताब का विवरण भरें'},
  'pa_IN': {'hello': 'ਸਤ ਸ੍ਰੀ ਅਕਾਲ', 'language': 'ਭਾਸ਼ਾ'},
  // Add translations for other languages
  };

  static Future<Map<String, String>> loadJson(String path) async {
    String jsonString = await rootBundle.loadString(path);
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    return jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  static Future<void> updateLocale(String language) async {
    Locale? locale = locales[language];
    if (locale != null) {
      Get.updateLocale(locale); // ✅ Change app locale
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('selectedLanguage', language);
      print('Changing locale to: $locale');

    }
  }

  static Future<Locale> getSavedLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLanguage = prefs.getString('selectedLanguage') ?? 'English';
    return locales[savedLanguage] ?? const Locale('en', 'US');
  }
}