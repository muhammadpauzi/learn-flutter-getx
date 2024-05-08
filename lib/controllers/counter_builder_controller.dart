import 'package:get/state_manager.dart';

class CounterBuilderController extends GetxController {
  var value = 0;

  void increment() {
    value++;
    update(['counter-1-id']);
  }

  void decrement() {
    value--;
    update(['counter-1-id']);
  }

  void increment2() {
    value++;
    update(['counter-2-id']);
  }

  void decrement2() {
    value--;
    update(['counter-2-id']);
  }
}
