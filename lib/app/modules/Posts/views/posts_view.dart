import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_getx/app/modules/Posts/views/posts_create_view.dart';
import 'package:latihan_getx/app/modules/Posts/views/posts_detail_view.dart';
import '../controllers/posts_controller.dart'; // controller baru

class PostsView extends GetView<PostsController> {
  PostsView({Key? key}) : super(key: key);

  final PostsController controller = Get.put(PostsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts'),
      
      ),
       
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(controller.errorMessage.value),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: controller.fetchPosts,
                  child: const Text('Coba lagi'),
                ),
              ],
            ),
          );
        }

        final posts = controller.posts;
        if (posts.isEmpty) {
          return const Center(child: Text('Data kosong'));
        }

                  return ListView.separated(
                    itemCount: posts.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (ctx, i) {
                      final post = posts[i];
                      return ListTile(
                        leading: (post.foto != null && post.foto!.isNotEmpty)
              ? Image.network(
                      'http://127.0.0.1:8000/storage/${post.foto}',
                      width: 70,
                      height: 100,
                      fit: BoxFit.cover,
                    )
              : const Icon(Icons.image_not_supported, size: 40),
 
              title: Text(post.title ?? 'Tanpa Judul'),
              subtitle: Text(
                post.content ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () => Get.to(() => PostsDetailView(dataPost: post)),
            );
          },
        );
      }),
    );
  }
}
