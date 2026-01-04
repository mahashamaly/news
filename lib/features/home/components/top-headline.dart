import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/features/core/enums/request-status-enums.dart';
import 'package:news/features/core/extension/date-time-extension.dart';
import 'package:news/features/core/widgets/custom-cached-network-image.dart';
import 'package:news/features/core/widgets/custom-svg-picture.dart';
import 'package:news/features/home/components/news-item.dart';
import 'package:news/features/home/components/top-headline-shimmer.dart';
import 'package:news/features/home/model/home-controller.dart';
import 'dart:math';

import 'package:provider/provider.dart';

class Topheadline extends StatelessWidget {
  Topheadline({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Homecontroller>(
      builder: (context, Controller, child) {
        switch(Controller.newsTopHeadlinesStatus){
          case RequestStatusEnums.loading:
          return TopHeadlineShimmer();
          case RequestStatusEnums.error:
          return SliverToBoxAdapter(child: Center(child: Text(Controller.errorMessage!)));
          case RequestStatusEnums.loaded:
          return  SliverList.builder(
          itemCount: Controller.newsTopHeadlines.length,

          itemBuilder: (BuildContext context, int index) {
            final model = Controller.newsTopHeadlines[index];
             return NewsItem(model: model);
           
          },
        );
          



        }



      },
    );
  }
}
