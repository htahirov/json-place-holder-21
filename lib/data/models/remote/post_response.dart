class PostResponse {
  final int userId;
  final int id;
  final String title;
  final String? body;

  PostResponse({
    required this.userId,
    required this.id,
    required this.title,
    this.body,
  });

  factory PostResponse.fromJson(Map<String, dynamic> json) => PostResponse(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
