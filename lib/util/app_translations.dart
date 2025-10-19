import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        // KHMER TRANSLATIONS
        'km_KH': {
          'choose_language': 'ជ្រើសរើសភាសា',
          'lang_khmer': 'ខ្មែរ',
          'lang_english': 'អង់គ្លេស',
          'button_continue': 'យល់ព្រម',
          'home_title': 'ទំព័រដើម'
        },
        // ENGLISH TRANSLATIONS
        'en_US': {
          'choose_language': 'Choose Language',
          'lang_khmer': 'Khmer',
          'lang_english': 'English',
          'button_continue': 'Continue',
          'home_title': 'Home Page'
        }
      };
}
