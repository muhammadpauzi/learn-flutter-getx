import 'package:get/get.dart';

class WorkerController extends GetxController {
  var totalChanges = 0.obs;
  var somethingElse = 0.obs;

  @override
  void onInit() {
    // WORKERS
    ever(totalChanges, (callback) => print("EVER WORKER DONE"));
    everAll([totalChanges, somethingElse],
        (callback) => print("EVER ALL WORKER DONE"));

    once(totalChanges, (callback) => print("ONCE WORKER DONE"));

    debounce(
      totalChanges,
      (callback) => print("DEBOUNCE WORKER DONE"),
      time: const Duration(seconds: 3),
    );

    interval(
      totalChanges,
      (callback) => print("INTERVAL WORKER DONE"),
      time: const Duration(seconds: 3),
    );

    super.onInit();
  }

  void changed() => totalChanges++;
}
