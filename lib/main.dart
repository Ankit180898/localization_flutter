import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utils/dep.dart' as dep;
import 'controller/language_controller.dart';
import 'utils/app_constants.dart';
import 'utils/app_routes.dart';
import 'utils/messages.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
   Map<String,Map<String,String>> languagess=await dep.init();
  runApp( MyApp(languages: languagess,));
}

class MyApp extends StatelessWidget {
   MyApp({required this.languages});
  final Map<String,Map<String,String>> languages;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
      builder: (localizationController)
    {
      return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        locale:localizationController.locale,
        translations: Messages(languages: languages),
        fallbackLocale: Locale(AppConstants.languages[0].languageCode,
        AppConstants.languages[0].countryCode
        ),
        initialRoute: RouteHelper.getSplashRoute(),
        getPages: RouteHelper.routes,
      );
    }
    );
  }
}


