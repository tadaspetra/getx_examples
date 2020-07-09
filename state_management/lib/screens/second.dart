import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reference/controllers/sumController.dart';
import 'package:reference/screens/third.dart';

class Second extends StatelessWidget {
  final SumController sumController = Get.put(SumController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<SumController>(
              //You can use bindings instead of init. Bindings are when this widget gets
              //rendered, you can create your Controller
              builder: (_) {
                print("count1 rebuild");
                return Text('${_.count1.value}');
              },
            ),
            GetX<SumController>(
              builder: (_) {
                print("count2 rebuild");
                return Text('${_.count2.value}');
              },
            ),
            GetX<SumController>(builder: (_) {
              print("sum rebuild");
              return Text('${_.sum}');
            }),
            RaisedButton(
              child: Text("Go to last page"),
              onPressed: () {
                Get.to(Third());
              },
            ),
            RaisedButton(
              child: Text("Increment"),
              onPressed: () {
                sumController.increment();
              },
            ),
            RaisedButton(
              child: Text("Increment"),
              onPressed: () {
                sumController.increment2();
              },
            ),
          ],
        ),
      ),
    );
  }
}
