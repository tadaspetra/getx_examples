import 'package:get/get.dart';
import 'package:todo_app/controllers/authController.dart';
import 'package:todo_app/controllers/bindings/authBinding.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/services/database.dart';

class TodoController extends GetxController {
  Rx<List<TodoModel>> todoList = Rx<List<TodoModel>>();

  List<TodoModel> get todos => todoList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user.uid;
    todoList
        .bindStream(Database().todoStream(uid)); //stream coming from firebase
  }
}
