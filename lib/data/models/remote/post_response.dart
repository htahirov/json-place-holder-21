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

  factory PostResponse.mock() => PostResponse(
        userId: 1,
        id: 1,
        title:
            'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
        body:
            'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto',
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
