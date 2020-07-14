import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reference/screens/first.dart';

void main() {
  runApp(
    GetMaterialApp(
      //don't need 'Get' before Material App if you're only using State Management
      home: First(),
      theme: ThemeData(
        accentColor: Colors.purpleAccent,
        primaryColor: Colors.purple,
      ),
    ),
  );
}
