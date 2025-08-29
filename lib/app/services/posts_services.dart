import 'package:get/get_connect/connect.dart';
import 'package:get_storage/get_storage.dart';

class PostsServices extends GetConnect {
  final String postUrl = 'http://127.0.0.1:8000/api';
  final box = GetStorage();
  
  

  Future<Response> fetchPosts() async {
    try {
      final token = box.read("token");
      return await get(
        "$postUrl/posts",
        headers: {"Authorization": "Bearer $token"},
      );
    } catch (e) {
      return Response(statusCode: 500, statusText: "Exception: $e");
    }
  }

/// Get detail post
  Future<Response> fetchPostById(int id) async {
    try {
      final token = box.read("token");
      return await get(
      "$postUrl/posts/$id",
      headers: {"Authorization": "Bearer $token"});
    } catch (e) {
      return Response(statusCode: 500, statusText: "Exception: $e");
    }
  }

  /// Create post
  Future<Response> createPost(Map<String, dynamic> data) async {
    try {
      final token = box.read("token");
      return await post("$postUrl/posts", data, headers: 
      {"Authorization": "Bearer $token"},
      );
    } catch (e) {
      return Response(statusCode: 500, statusText: "Exception: $e");
    }
  }

  /// Update post
  Future<Response> updatePost(int id, Map<String, dynamic> data) async {
    try {
      final token = box.read("token");
      return await put("$postUrl/posts/$id", data, headers: 
      {"Authorization": "Bearer $token"},
      );
    } catch (e) {
      return Response(statusCode: 500, statusText: "Exception: $e");
    }
  }

  /// Delete post
  Future<Response> deletePost(int id) async {
    try {
      final token = box.read("token");
      return await delete("$postUrl/posts/$id", headers: 
      {"Authorization": "Bearer $token"},
      );
    } catch (e) {
      return Response(statusCode: 500, statusText: "Exception: $e");
    }
  }
}
