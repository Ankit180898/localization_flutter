import 'package:flutter/material.dart';
import 'package:mvvm_flutter/controller/language_controller.dart';
import 'package:mvvm_flutter/utils/app_constants.dart';
import 'models/languages_model.dart';

class LanguageWidget extends StatelessWidget {
  final LanguageModel languageModel;
  final LocalizationController localizationController;
  final int index;
  LanguageWidget(
      {required this.languageModel,
      required this.localizationController,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        localizationController.setLanguage(Locale(
          AppConstants.languages[index].languageCode,AppConstants.languages[index].countryCode,
        ));
        localizationController.setSelectedIndex(index);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[200]!, blurRadius: 5, spreadRadius: 1),
            ]),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    languageModel.languageName,
                  ),
                ],
              ),
            ),
            localizationController.selectedIndex == index
                ? Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: 40,
                    child: Icon(
                      Icons.check_circle,
                      color: Theme.of(context).primaryColor,
                      size: 30,
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
