import 'package:flashcurrent/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController

  @override
  void onInit() {
    Check_authentication_and_navigate();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void Check_authentication_and_navigate() async {
    await Future.delayed(
      Duration(seconds: 8),
      () {
        Get.offAndToNamed(Routes.AUTHENTICATION);
      },
    );
  }
}
