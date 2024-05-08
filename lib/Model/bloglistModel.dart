
// To parse this JSON data, do
//
//     final blogData = blogDataFromJson(jsonString);

import 'dart:convert';

BlogData blogDataFromJson(String str) => BlogData.fromJson(json.decode(str));

String blogDataToJson(BlogData data) => json.encode(data.toJson());

class BlogData {
  String? status;
  int? totalResults;
  List<Article>? articles;

  BlogData({
     this.status,
     this.totalResults,
     this.articles,
  });

  factory BlogData.fromJson(Map<String, dynamic> json) => BlogData(
    status: json["status"]??'',
    totalResults: json["totalResults"]??'',
    articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles!.map((x) => x.toJson())),
  };
}

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article({
     this.source,
     this.author,
     this.title,
     this.description,
     this.url,
     this.urlToImage,
     this.publishedAt,
     this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: Source.fromJson(json["source"]),
    author: json["author"]??'',
    title: json["title"]??'',
    description: json["description"]??'',
    url: json["url"]??'',
    urlToImage: json["urlToImage"]??'',
    publishedAt: json["publishedAt"]??'',
    content: json["content"]??'',
  );

  Map<String, dynamic> toJson() => {
    "source": source?.toJson(),
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt,
    "content": content,
  };
}

class Source {
  String? id;
  String? name;

  Source({
     this.id,
     this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"]??'',
    name: json["name"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
