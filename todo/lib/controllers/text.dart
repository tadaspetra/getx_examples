import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class TextController extends GetxController {
  RxString _name = "".obs;

  get name => _name;

  submitName(String name) {
    _name.value = name;
    update();
  }
}
