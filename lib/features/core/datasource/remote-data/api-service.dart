import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/features/core/datasource/remote-data/api-config.dart';
import 'package:news/features/home/model/new-article-model.dart';
//هادا الكلاس مسؤول  عن التواصل مع السيرفر
class Apiservice {
  //هيك عملت نسخة من الكلاس
  static final Apiservice _instance=Apiservice._();//نسخة واحدة محفوظة
  //الفايدة منها انادى على الكلاس بشكل مباشر
  //وبعمل ريترن ل instance
  factory Apiservice()=>_instance;// // private constructor يمنع أي نسخة جديدة

  Apiservice._();
  Future<dynamic> get(String endpoint, {Map<String, dynamic>? params}) async {
    var url = Uri.http(Apiconfig.baseUrl, "v2/$endpoint", {"apikey": Apiconfig.apikey, ...?params});
   

    try {
      //هنا هيك بعتنا طلب
      //هذا السطر هو لحظة “التواصل الحقيقي” بين تطبيقك والسيرفر.
      final http.Response response = await http.get(url);
      //تحويل النص JSON إلى Map
      return jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      throw Exception("Faild To Load Data");
    }
  }
}
