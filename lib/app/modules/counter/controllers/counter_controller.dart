import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  //TODO: Implement CounterController
  RxInt hitung = 0.obs;
  // RxString nama = "Rpl 1".obs;

  void increment() {
    if (hitung < 100) {
      hitung++;
    } else {
      Get.snackbar(
        "stop",
        "counter tidak boleh lebih dari 10",
        backgroundColor: Colors.red,
        icon: Icon(Icons.warning, color: Colors.white),
        colorText: Colors.white,
      );
    }
  }

  void negatif() {
     if (hitung > 1) {
      hitung--;
    } else {
      Get.snackbar(
        "stop",
        "counter tidak boleh kurang dari 1",
        backgroundColor: Colors.red,
        icon: Icon(Icons.warning, color: Colors.white),
        colorText: Colors.white,
      );
    }
  }
}
