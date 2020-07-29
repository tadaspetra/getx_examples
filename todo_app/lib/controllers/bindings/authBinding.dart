import 'package:get/get.dart';
import 'package:todo_app/controllers/authController.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
