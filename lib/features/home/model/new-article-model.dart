class NewArticleModel {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  NewArticleModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });
  //تحول الماب لتاسك مودل
  factory NewArticleModel.fromjson(Map<String, dynamic> json) {
    return NewArticleModel(
      author: json["author"],
      title: json["title"] ,
      description: json["description"],
      url: json["url"],
      urlToImage: json["urlToImage"],
      publishedAt: json["publishedAt"],
      content: json["content"],
    );
  }
  // // //بتحول التاسك مودل لماب
  Map<String, dynamic> tojson() {
    return {
      "author": author,
      "title": title,
      "description": description,
      "url": url,
      " urlToImage": urlToImage,
      "publishedAt": publishedAt,
      " content": content,
    };
  }
}
