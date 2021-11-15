import 'package:newsapi_newsapp/models/source_model.dart';

class Article {
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  factory Article.fromJson(Map<String, dynamic> json) {
    String urlToImage = '';
    if (json['urlToImage'] != null) {
      urlToImage = json['urlToImage'] as String;
    }
    String author = '';
    if (json['author'] != null) {
      author = json['author'] as String;
    }
    String content = '';
    if (json['content'] != null) {
      content = json['content'] as String;
    }

    return Article(
        source: Source.fromJson(json['source']),
        author: author,
        title: json['title'] as String,
        description: json['description'] as String,
        url: json['url'] as String,
        urlToImage: urlToImage,
        publishedAt: json['publishedAt'] as String,
        content: content);
  }
}
