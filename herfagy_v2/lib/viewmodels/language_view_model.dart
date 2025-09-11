import 'package:flutter/material.dart';

class LanguageViewModel extends ChangeNotifier {
  Locale _locale = const Locale('ar');

  Locale get locale => _locale;

  void changeLanguage(Locale newLocale) {
    _locale = newLocale;
    notifyListeners();
  }
}
