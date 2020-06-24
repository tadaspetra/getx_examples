import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/semantics.dart';
import 'package:get/get.dart';

class CounterState extends GetController {
  IntX<int> counter = 0.obs;

  StreamController<int> streamController = StreamController<int>();

  void increment() {
    counter.value++;
  }

  void startStream() {
    Stream<DocumentSnapshot> doc =
        Firestore.instance.collection("data").document("1234").snapshots();

    doc.listen((event) {
      streamController.sink.add(event.data["counter"]);
    });
  }

  @override
  void onClose() {
    streamController.close();
    super.onClose();
  }
}
