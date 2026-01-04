import 'package:flutter/material.dart';
import 'package:news/constants/app_sizes.dart';
import 'package:shimmer/shimmer.dart';

class TrendingNewsShimmer extends StatelessWidget {
  const TrendingNewsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(left: AppSizes.pw16),

      //
      //هيك بحكيله خود 3 بس
      //هيك امن اكتر حتى لو أقل من 3
      itemCount: 6,
      scrollDirection: Axis.horizontal,
      //هاى بتحل محل البادنح
      separatorBuilder: (context, index) {
        return SizedBox(width: AppSizes.pw12);
      },

      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          child: Container(width: AppSizes.w240, height: AppSizes.h140, color: Colors.white),
          baseColor: Colors.grey.shade300, // لون الخلفية الأساسي
          highlightColor: Colors.grey.shade100, // اللون اللي يلمع ويتحرك
        );
      },
    );
  }
}
