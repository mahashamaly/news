import 'package:flutter/material.dart';
import 'package:http/http.dart' as apiservice;
import 'package:news/features/core/datasource/remote-data/api-config.dart';
import 'package:news/features/core/datasource/remote-data/api-service.dart';
import 'package:news/features/core/enums/request-status-enums.dart';
import 'package:news/features/home/model/new-article-model.dart';

class Homecontroller extends ChangeNotifier {
  Homecontroller() {
    getTopHeadLine();
    getEverything();
    
  }

  //EverythingStatus → تتبع حالة الـ API (loading / loaded / error)
  //هنا الحالة الاولى التحميل

  RequestStatusEnums everythingStatus = RequestStatusEnums.loading;
  RequestStatusEnums newsTopHeadlinesStatus=RequestStatusEnums.loading;


  String? errorMessage;
  //بالبداية ولا اشى مختار
  String? selectedCategory;


  List<NewArticleModel> newsTopHeadlines = [];
  List<NewArticleModel> newsEverything = [];
  Apiservice apiservice = Apiservice();

  getTopHeadLine({String?category}) async {
  //هنا علشان لمن انتقل من كانوجرى للتانية برضو يعمل لود
   newsTopHeadlinesStatus=RequestStatusEnums.loading;
   notifyListeners();
    try {
      Map<String, dynamic> result = await apiservice.get(Apiconfig.topHeadlines, 
      params: {"country": "us",
      "category":selectedCategory,

      
      
      }
      );
      newsTopHeadlines = (result["articles"] as List).map((e) => NewArticleModel.fromjson(e)).toList();

      //ببساطة: هذان السطران يقولان للتطبيق: "خلصنا التحميل وكل شيء تمام، أقدر أعرض البيانات الآن".
      //يعنى التطبيق لم يعد فى حالة التحميل
      newsTopHeadlinesStatus=RequestStatusEnums.loaded;
      //هنا لا يوجد رسالة خطأ
      errorMessage = null;
    } catch (e) {
      newsTopHeadlinesStatus=RequestStatusEnums.error;
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  getEverything() async {

    //بعد استلام JSON → يحول لكل عنصر إلى NewArticleModel.
    try {
      Map<String, dynamic> result = await apiservice.get(Apiconfig.everything, params: {"q": "news"});

      newsEverything = (result["articles"] as List).map((e) => NewArticleModel.fromjson(e)).toList();
      //يعنى الداتا اجت وانت قادر تعرضها
      everythingStatus = RequestStatusEnums.loaded;
      errorMessage = null;
    } catch (e) {
      //هنا اذا فشل راح يعرض رسالة الخطأ
      everythingStatus = RequestStatusEnums.error;
      errorMessage = e.toString();
    }
   notifyListeners();
  }





void updateSelectedCategory(String category){
  //"بدّي أغيّر قيمة selectedCategory وأخليها تساوي الكاتيجوري الجديد الذي وصلني."
  selectedCategory=category;
  getTopHeadLine(category: selectedCategory);
  notifyListeners();

}



 




}
