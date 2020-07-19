import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/utils/root.dart';

import 'controllers/bindings/authBinding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      home: Root(),
    );

    // return GetMaterialApp(
    //   home: GetBuilder<AuthController>(
    //     init: AuthController(),
    //     builder: (_) {
    //       return (_.user != null) ? Home() : Login();
    //     },
    //   ),
    //   getPages: ,
    // );

    // return GetMaterialApp(
    //   initialBinding: AuthBinding(),
    //   initialRoute: '/home',
    //   getPages: [
    //     GetPage(name: '/home', page: () => Home()),
    //     // GetPage with custom transitions and bindings
    //     GetPage(
    //       name: '/login',
    //       page: () => Login(),
    //     ),
    //   ],
    // );
  }
}
