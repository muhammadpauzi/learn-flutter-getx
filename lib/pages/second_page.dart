import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Second Page"),
      ),
      body: Center(
        child: Text(
          "Second Page: Number ${Get.parameters['number'] ?? 0}",
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
