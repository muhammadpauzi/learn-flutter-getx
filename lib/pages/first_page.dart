import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text("First Page"),
      ),
      body: const Center(
        child: Text(
          "First Page",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
