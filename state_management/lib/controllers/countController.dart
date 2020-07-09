import 'package:get/state_manager.dart';

class CountController extends GetxController {
  int count = 0; //no need for .obs

  void increment() {
    count++;
    // use update method to update all count variables
    update();
  }
}
