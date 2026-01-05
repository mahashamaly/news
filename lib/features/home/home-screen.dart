import 'dart:async';
import 'dart:math';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/features/core/datasource/remote-data/api-config.dart';
import 'package:news/features/core/datasource/remote-data/api-service.dart';
import 'package:news/features/core/extension/date-time-extension.dart';
import 'package:news/features/core/theme/light-color.dart';
import 'package:news/features/home/components/categories-list.dart';
import 'package:news/features/home/components/top-headline.dart';
import 'package:news/features/home/components/trending-news.dart';
import 'package:news/features/home/components/view-all-components.dart';
import 'package:news/features/home/model/home-controller.dart';
import 'package:news/features/home/model/new-article-model.dart';
import 'package:news/features/home/repos/news_repository.dart';
import 'package:provider/provider.dart';


class Homescreen extends StatelessWidget {
  const Homescreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return Homecontroller(NewsRepository());
      },
      child: Consumer<Homecontroller>(
        builder: (context, Controller, child) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                TrendingNews(),
                CategoriesList(),
                Topheadline(),
              
                
              ],
            ),
          );
        },
      ),
    );
  }
}



