import 'package:flutter/material.dart';
import 'package:http/http.dart' as apiservice;
import 'package:news/features/core/datasource/remote-data/api-config.dart';
import 'package:news/features/core/datasource/remote-data/api-service.dart';
import 'package:news/features/home/model/new-article-model.dart';

class Homecontroller extends ChangeNotifier {
  Homecontroller(){
    getTopHeadLine();
    getEverything();
  }
  bool topHeadLineLoading=true;
  bool EverythingLoading=true;
   String? errorMessage;
   List<NewArticleModel>newsTopHeadlines=[];
    List<NewArticleModel>newsEverything=[];
    Apiservice apiservice=Apiservice();

  
getTopHeadLine()async{
try{

   Map<String,dynamic> result= await apiservice.get(Apiconfig.topHeadlines,
 params: {
"country":"us"
 }
 
 );
   newsTopHeadlines=(result["articles"]as List).map((e)=>NewArticleModel.fromjson(e)).toList();

 //ببساطة: هذان السطران يقولان للتطبيق: "خلصنا التحميل وكل شيء تمام، أقدر أعرض البيانات الآن".
 //يعنى التطبيق لم يعد فى حالة التحميل
topHeadLineLoading=false;
//هنا لا يوجد رسالة خطأ
errorMessage=null;

}catch(e){
topHeadLineLoading=false;
errorMessage=e.toString();
   

}
notifyListeners();

  }
    getEverything()async{
    
try{
  
Map<String,dynamic>result=await apiservice.get(Apiconfig.everything,
params: {
  "q":"news"
}

);

  newsEverything=(result["articles"]as List).map((e)=>NewArticleModel.fromjson(e)).toList();
EverythingLoading=false;
errorMessage=null;

 
}catch(e){
   
EverythingLoading=false;
errorMessage=e.toString();
}
notifyListeners();

  }
}