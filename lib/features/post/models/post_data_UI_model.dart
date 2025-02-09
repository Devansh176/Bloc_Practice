class PostDataUIModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostDataUIModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostDataUIModel.fromMap(Map<String, dynamic> json) => PostDataUIModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toMap() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}