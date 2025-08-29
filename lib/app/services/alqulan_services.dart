import 'package:get/get_connect/connect.dart';

class AlqulanServices extends GetConnect {
  void onInit() {
    httpClient.baseUrl = 'https://api.npoint.io/99c279bb173a6e28359c';
    super.onInit();
  }

  Future<Response<List<dynamic>>> fetchAlqulan() {
    return get('/data');
  }
}
