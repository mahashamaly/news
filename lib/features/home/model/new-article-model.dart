class NewArticleModel {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime publishedAt;
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
  factory NewArticleModel.fromjson(Map<String, dynamic> map) {
    return NewArticleModel(
      author: map["author"],
      title: map["title"] ,
      description: map["description"],
      url: map["url"],
      urlToImage: map["urlToImage"],
      publishedAt:DateTime.tryParse(map["publishedAt"])??DateTime.now(),          
      content: map["content"],
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
