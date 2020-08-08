import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String todoId;
  String content;
  Timestamp dateCreated;
  bool done;

  TodoModel(this.dateCreated, this.done, this.content);

  TodoModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    todoId = documentSnapshot.documentID;
    content = documentSnapshot["content"];
    dateCreated = documentSnapshot["dateCreated"];
    done = documentSnapshot["done"];
  }
}
