import 'dart:ui';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/languages_model.dart';
import '../utils/app_constants.dart';

class LocalizationController extends GetxController implements GetxService{

  final SharedPreferences sharedPreferences;

  LocalizationController(
  {
    required this.sharedPreferences
}
      ){
    loadCurrentLanguage();
  }

  //default language set(ex: en)
  Locale _locale=Locale(AppConstants.languages[0].languageCode,
  AppConstants.languages[0].countryCode
  );
  Locale get locale=>_locale;
  int _selectedIndex=0;
  int get selectedIndex=>_selectedIndex;
  List<LanguageModel> _languages=[];
  List<LanguageModel> get languages=>_languages;

  void loadCurrentLanguage() async{
    //only gets called during installation or reboot
    //if it cant find any language code it sets the first one
    _locale=Locale(sharedPreferences.getString(AppConstants.LANGUAGE_CODE)??AppConstants.languages[0].languageCode,
    sharedPreferences.getString(AppConstants.COUNTRY_CODE)??AppConstants.languages[0].countryCode
    );

    for(int index=0;index<AppConstants.languages.length;index++){
      if(AppConstants.languages[index].languageCode==_locale.languageCode){
        _selectedIndex=index;
      }
    }
    _languages=[];
    _languages.addAll(AppConstants.languages);
    update();
  }
  void setLanguage(Locale locale){
    Get.updateLocale(locale);
    _locale=locale;
    saveLanguage(_locale);
  }
  void setSelectedIndex(int index){
    _selectedIndex=index;
    update();
  }
  void saveLanguage(Locale locale){
    sharedPreferences.setString(
      AppConstants.LANGUAGE_CODE,locale.languageCode
    );
    sharedPreferences.setString(AppConstants.COUNTRY_CODE,locale.countryCode!);
  }

}