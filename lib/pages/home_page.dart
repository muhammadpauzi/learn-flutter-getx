import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_getx/controllers/counter_controller.dart';
import 'package:flutter_getx/controllers/custom_page_controller.dart';
import 'package:flutter_getx/controllers/person_controller.dart';
import 'package:flutter_getx/main.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  final CustomPageController _customPageController =
      Get.put(CustomPageController());

  final CounterController _counterController = Get.put(CounterController());
  final PersonController _personController = Get.put(PersonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: NavigationDrawer(
          selectedIndex: 0,
          onDestinationSelected: (value) => switch (value) {
            0 => Get.toNamed('/home'),
            1 => Get.toNamed('/first-page'),
            2 => Get.toNamed('/second-page/${Random().nextInt(100)}'),
            _ => Get.toNamed('/home')
          },
          children: const [
            DrawerHeader(
              child: Text("Halaman"),
            ),
            NavigationDrawerDestination(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: Text("Home"),
            ),
            NavigationDrawerDestination(
              icon: Icon(
                Icons.abc,
              ),
              label: Text("First Page"),
            ),
            NavigationDrawerDestination(
              icon: Icon(
                Icons.abc,
              ),
              label: Text("Second Page"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Obx(() => Text("GETx (${_counterController.value})")),
      ),
      body: Obx(
        () => switch (_customPageController.currentIndexPage.value) {
          0 => Counter(),
          1 => const CounterGetX(),
          2 => const CounterBuilder(),
          3 => Person(),
          4 => GetWorker(),
          int() => const Center(
              child: Text("Hello, World"),
            ),
        },
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) => _customPageController.changeIndex(index),
          currentIndex: _customPageController.currentIndexPage.value,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.swap_vert_circle_outlined,
              ),
              label: "Counter",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.swap_vertical_circle,
              ),
              label: "Counter GetX",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.swap_vert_sharp,
              ),
              label: "Counter Builder",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_outlined,
              ),
              label: "Person",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_accessibility_sharp,
              ),
              label: "Worker",
            )
          ],
        ),
      ),
    );
  }
}
