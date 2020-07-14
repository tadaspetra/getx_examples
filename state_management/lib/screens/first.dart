import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reference/controllers/countController.dart';
import 'package:reference/controllers/userController.dart';
import 'package:reference/screens/second.dart';

class First extends StatelessWidget {
  final CountController countController = Get.put(CountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX | State Management"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CountController>(
              // You can initialize your controller here the first time. Don't use init in your other GetBuilders of same controller
              // GetX/Obx is reactive (streams) while GetBuilder only rebuilds on update()
              builder: (s) => Text(
                'Current Count Value: ${s.count}',
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GetX<UserController>(
              init:
                  UserController(), // can initialize inside GetX instead of .put
              builder: (_) => Text('Name: ${_.user.value.name}'),
            ),
            Obx(
              //Obx is very similar to GetX except 'lighter' so no parameters for init, dispose, etc
              () => Text(
                  'Stored Count: ${Get.find<UserController>().user.value.count}'),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text("Update Name & Stored Count"),
              onPressed: () {
                Get.find<UserController>().updateUser(Get.find<
                        CountController>()
                    .count); //using Get.find locates the controller that was created in 'init' in GetX
              },
            ),
            SizedBox(
              height: 100,
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
