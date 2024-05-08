import 'package:get/state_manager.dart';

class CounterController extends GetxController {
  var value = 0.obs;

  void increment() => value++;
  void decrement() => value--;
}
