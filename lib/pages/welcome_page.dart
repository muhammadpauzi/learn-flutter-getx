import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 41,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton(
              onPressed: () => Get.offAllNamed('/home'),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Next..",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
