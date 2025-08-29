class Post {
  bool? success;
  List<DataPost>? data;
  String? massage;

  Post({this.success, this.data, this.massage});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      success: json['success'],
      massage: json['massage'],
      data: json['data'] != null
          ? (json['data'] as List).map((e) => DataPost.fromJson(e)).toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "massage": massage,
      "data": data?.map((e) => e.toJson()).toList(),
    };
  }
}

class DataPost {
  int? id;
  String? title;
  String? foto;
  String? content;
  String? slug;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  DataPost({
    this.id,
    this.title,
    this.foto,
    this.content,
    this.slug,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory DataPost.fromJson(Map<String, dynamic> json) {
    return DataPost(
      id: json['id'],
      title: json['title'],
      foto: json['foto'],
      content: json['content'],
      slug: json['slug'],
      status: json['status'] is int
          ? json['status']
          : int.tryParse(json['status']?.toString() ?? '0'),
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "foto": foto,
      "content": content,
      "slug": slug,
      "status": status,
      "created_at": createdAt?.toIso8601String(),
      "updated_at": updatedAt?.toIso8601String(),
    };
  }
}
