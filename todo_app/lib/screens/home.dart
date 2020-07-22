import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:todo_app/controllers/authController.dart';

class Home extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Sign Out"),
          onPressed: () {
            controller.signOut();
          },
        ),
      ),
    );
  }
}
