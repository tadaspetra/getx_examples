import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reference/controllers/text.dart';

class Home extends StatelessWidget {
  final TextController textController = Get.put(TextController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: GetBuilder<TextController>(
            builder: (_) {
              return Text(_.name.value);
            },
          ),
          centerTitle: true,
        ),
        body: GetBuilder<TextController>(
          builder: (_) {
            if (_.name.value == "") {
              return BeforeName(
                textController: _,
              );
            } else {
              return AfterName(
                textController: _,
              );
            }
          },
        ));
  }
}

class BeforeName extends StatelessWidget {
  final TextController textController;
  final TextEditingController _nameController = TextEditingController(text: "");
  BeforeName({this.textController});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: TextFormField(
              controller: _nameController,
            ),
          ),
          RaisedButton(
            child: Text("click me"),
            onPressed: () {
              textController.submitName(_nameController.text);
            },
          ),
        ],
      ),
    );
  }
}

class AfterName extends StatelessWidget {
  final TextController textController;

  AfterName({this.textController});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text("click me"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
