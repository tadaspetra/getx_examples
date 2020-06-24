import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reference/states/counterState.dart';

class Home extends StatelessWidget {
  final CounterState counterState = Get.put(CounterState());

  goToNext() {
    //Navigator.push(context, MaterialPageRoute(builder: (context)=>Other()));
    Get.to(Other());
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
        title: Text("Get Package"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Go To Other"),
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
            StreamBuilder(
              stream: counterState.streamController.stream,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return Text(
                  "Stream: " + snapshot.data.toString(),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            RaisedButton(
              child: Text("Start Stream"),
              onPressed: () {
                counterState.startStream();
              },
            ),
            SizedBox(
              height: 80,
            ),
            Obx(
              () => Text(
                "State: " + counterState.counter.string,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            counterState.increment();
          }),
    );
  }
}

class Other extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Other"),
      ),
    );
  }
}
