import 'package:flutter/material.dart';
import 'package:get/get.dart';

class First extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title".trArgs(['John'])),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                controller: emailController,
              ),
            ),
            RaisedButton(
              child: Text("Validate Email"),
              onPressed: () {
                if (GetUtils.isEmail(emailController.text)) {
                  Get.snackbar(
                    "Email Correct",
                    "Good Email Format",
                    backgroundColor: Colors.green,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                } else {
                  Get.snackbar(
                    "Email Incorrect",
                    "Bad Email Format",
                    backgroundColor: Colors.red,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
            ),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
              child: Text('Change locale to English'),
              onPressed: () {
                Get.updateLocale(Locale('en', 'UK'));
              },
            ),
            RaisedButton(
              child: Text('Change locale to US'),
              onPressed: () {
                Get.updateLocale(Locale('en', 'US'));
              },
            ),
            RaisedButton(
              child: Text('Change locale to Portugal'),
              onPressed: () {
                Get.updateLocale(Locale('pt', 'PT'));
              },
            ),
            RaisedButton(
              child: Text('Change locale to Brazil'),
              onPressed: () {
                Get.updateLocale(Locale('pt', 'BR'));
              },
            ),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
              child: Text('Next Route'),
              onPressed: () {
                Get.toNamed('/second');
              },
            ),
          ],
        ),
      ),
    );
  }
}
