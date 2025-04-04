import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcurrent/Constants.dart';
import 'package:flashcurrent/app/routes/app_pages.dart';
import 'package:flashcurrent/enumConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthenticationController extends GetxController {
  //TODO: Implement AuthenticationController

  late TextEditingController txt_username_controller;
  late TextEditingController txt_email_controller;
  late TextEditingController txt_forgotemail_controller;
  late TextEditingController txt_password_controller;
  late TextEditingController txt_password_repeat_controller;
  var is_visiblepassword = false.obs;
  var is_visiblepassword1 = false.obs;
  var is_login = true.obs;
  var is_forgetpassword = false.obs;
  final formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    Initialize_texfields();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    txt_email_controller.dispose();
    txt_username_controller.dispose();
    txt_forgotemail_controller.dispose();
    txt_password_controller.dispose();
    txt_password_repeat_controller.dispose();
    super.onClose();
  }

  SignIn_User() async {
    try {
      final hive_taskdata = await Hive.box('flashcurrent_localdb');
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: txt_email_controller.text,
          password: txt_password_controller.text);

      if (txt_email_controller.text == credential.user!.email) {
        try {
          if (hive_taskdata.get('authentication') == null) {
            hive_taskdata.put('authentication', {
              "email": txt_email_controller.text,
              "password": txt_password_controller.text
            });
          }
        } catch (e) {
          print(e);
        }

        Get.offAndToNamed(Routes.NOTES);
      } else {
        is_login.value = false;
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      if (e.code == 'invalid-email') {
        Constants.Awsome_SnackBar(
            elevation: 10,
            title: "OOPS!",
            message: "No user found for that email.",
            snackbar_type: Awsome_snackbar_contentype.failure.name);
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Constants.Awsome_SnackBar(
            elevation: 10,
            title: "OOPS!",
            message: "Wrong password provided for that user.",
            snackbar_type: Awsome_snackbar_contentype.failure.name);
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> User_Auth_Signup() async {
    try {
      final hive_taskdata = await Hive.box('flashcurrent_localdb');
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: txt_email_controller.text,
        password: txt_password_controller.text,
      );
      print(credential);
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          print('User is currently signed out!');
          Constants.Awsome_SnackBar(
              elevation: 10,
              title: "OOPS!",
              message: "User is currently signed out!.",
              snackbar_type: Awsome_snackbar_contentype.failure.name);
        } else {
          hive_taskdata.put('authentication', {
            "username": txt_username_controller.text,
            "email": txt_email_controller.text,
            "password": txt_password_controller.text
          });
          Get.offAndToNamed(Routes.NOTES);
        }
      });
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Constants.Awsome_SnackBar(
            elevation: 10,
            title: "OOPS!",
            message: "The password provided is too weak.",
            snackbar_type: Awsome_snackbar_contentype.failure.name);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Constants.Awsome_SnackBar(
            elevation: 10,
            title: "OOPS!",
            message: "The account already exists for that email.",
            snackbar_type: Awsome_snackbar_contentype.failure.name);
      }
    } catch (e) {
      print(e);
    }
  }

  void Check_User_Validate() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      is_login.value == true ? SignIn_User() : User_Auth_Signup();
    }
  }

  Future Password_reset() async {
    if (formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(
            email: txt_forgotemail_controller.text.trim());
        Constants.Awsome_SnackBar(
            elevation: 10,
            title: "Info",
            message: "Password reset link is send!",
            snackbar_type: Awsome_snackbar_contentype.success.name);
      } on FirebaseAuthException catch (e) {
        Constants.Awsome_SnackBar(
            elevation: 2,
            title: "",
            message: e.toString(),
            snackbar_type: Awsome_snackbar_contentype.failure.name);
        is_login.value = true;
      }
    }
  }

  void Initialize_texfields() {
    txt_email_controller = TextEditingController();
    txt_username_controller = TextEditingController();
    txt_forgotemail_controller = TextEditingController();
    txt_password_controller = TextEditingController();
    txt_password_repeat_controller = TextEditingController();
  }
}
