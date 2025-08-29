import 'package:get/get.dart';
import 'package:latihan_getx/app/data/models/qulan.dart';
import 'package:latihan_getx/app/services/alqulan_services.dart';

class AlqulanController extends GetxController {
  final AlqulanServices _postServices = Get.put<AlqulanServices>(AlqulanServices());

  RxList alqulan = <QulanModel>[].obs;
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;

  get fetchAlqulan => null;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await _postServices.fetchAlqulan();

      if (response.statusCode == 200) {
        var data = response.body!
            .map((qulanJson) => QulanModel.fromJson(qulanJson))
            .toList();
        alqulan.assignAll(data);
      } else {
        errorMessage('Error: ${response.statusText}');
      }
    } catch (e) {
      errorMessage('Exception: $e');
    } finally {
      isLoading(false);
    }
  }
}
