import 'package:flutter/material.dart';
import 'package:get/get.dart'; 

class LoginformView extends GetView {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('LoginformView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LoginformView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  