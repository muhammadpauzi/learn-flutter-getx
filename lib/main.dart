import 'package:flutter/material.dart';
import 'package:flutter_getx/controllers/counter_builder_controller.dart';
import 'package:flutter_getx/controllers/counter_controller.dart';
import 'package:flutter_getx/controllers/custom_page_controller.dart';
import 'package:flutter_getx/controllers/person_controller.dart';
import 'package:flutter_getx/controllers/worker_controller.dart';
import 'package:flutter_getx/pages/home_page.dart';
import 'package:flutter_getx/routes/app_route.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
        ),
        useMaterial3: true,
      ),
      home: HomePage(),
      getPages: AppRoute.routes,
      initialRoute: AppRoute.initialRoute,
    );
  }
}

class GetWorker extends StatelessWidget {
  final _workerController = Get.put(WorkerController());

  GetWorker({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Text(
              "CHANGES: ${_workerController.totalChanges}",
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) => _workerController.changed(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Person extends StatelessWidget {
  final PersonController _personController = Get.find<PersonController>();

  Person({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Text(
              "Hello, My Name is ${_personController.person.value.name}, ${_personController.person.value.age} Year(s) Old, My Own ID is (${_personController.person.value.id})",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          TextButton(
            onPressed: () => _personController.regenerateId(),
            child: const Text("Regenerate ID"),
          )
        ],
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final CounterController _counterController = Get.find();

  Counter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Text(
              _counterController.value.toString(),
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filled(
                onPressed: () => _counterController.increment(),
                icon: const Icon(
                  Icons.add_circle_outline,
                ),
              ),
              IconButton.filled(
                onPressed: () => _counterController.decrement(),
                icon: const Icon(
                  Icons.remove_circle_outline,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CounterGetX extends StatelessWidget {
  const CounterGetX({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetX<CounterController>(
            init: CounterController(),
            builder: (controller) => Text(
              controller.value.toString(),
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filled(
                onPressed: () => Get.find<CounterController>().increment(),
                icon: const Icon(
                  Icons.add_circle_outline,
                ),
              ),
              IconButton.filled(
                onPressed: () => Get.find<CounterController>().decrement(),
                icon: const Icon(
                  Icons.remove_circle_outline,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CounterBuilder extends StatelessWidget {
  const CounterBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<CounterBuilderController>(
            init: CounterBuilderController(),
            id: "counter-1-id",
            initState: (state) => print("initState"),
            dispose: (state) => print("dispose"),
            didChangeDependencies: (state) => print("didChangeDependencies"),
            didUpdateWidget: (oldWidget, state) => print("didUpdateWidget"),
            builder: (controller) => Text(
              controller.value.toString(),
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filled(
                onPressed: () =>
                    Get.find<CounterBuilderController>().increment(),
                icon: const Icon(
                  Icons.add_circle_outline,
                ),
              ),
              IconButton.filled(
                onPressed: () =>
                    Get.find<CounterBuilderController>().decrement(),
                icon: const Icon(
                  Icons.remove_circle_outline,
                ),
              )
            ],
          ),
          GetBuilder<CounterBuilderController>(
            init: CounterBuilderController(),
            id: "counter-2-id",
            initState: (state) => print("initState"),
            dispose: (state) => print("dispose"),
            didChangeDependencies: (state) => print("didChangeDependencies"),
            didUpdateWidget: (oldWidget, state) => print("didUpdateWidget"),
            builder: (controller) => Text(
              controller.value.toString(),
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filled(
                onPressed: () =>
                    Get.find<CounterBuilderController>().increment2(),
                icon: const Icon(
                  Icons.add_circle_outline,
                ),
              ),
              IconButton.filled(
                onPressed: () =>
                    Get.find<CounterBuilderController>().decrement2(),
                icon: const Icon(
                  Icons.remove_circle_outline,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
