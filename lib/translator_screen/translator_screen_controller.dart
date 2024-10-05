import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

class TranslatorScreenController extends GetxController {
  Rx<TextEditingController> textEditingController = TextEditingController().obs;
  RxString input = "".obs;
  final translator = GoogleTranslator();
  RxString finalResult="".obs;
//   final input = "my name is Praveen and";

//   // Using the Future API

  void changeLanguage() {
    translator.translate(input.value, to: 'hi').then((result)=>finalResult.value=result.toString() );
  }
}
