import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flashcurrent/app/routes/app_pages.dart';
import 'package:flashcurrent/Constants.dart';
import 'package:flashcurrent/enumConstants.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var isLoading = false.obs;
  var userEmail = ''.obs;
  var userName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  void loadUserData() async {
    isLoading.value = true;
    try {
      // Get current user from Firebase
      User? currentUser = _auth.currentUser;

      if (currentUser != null) {
        userEmail.value = currentUser.email ?? 'No email found';

        // Get username from Hive if available
        final hiveBox = await Hive.box('flashcurrent_localdb');
        var authData = hiveBox.get('authentication');

        if (authData != null && authData['username'] != null) {
          userName.value = authData['username'];
        } else {
          userName.value = 'User';
        }
      }
    } catch (e) {
      Constants.Awsome_SnackBar(
          elevation: 10,
          title: "Error",
          message: "Failed to load user data: ${e.toString()}",
          snackbar_type: Awsome_snackbar_contentype.failure.name);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    isLoading.value = true;
    try {
      await _auth.signOut();
      Get.offAllNamed(Routes.AUTHENTICATION); // Navigate back to login screen
      Constants.Awsome_SnackBar(
          elevation: 10,
          title: "Success",
          message: "Successfully logged out",
          snackbar_type: Awsome_snackbar_contentype.success.name);
    } catch (e) {
      Constants.Awsome_SnackBar(
          elevation: 10,
          title: "Error",
          message: "Failed to sign out: ${e.toString()}",
          snackbar_type: Awsome_snackbar_contentype.failure.name);
    } finally {
      isLoading.value = false;
    }
  }
}
