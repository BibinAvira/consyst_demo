import 'package:firebase_core/firebase_core.dart';
import 'package:flashcurrent/firebase_options.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/routes/app_pages.dart';

void main() async{
     WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
//     var box = await Hive.openBox('flashcurrent_localdb');
// await box.clear();
 if(!(Hive.isBoxOpen('flashcurrent_localdb'))){
    final taskBox = await Hive.openBox('flashcurrent_localdb');
 }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: Routes.SPLASHSCREEN,
      getPages: AppPages.routes,
    ),
  );
}
