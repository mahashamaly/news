import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/features/home/model/new-article-model.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<NewArticleModel>newsTopHeadlines=[];
    List<NewArticleModel>newsEverything=[];

  @override
  void initState() {
 getTopHeadLine();
    super.initState();
  }

//الخطوة 1: استدعاء API
getTopHeadLine()async{

var urlForTopHeadlines = Uri.https('newsapi.org', 'v2/top-headlines',
{
  "apiKey":"a56816fb524d4550aff5c646aefe4144",
  "country":"us"
}


);
print(urlForTopHeadlines);
  final http.Response response= await http.get(urlForTopHeadlines);
  //الخطوة 2: تحويل JSON إلى Map
  Map<String,dynamic> result=jsonDecode(response.body)as Map<String,dynamic>;
  print(result["articles"]);
setState(() {
  newsTopHeadlines=(result["articles"]as List).map((e)=>NewArticleModel.fromjson(e)).toList();
});



  }
  getEverything()async{

var urlForTopHeadlines = Uri.https('newsapi.org', 'v2/everything',
{
  "apiKey":"a56816fb524d4550aff5c646aefe4144",
  "q":"news",
}


);
print(urlForTopHeadlines);
  final http.Response response= await http.get(urlForTopHeadlines);
  //الخطوة 2: تحويل JSON إلى Map
  Map<String,dynamic> result=jsonDecode(response.body)as Map<String,dynamic>;
  print(result["articles"]);
setState(() {
  newsEverything=(result["articles"]as List).map((e)=>NewArticleModel.fromjson(e)).toList();
});



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount:newsTopHeadlines.length ,
              
              itemBuilder: (BuildContext context,int index){
                return Text(newsTopHeadlines[index].title??"");
                
              }
              
              
              ),
          )
        ],
      ),
    );
  }
}