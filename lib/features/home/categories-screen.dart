import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news/constants/app_sizes.dart';
import 'package:news/features/core/extension/date-time-extension.dart';
import 'package:news/features/core/theme/light-color.dart';
import 'package:news/features/core/widgets/custom-cached-network-image.dart';
import 'package:news/features/home/components/news-item.dart';
import 'package:news/features/home/model/home-controller.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
 final List categories = ["business", "entertainment", "general", "health", "science", "sports", "technology"];

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
        centerTitle: true,
      ),
      body: Consumer<Homecontroller>(
        builder: (context, Controller, child) {
          return  Column(
          children: [
              Padding(
                  padding:  EdgeInsets.only(left:AppSizes.pw16, bottom: AppSizes.ph16, top: AppSizes.ph16),
                  child: SizedBox(
                    height: AppSizes.h35,
                    child: ListView.separated(
                      itemCount: categories.length,
                      padding: EdgeInsets.only(right: AppSizes.pw16),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        bool isSelected=categories[index]== Controller.selectedCategory;
                        return  InkWell(
                          onTap: () {
                            Controller.updateSelectedCategory(categories[index]);
                          },
                          child: IntrinsicWidth(
                            child: Column(
                              children: [
                                Text(
                                 categories[index][0].toUpperCase() + categories[index].substring(1),
                                  style: TextStyle(fontSize: AppSizes.sp16, color: Color(0xff363636), fontWeight: FontWeight.w400,

                                  
                                  ),
                                ),
                                if(isSelected)
                               ...[
                                 SizedBox(
                                  height: AppSizes.ph4,
                                ),
                          
                                Container(
                                height: AppSizes.h2,
                                color: Lightcolor.primaryColor,
                                )
                               ]
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(width: AppSizes.w12);
                      },
                    ),
                  ),
                          ),



               Expanded(
                child: ListView.builder(
          itemCount: Controller.newsTopHeadlines.length,

          itemBuilder: (BuildContext context, int index) {
            final model = Controller.newsTopHeadlines[index];
            return NewsItem(model: model);
          
          },
        )
                )           
        
          ],
        );
      
        },
        
      ),
    );
  }
}