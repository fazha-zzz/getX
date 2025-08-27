import 'package:get/get.dart';
import 'package:latihan_getx/app/data/models/post.dart';
import 'package:latihan_getx/app/services/post_services.dart';

class PostController extends GetxController {
  final PostServices _postServices = Get.put<PostServices>(PostServices());

  RxList posts = <Post>[].obs; 
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;

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

      if (response.statusCode == 200) {
        var data = response.body!
            .map((postJson) => Post.fromJson(postJson))
            .toList();
        posts.assignAll(data);
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
