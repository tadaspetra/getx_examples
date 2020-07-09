import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reference/controllers/countController.dart';
import 'package:reference/controllers/userController.dart';
import 'package:reference/screens/second.dart';

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get State Management"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<UserController>(
              init: UserController(),
              builder: (_) => Text('Name: ${_.user.value.name}'),
            ),
            Obx(
              () => Text('Age: ${Get.find<UserController>().user.value.age}'),
            ),
            RaisedButton(
              child: Text("Update name"),
              onPressed: () {
                Get.find<UserController>().updateUser();
              },
            ),
            SizedBox(
              height: 100,
            ),
            GetBuilder<CountController>(
              init: CountController(),
              // You can initialize your controller here the first time. Don't use init in your other GetBuilders of same controller
              builder: (s) => Text(
                'clicks: ${s.count}',
              ),
            ),
            RaisedButton(
              child: Text('Next Screen'),
              onPressed: () {
                Get.to(Second());
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.find<CountController>().increment();
          }),
    );
  }
}
