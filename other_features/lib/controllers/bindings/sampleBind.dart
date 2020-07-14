import 'package:get/get.dart';
import 'package:reference/controllers/sumController.dart';

class SampleBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SumController>(() => SumController());
  }
}
