import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:todo_app/controllers/authController.dart';
import 'package:todo_app/controllers/userController.dart';
import 'package:todo_app/services/database.dart';

class Home extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            GetX<UserController>(
              initState: (_) async {
                Get.find<UserController>().user = await Database()
                    .getUser(Get.find<AuthController>().user.uid);
              },
              builder: (_) {
                if (_.user.name != null) {
                  return Text(_.user.name);
                } else {
                  return Text("loading...");
                }
              },
            ),
            RaisedButton(
              child: Text("Sign Out"),
              onPressed: () {
                controller.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
