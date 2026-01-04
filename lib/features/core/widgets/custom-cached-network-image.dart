import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';



class CustomCachedNetworkImage extends StatelessWidget {
  CustomCachedNetworkImage({super.key, required this.imagepath, this.height, this.width});
  final String imagepath;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagepath,
      placeholder: (context, url) => Shimmer.fromColors(
        child: Container( width: width ?? 140, height: height ?? 80,color: Colors.white,),
        baseColor: Colors.grey.shade300, // لون الخلفية الأساسي
        highlightColor: Colors.grey.shade100,// اللون اللي يلمع ويتحرك 
        
      ),
      errorWidget: (context, url, error) => Icon(Icons.error), // لو فشل التحميل
      width: width ?? 140,
      height: height ?? 80,
      fit: BoxFit.cover,
    );
  }
}
