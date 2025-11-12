import 'dart:convert';

List<NewsEntry> newsEntryFromJson(String str) => List<NewsEntry>.from(
    json.decode(str).map((x) => NewsEntry.fromJson(x)));

String newsEntryToJson(List<NewsEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsEntry {
  String model;
  String pk;
  Fields fields;

  NewsEntry({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory NewsEntry.fromJson(Map<String, dynamic> json) => NewsEntry(
    model: json["model"],
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": model,
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  int userId;
  String title;
  String content;
  String category;
  String thumbnail;
  bool isFeatured;
  int newsViews;
  DateTime createdAt;
  DateTime updatedAt;

  Fields({
    required this.userId,
    required this.title,
    required this.content,
    required this.category,
    required this.thumbnail,
    required this.isFeatured,
    required this.newsViews,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    userId: json["user"],
    title: json["title"],
    content: json["content"],
    category: json["category"],
    thumbnail: json["thumbnail"] ?? "",
    isFeatured: json["is_featured"],
    newsViews: json["news_views"] ?? 0,
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "user": userId,
    "title": title,
    "content": content,
    "category": category,
    "thumbnail": thumbnail,
    "is_featured": isFeatured,
    "news_views": newsViews,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}