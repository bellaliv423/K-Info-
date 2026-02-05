import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleNotifier extends StateNotifier<Locale> {
  static const String _localeKey = 'app_locale';
  static const String defaultLocale = 'en';

  LocaleNotifier() : super(const Locale('en'));

  Future<void> setLocale(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();

    // Validate locale
    if (!['zh', 'zh_TW', 'en'].contains(languageCode)) {
      return;
    }

    // Update state
    if (languageCode == 'zh_TW') {
      state = const Locale('zh', 'TW');
    } else if (languageCode == 'zh') {
      state = const Locale('zh');
    } else {
      state = const Locale('en');
    }

    // Save to SharedPreferences
    await prefs.setString(_localeKey, languageCode);
  }

  Future<void> loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLocale = prefs.getString(_localeKey) ?? defaultLocale;

    if (savedLocale == 'zh_TW') {
      state = const Locale('zh', 'TW');
    } else if (savedLocale == 'zh') {
      state = const Locale('zh');
    } else {
      state = const Locale('en');
    }
  }

  String getCurrentLanguageCode() {
    if (state.countryCode == 'TW') {
      return 'zh_TW';
    }
    return state.languageCode;
  }
}

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier();
});
