import 'source_model.dart';

class Article {
  Source source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  String publishedAt;
  String? content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source'] ?? {}), // Avoid null source crash
      author: json['author'] as String?, // Nullable
      title: json['title'] ?? "No Title", // Avoid null issue
      description: json['description'] ?? "No Description", // Avoid null issue
      url: json['url'] ?? "", // Avoid null crash
      urlToImage: json['urlToImage'] as String?, // Nullable
      publishedAt: json['publishedAt'] ?? "Unknown Date", // Avoid null issue
      content: json['content'] ?? "No Content", // Avoid null issue
    );
  }
}
