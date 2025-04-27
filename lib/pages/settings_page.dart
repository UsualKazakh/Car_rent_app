import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../providers/language_provider.dart';
import 'package:provider/provider.dart';
import '../providers/app_text_provider.dart';

class SettingsPage extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const SettingsPage({
    Key? key,
    required this.isDarkMode,
    required this.onThemeChanged,
  }) : super(key: key);

  String _getLanguageName(String code) {
    switch (code) {
      case 'en':
        return 'English';
      case 'ru':
        return 'Русский';
      case 'kk':
        return 'Қазақша';
      default:
        return code;
    }
  }

  @override
  Widget build(BuildContext context) {
    final texts = context.watch<AppTextProvider>().texts;
    return Scaffold(
      appBar: AppBar(
        title: Text(texts.settings),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text(texts.darkTheme),
            value: isDarkMode,
            onChanged: onThemeChanged,
            secondary: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
          ),
          const Divider(),
          ListTile(
            title: Text(texts.language),
            subtitle: Text(_getLanguageName(context.watch<LanguageProvider>().currentLocale.languageCode)),
          ),
          RadioListTile<String>(
            title: const Text('English'),
            value: 'en',
            groupValue: context.watch<LanguageProvider>().currentLocale.languageCode,
            onChanged: (value) => context.read<LanguageProvider>().setLocale(context, value!),
          ),
          RadioListTile<String>(
            title: const Text('Русский'),
            value: 'ru',
            groupValue: context.watch<LanguageProvider>().currentLocale.languageCode,
            onChanged: (value) => context.read<LanguageProvider>().setLocale(context, value!),
          ),
          RadioListTile<String>(
            title: const Text('Қазақша'),
            value: 'kk',
            groupValue: context.watch<LanguageProvider>().currentLocale.languageCode,
            onChanged: (value) => context.read<LanguageProvider>().setLocale(context, value!),
          ),
        ],
      ),
    );
  }
}
