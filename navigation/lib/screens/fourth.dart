import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Fourth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fourth Screen"),
      ),
      body: Center(
        child: (Get.arguments != null)
            ? Text(Get.arguments)
            : Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text("Return Text 'hello'"),
                    onPressed: () {
                      Get.back(result: "hello");
                    },
                  ),
                  RaisedButton(
                    child: Text("Return Text 'world'"),
                    onPressed: () {
                      Get.back(result: "world");
                    },
                  )
                ],
              ),
      ),
    );
  }
}
