import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flashcurrent/enumConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Constants {
  static String newsapi_apikey = "5ad1fb71035c4d44bd2f247c0074bbb7";
  static Awsome_SnackBar(
      {required double elevation,
      required String title,
      required String message,
      required String snackbar_type}) {
    var _type_content = snackbar_type == Awsome_snackbar_contentype.failure.name
        ? ContentType.failure
        : snackbar_type == Awsome_snackbar_contentype.help.name
            ? ContentType.help
            : snackbar_type == Awsome_snackbar_contentype.success.name
                ? ContentType.success
                : ContentType.warning;
    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: elevation,
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: _type_content,
      ),
    );
    ScaffoldMessenger.of(Get.context!)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static Page_navigation({required int index}) {
    print(index);
    switch (index) {
      case 0:
        print('home_dashboard');
        // Get.offAndToNamed(Routes.DASHBOARD_HOME);
        break;
      case 2:
        print('chatai');
        //  Get.offAndToNamed(Routes.CHATAI);
        break;
      default:
        break;
    }
  }

  static Bottom_Navigation({required int initialindex}) {
    return CurvedNavigationBar(
      items: <Widget>[
        Icon(Icons.home),
        Icon(Icons.list),
        Icon(Icons.chat),
        Icon(Icons.person),
      ],
      index: initialindex,
      onTap: (value) {
        Page_navigation(index: value);
      },
      color: Colors.red,
      buttonBackgroundColor: Colors.red,
      backgroundColor: Colors.white,
      // animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 300),
    );
  }
}
