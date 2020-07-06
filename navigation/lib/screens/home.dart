import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reference/screens/second.dart';

class Home extends StatelessWidget {
  goToNext() {
    //Navigator.push(context, MaterialPageRoute(builder: (context)=>Second()));
    navigator.push(MaterialPageRoute(builder: (context) => Second()));
    //Get.to(Second());
  }

  _showSnackBar() {
    Get.snackbar(
      "Hey There",
      "Snackbar is easy",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  _showDialog() {
    Get.defaultDialog(
      title: "Simple Dialog",
      content: Text("Too Easy"),
    );
  }

  _showBottomSheet() {
    Get.bottomSheet(
      Container(
        child: Wrap(
          children: <Widget>[
            ListTile(
                leading: Icon(Icons.music_note),
                title: Text('Music'),
                onTap: () => {}),
            ListTile(
              leading: Icon(Icons.videocam),
              title: Text('Video'),
              onTap: () => {},
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Package | Home"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Go To Second"),
              onPressed: () => goToNext(),
            ),
            RaisedButton(
              child: Text("Snackbar"),
              onPressed: _showSnackBar,
            ),
            RaisedButton(
              child: Text("Dialog"),
              onPressed: _showDialog,
            ),
            RaisedButton(
              child: Text("Bottom Sheet"),
              onPressed: _showBottomSheet,
            ),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
              child: Text("Name Route: /second"),
              onPressed: () {
                Get.toNamed("/second");
              },
            )
          ],
        ),
      ),
    );
  }
}
