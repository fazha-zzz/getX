import 'package:get/get.dart';

import '../controllers/alqulan_controller.dart';

class AlqulanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AlqulanController>(
      () => AlqulanController(),
    );
  }
}
