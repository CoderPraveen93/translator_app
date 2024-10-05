import 'package:get/get.dart';
import 'package:translator_app/translator_screen/translator_screen.dart';

class SplaceScreenController extends GetxController {
  @override
  void onInit() {
    splaceScreen();
    super.onInit();
  }

  Future<void> splaceScreen() async {
    await Future.delayed(const Duration(seconds: 5), () {
      Get.offAll(const TranslatorScreen());
    });
  }
}
