import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news/constants/app_sizes.dart';
import 'package:news/features/core/extension/date-time-extension.dart';
import 'package:news/features/core/widgets/custom-cached-network-image.dart';
import 'package:news/features/core/widgets/custom-svg-picture.dart';
import 'package:news/features/home/model/new-article-model.dart';

class NewsItem extends StatelessWidget {
 NewsItem({super.key,required this.model});
     final NewArticleModel model;
  @override
  Widget build(BuildContext context) {
    return   Padding(
              padding:  EdgeInsets.symmetric(horizontal: AppSizes.pw16, vertical: AppSizes.ph8),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppSizes.r8),

                    child: CustomCachedNetworkImage(imagepath: model.urlToImage ?? ""),
                  ),
                  SizedBox(width: AppSizes.pw8),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.title ?? '',
                          style: TextStyle(fontSize: AppSizes.sp16, fontWeight: FontWeight.w400, overflow: TextOverflow.ellipsis),
                          maxLines: 2,
                        ),

                        Row(
                          children: [
                            if (model.urlToImage != null)
                              CircleAvatar(radius: AppSizes.r10, backgroundImage: NetworkImage(model.urlToImage ?? "")),
                            SizedBox(width: AppSizes.pw6),
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    (model.author ?? "").substring(0, min((model.author ?? "").length, 10)),
                                    style: TextStyle(
                                      fontSize: AppSizes.sp12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0XFF141414),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  SizedBox(width: AppSizes.pw8),

                                  Expanded(
                                    child: Text(
                                      model.publishedAt.formatDateTime(),
                                      style: TextStyle(
                                        fontSize: AppSizes.sp12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0XFF141414),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),

                                   Customsvgpicture.withColorFilter(path: 'assets/img/bookmark.svg'),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
  }
}