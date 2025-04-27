import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_text_provider.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('en');

  Locale get currentLocale => _currentLocale;

  void setLocale(BuildContext context, String languageCode) {
    _currentLocale = Locale(languageCode);
    // Update texts when language changes
    Provider.of<AppTextProvider>(context, listen: false).setLanguage(languageCode);
    notifyListeners();
  }
}
