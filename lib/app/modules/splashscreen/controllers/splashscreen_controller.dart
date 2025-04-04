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
    final hive_taskdata = Hive.box('flashcurrent_localdb');
    await Future.delayed(
      Duration(seconds: 8),
      () {
        try {
          if (hive_taskdata.get('authentication') == null) {
            Get.offAndToNamed(Routes.AUTHENTICATION);
          } else {
            Get.offAndToNamed(Routes.NOTES);
          }
        } catch (e) {
          Get.offAndToNamed(Routes.AUTHENTICATION);
        }
      },
    );
  }
}
