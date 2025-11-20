import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/features/core/datasource/remote-data/api-config.dart';
import 'package:news/features/core/datasource/remote-data/api-service.dart';
import 'package:news/features/home/model/home-controller.dart';
import 'package:news/features/home/model/new-article-model.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});
@override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext  context) => Homecontroller(),
      child: Consumer<Homecontroller>(
        builder: (context, Controller, child) {

       return  Scaffold(
          body: 
          ( Controller.errorMessage?.isNotEmpty??false)?
          Center(child: Text(Controller. errorMessage!))
    
          :Controller.EverythingLoading?Center(child: CircularProgressIndicator()):
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: Controller.newsTopHeadlines.length ,
                  
                  itemBuilder: (BuildContext context,int index){
                    return Text( Controller.newsTopHeadlines[index].title??"");
                    
                  }
                  
                  
                  ),
              )
            ],
          ),
        );

        },
        
      ),
    );
  }

}

