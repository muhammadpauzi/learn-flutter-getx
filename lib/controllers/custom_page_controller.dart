import 'package:get/state_manager.dart';

class CustomPageController extends GetxController {
  var currentIndexPage = 0.obs;

  void changeIndex(int index) => currentIndexPage.value = index;
}
