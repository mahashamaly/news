
import 'package:news/features/core/datasource/remote-data/api-config.dart';
import 'package:news/features/core/datasource/remote-data/api-service.dart';
import 'package:news/features/home/model/new-article-model.dart';

class NewsRepository {
  
Future<List<NewArticleModel>> getTopHeadLine({String ?selectedCategory="general"})async{
      Map<String, dynamic> result = await Apiservice().get(
    Apiconfig.topHeadlines, 
      params: {"country": "us",
      "category":selectedCategory,
      }
      );
     return (result["articles"] as List).map((e) => NewArticleModel.fromjson(e)).toList();
  }




Future<List<NewArticleModel>> getEverything() async {
  Map<String, dynamic> result = await Apiservice().get(Apiconfig.everything, params: {"q": "news"});

    return (result["articles"] as List).map((e) => NewArticleModel.fromjson(e)).toList();

 }


}