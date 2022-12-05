import '../models/languages_model.dart';

class AppConstants {
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';

  static List<LanguageModel> languages = [
    LanguageModel(
        imgUrl: "en.png",
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        imgUrl: "hi.png",
        languageName: 'Hindi',
        countryCode: 'IN',
        languageCode: 'hi'),
  ];
}
