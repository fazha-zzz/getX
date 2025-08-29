import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:latihan_getx/app/routes/app_pages.dart';
import 'package:latihan_getx/app/services/auth_services.dart';

class AuthController extends GetxController {
  final AuthServices api = AuthServices();
  final box = GetStorage();

  var isLoading = false.obs;

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    final res = await api.login(email, password);
    isLoading.value = false;

    if (res.statusCode == 200 ) {
      final token = res.body['access_token'];
      box.write('token', token);
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.snackbar("Error", res.body['message'] ?? "Login gagal");
    }
  }

  Future<void> register(String name, String email, String password) async {
    isLoading.value = true;
    final res = await api.register(name, email, password);
    isLoading.value = false;

    if (res.statusCode == 201) {
      Get.snackbar("Success", "Register berhasil");
      Get.offAllNamed(Routes.LOGIN);
    } else {
      Get.snackbar("Error", res.body.toString());
    }
  }
  Future<void> logout() async {
    final token = box.read('token');
    if (token != null) {
      await api.logout(token);
    }
    box.remove('token');
    Get.offAllNamed(Routes.LOGIN);
  }
}
