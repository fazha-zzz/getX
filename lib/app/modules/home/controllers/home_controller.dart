import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  void changepage(int index) {
    selectedIndex.value = index;
  }
}
