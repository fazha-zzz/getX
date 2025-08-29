import 'package:get/get.dart';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:latihan_getx/app/data/models/posts.dart';
import 'package:latihan_getx/app/services/posts_services.dart';

class PostsController extends GetxController {
  final PostsServices _postServices = Get.put(PostsServices());

  // simpan hanya list DataPost biar gampang dipakai di UI
  RxList<DataPost> posts = <DataPost>[].obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  Rx<Uint8List?> selectedImageBytes = Rx<Uint8List?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

 
  void fetchPosts() async {
    try {
      isLoading(true);
      errorMessage('');

      final response = await _postServices.fetchPosts();

      if (response.isOk) {
        final result = Post.fromJson(response.body as Map<String, dynamic>);
        posts.assignAll(result.data ?? []);
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
