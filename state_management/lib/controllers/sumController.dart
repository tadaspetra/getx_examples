import 'package:get/state_manager.dart';

class SumController extends GetxController {
  final count1 = 0.obs;
  final count2 = 0.obs;

  /// Once the controller has entered memory, onInit will be called.
  /// It is preferable to use onInit instead of class constructors or initState method.
  /// Use onInit to trigger initial events like API searches, listeners registration
  /// or Workers registration.
  /// Workers are event handlers, they do not modify the final result,
  /// but it allows you to listen to an event and trigger customized actions.
  /// Here is an outline of how you can use them:
  @override
  onInit() {
    /// Called every time the variable $_ is changed
    ever(count1, (_) => print("$_ has been changed"));

    /// Called first time the variable $_ is changed
    once(count1, (_) => print("$_ was changed once"));

    /// Anti DDos - Called every time the user stops typing for 1 second, for example.
    debounce(count1, (_) => print("debouce$_"), time: Duration(seconds: 1));

    /// Ignore all changes within 1 second.
    interval(count1, (_) => print("interval $_"), time: Duration(seconds: 1));
  }

  int get sum => count1.value + count2.value;

  increment() => count1.value++;

  increment2() => count2.value++;
}
