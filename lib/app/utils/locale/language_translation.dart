import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LanguageTranslation {
  LanguageTranslation(this.locale) {
    _localizedValues = {};
  }

  late Locale locale;
  static Map<dynamic, dynamic> _localizedValues = {};

  static LanguageTranslation? of(BuildContext context) {
    return Localizations.of<LanguageTranslation>(context, LanguageTranslation);
  }

  String value(String key) {
    return _localizedValues[key] ?? '** $key not found';
  }

  static Future<LanguageTranslation> load(Locale locale) async {
    final LanguageTranslation translations = LanguageTranslation(locale);
    final String jsonContent = await rootBundle.loadString(
      'assets/locale/${locale.languageCode}.json',
    );

    log(translations.currentLanguage);
    _localizedValues = json.decode(jsonContent);

    return translations;
  }

  String get currentLanguage => locale.languageCode;
}
