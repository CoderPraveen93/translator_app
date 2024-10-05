import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator_app/translator_screen/translator_screen_controller.dart';

class TranslatorScreen extends StatelessWidget {
  const TranslatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TranslatorScreenController translatorScreenController =
        Get.put(TranslatorScreenController());
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text(
            "Translator App",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 16, right: 16),
            child: Column(
              children: [
                TextField(
                  controller:
                      translatorScreenController.textEditingController.value,
                  maxLines: 10,
                  decoration: const InputDecoration(
                      hintText: "write something here....",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      translatorScreenController.input.value =
                          translatorScreenController
                              .textEditingController.value.text
                              .toString();
                      translatorScreenController.changeLanguage();
                      translatorScreenController.textEditingController.value
                          .clear();
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    },
                    child: const Text("change into Hindi")),
                const SizedBox(
                  height: 30,
                ),
                Obx(
                  () => Text(translatorScreenController.finalResult.value),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
