import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String content;
  String todoId;
  Timestamp dateCreated;
  bool done;

  TodoModel(
    this.content,
    this.todoId,
    this.dateCreated,
    this.done,
  );

  TodoModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    todoId = documentSnapshot.documentID;
    content = documentSnapshot.data["content"];
    dateCreated = documentSnapshot.data["dateCreated"];
    done = documentSnapshot.data["done"];
  }
}
