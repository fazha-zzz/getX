import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_getx/app/modules/counter/controllers/counter_controller.dart';

class CounterView extends GetView<CounterController> {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter View'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                "Hitung ke: ${controller.hitung}",
                style:  TextStyle(fontSize: controller.hitung.value.toDouble()),
              ),
            ),
            const SizedBox(height: 20), 
            
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: controller.increment,
              child: const Text('+', style: TextStyle(fontSize: 16)),
            ),

            const SizedBox(height: 10),

           
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: controller.negatif,
              child: const Text('-', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
