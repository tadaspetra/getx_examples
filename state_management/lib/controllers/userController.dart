import 'package:get/get.dart';
import 'package:reference/models/user.dart';

class UserController extends GetxController {
  final user = User().obs;

  updateUser(int count) {
    user.update((value) {
      value.name = 'Tadas';
      value.count = count;
    });
  }
}
