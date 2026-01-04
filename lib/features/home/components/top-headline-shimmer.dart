import 'package:flutter/material.dart';
import 'package:news/constants/app_sizes.dart';
import 'package:news/features/core/widgets/custom-cached-network-image.dart';
import 'package:shimmer/shimmer.dart';

class TopHeadlineShimmer extends StatelessWidget {
  const TopHeadlineShimmer({super.key});

  @override
  Widget build(BuildContext context) {
        return SliverList.builder(
          itemCount: 10,

          itemBuilder: (BuildContext context, int index) {
         
            return  Padding(
              padding:  EdgeInsets.all(16),
              child: Shimmer.fromColors(
                    child: Container( height: AppSizes.h80, color: Colors.white),
                    baseColor: Colors.grey.shade300, // لون الخلفية الأساسي
                    highlightColor: Colors.grey.shade100, // اللون اللي يلمع ويتحرك
                  ),
            );
          },
        );
  }
}