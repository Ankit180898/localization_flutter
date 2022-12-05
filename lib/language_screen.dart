import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_flutter/controller/language_controller.dart';

import 'language_widget.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GetBuilder<LocalizationController>(builder: (controller){
          return Column(
            children: [
              Expanded(
                child: Center(
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(5.0),
                      child: Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Icon(
                                  Icons.ac_unit,
                                  size: 120,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Center(
                                child: Icon(
                                  Icons.abc,
                                  size: 140,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 10),
                                child: Text("select_language".tr),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GridView.builder(
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 1),
                                itemBuilder: (context, index) => LanguageWidget(languageModel: controller.languages[index], localizationController: controller, index: index,),
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 2,
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],);
        },)

      ),
    );
  }
}


