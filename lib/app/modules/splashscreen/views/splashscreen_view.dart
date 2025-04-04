import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              // color: Colors.cyan,
              child: Image.asset(
            "assets/images/Bolt.png",
            height: 70,
            width: 70,
          )),
          Container(
              // color: Colors.lime,
              child: RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: 'M', style: TextStyle(color: Colors.red)),
                TextSpan(text: 'y', style: TextStyle(color: Colors.orange)),
                TextSpan(
                    text: ' ', style: TextStyle(color: Colors.black)), // space
                TextSpan(text: 'N', style: TextStyle(color: Colors.yellow)),
                TextSpan(text: 'o', style: TextStyle(color: Colors.green)),
                TextSpan(text: 't', style: TextStyle(color: Colors.blue)),
                TextSpan(text: 'e', style: TextStyle(color: Colors.indigo)),
                TextSpan(text: 's', style: TextStyle(color: Colors.purple)),
              ],
            ),
          )),
        ],
      )),
    );
  }
}
