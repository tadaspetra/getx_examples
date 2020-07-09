import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reference/controllers/userController.dart';

class Third extends GetView<UserController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.incrementList();
        },
      ),
      appBar: AppBar(
        title: Text("Third"),
      ),
      body: Center(
        child: Obx(
          () => ListView.builder(
            itemCount: controller.list.length,
            itemBuilder: (context, index) {
              return Text("${controller.list[index]}");
            },
          ),
        ),
      ),
    );
  }
}
