import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/language_controller.dart';
import '../models/languages_model.dart';
import 'app_constants.dart';

Future<Map<String, Map<String, String>>> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));
  //retrieving localized data
  Map<String, Map<String, String>> _languages = Map();
  for (LanguageModel languagesModel in AppConstants.languages) {
    String jsonStringValues =  await rootBundle.loadString('assets/languages/${languagesModel.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    Map<String, String> _json = Map();
    mappedJson.forEach((key, value) {
      _json[key] = value.toString();
    });
    _languages["${languagesModel.languageCode}_${languagesModel.countryCode}"] =
        _json;
  }
  return _languages;
}
