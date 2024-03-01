class NewsModel {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  NewsModel({this.status, this.totalResults, this.articles});

  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] as String?;
    totalResults = json['totalResults'] as int?;
    if (json['articles'] != null) {
      final List<dynamic> carList = json['articles'] as List;
      articles = <Articles>[];
      for (var v in carList) {
        articles!.add(Articles.fromJson(v as Map<String, dynamic>));
      }
    }
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'totalResults': totalResults,
        'articles': articles,
        'cars': articles?.map((v) => v.toJson()).toList(),
      };
}

class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Articles.fromJson(Map<String, dynamic> json) {
    source = json['source'] != null
        ? Source.fromJson(json['source'] as Map<String, dynamic>)
        : null;
    author = json['author'] as String?;
    title = json['title'] as String?;
    description = json['description'] as String?;
    url = json['url'] as String?;
    urlToImage = json['urlToImage'] as String?;
    publishedAt = json['publishedAt'] as String?;
    content = json['content'] as String?;
  }

  Map<String, dynamic> toJson() => {
        'source': source?.toJson(),
        'author': author,
        'title': title,
        'description': description,
        'url': url,
        'urlToImage': urlToImage,
        'publishedAt': publishedAt,
        'content': content,
      };
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    name = json['name'] as String?;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
