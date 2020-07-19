import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:todo_app/controllers/authController.dart';

class SignUp extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(hintText: "Email"),
                controller: emailController,
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Password"),
                obscureText: true,
                controller: passwordController,
              ),
              FlatButton(
                child: Text("Sign Up"),
                onPressed: () {
                  controller.createUser(
                      emailController.text, passwordController.text);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
