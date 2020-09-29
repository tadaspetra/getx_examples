import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:clean_cli/presentation/home/controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HomeScreen is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  