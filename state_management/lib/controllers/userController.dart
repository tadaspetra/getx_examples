import 'package:get/get.dart';
import 'package:reference/models/user.dart';

class UserController extends GetxController {
  final list = [56].obs;
  final user = User().obs;

  updateUser() {
    user.update((value) {
      value.name = 'Tadas';
      value.age = 23;
    });
  }

  incrementList() => list.add(75);
}
