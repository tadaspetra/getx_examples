import 'package:get/get.dart';
import 'package:todo_app/controllers/authController.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/services/database.dart';

class TodoController extends GetxController {
  //stream todos from firestore
  Rx<List<TodoModel>> _todoStream = Rx<List<TodoModel>>();

  List<TodoModel> get todos => _todoStream.value;

  @override
  onInit() {
    String uid = Get.find<AuthController>().user.uid;
    _todoStream.bindStream(
      Database().getTodos(
        uid,
      ),
    );
  }
}
