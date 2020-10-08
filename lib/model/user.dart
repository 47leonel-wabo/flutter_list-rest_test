class NewsPost {
  final int userId;
  final int id;
  final String title;
  final String body;

  NewsPost(this.userId, this.id, this.title, this.body);

  factory NewsPost.fromJson(Map<String, dynamic> json) {
    return NewsPost(json['userId'] as int, json['id'] as int,
        json['title'] as String, json['body'] as String);
  }
}
