import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Counter"),
            Obx(() => Text(controller.counter.toString())),
            ElevatedButton(
                child: const Text("Increase"),
                onPressed: () => {controller.increase()}),
            ElevatedButton(
                child: const Text("Decrease"),
                onPressed: () => {controller.decrease()}),
          ],
        ),
      ),
    );
  }
}
