class Post {
  final int id, userId;
  final String title, body;

  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });



  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] ?? 0,
      userId: json['userId'] ?? 0,
      title: json['title'] ?? 0,
      body: json['body'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'userId': userId, 'title': title, 'body': body};
  }
  
}
