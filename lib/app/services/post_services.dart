import 'package:get/get_connect/connect.dart';

class PostServices extends GetConnect {
  void onInit() {
    httpClient.baseUrl = 'https://jsonplaceholder.typicode.com';
    super.onInit();
  }

  Future<Response<List<dynamic>>> fetchPosts() {
    return get('/posts');
  }

 
}
