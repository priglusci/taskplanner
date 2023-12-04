import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taskplanner/auth/auth_controller.dart';
import 'package:get/get.dart';
import 'package:taskplanner/auth/loginnya.dart';
import 'package:taskplanner/splashscreen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: splashScreen(),
        title: 'Task Planner'
    );
  }
}

