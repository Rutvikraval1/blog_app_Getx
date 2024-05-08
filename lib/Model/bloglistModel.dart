
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
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  String? blog_id;

  Article({
     this.author,
     this.title,
     this.description,
     this.url,
     this.urlToImage,
     this.publishedAt,
     this.content,
     this.blog_id,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    author: json["author"]??'',
    title: json["title"]??'',
    description: json["description"]??'',
    url: json["url"]??'',
    urlToImage: json["urlToImage"]??'',
    publishedAt: json["publishedAt"]??'',
    content: json["content"]??'',
    blog_id: json["blog_id"]??'',
  );

  Map<String, dynamic> toJson() => {
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt,
    "blog_id": blog_id,
    "content": content,
  };
}
