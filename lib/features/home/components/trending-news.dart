import 'package:flutter/material.dart';
import 'package:news/constants/app_sizes.dart';
import 'package:news/features/core/enums/request-status-enums.dart';
import 'package:news/features/core/extension/date-time-extension.dart';
import 'package:news/features/core/theme/light-color.dart';
import 'package:news/features/core/widgets/custom-cached-network-image.dart';
import 'package:news/features/home/components/trending-news-shimmer.dart';
import 'package:news/features/home/components/view-all-components.dart';
import 'package:news/features/home/model/home-controller.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class TrendingNews extends StatelessWidget {
  const TrendingNews({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: AppSizes.h330,
        child: Stack(
          children: [
            SizedBox(
              height: AppSizes.h240,
              width: double.infinity,

              child: Image.asset('assets/img/background.png', fit: BoxFit.cover),
            ),
            //.fillبتيجى بالوسط
            Positioned.fill(
              top:AppSizes.ph70 ,
              child: Column(
                children: [
                  Text(
                    "NEWST",
                    style: TextStyle(fontSize: AppSizes.sp40, color: Lightcolor.primaryColor, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: AppSizes.ph6,),

                  ViewAllComponents(title: 'Trending News', onTap: () {}),

                  SizedBox(height: AppSizes.ph12),

                  SizedBox(
                    height: AppSizes.h140,
                    child: Consumer<Homecontroller>(
                      builder: (context, Controller, child) {
                        switch (Controller.everythingStatus) {
                          case RequestStatusEnums.loading:
                       return   TrendingNewsShimmer ();
    //                         return ListView.separated(
    //                           padding: EdgeInsets.only(left: 16),

    //                           //
    //                           //هيك بحكيله خود 3 بس
    //                           //هيك امن اكتر حتى لو أقل من 3
    //                           itemCount: 6,
    //                           scrollDirection: Axis.horizontal,
    //                           //هاى بتحل محل البادنح
    //                           separatorBuilder: (context, index) {
    //                             return SizedBox(width: 12);
    //                           },

    //                           itemBuilder: (BuildContext context, int index) {
    //                             return  Shimmer.fromColors(
    //   child: Container(width: 240, height: 140, color: Colors.white),
    //   baseColor: Colors.grey.shade300, // لون الخلفية الأساسي
    //   highlightColor: Colors.grey.shade100, // اللون اللي يلمع ويتحرك
    // );
    //                           },
    //                         );
                          //  return Center(child: CircularProgressIndicator());

                          case RequestStatusEnums.error:
                            return Center(child: Text(Controller.errorMessage!));
                          case RequestStatusEnums.loaded:
                            return ListView.separated(
                              padding: EdgeInsets.only(left: AppSizes.pw16),

                              //
                              //هيك بحكيله خود 3 بس
                              //هيك امن اكتر حتى لو أقل من 3
                              itemCount: Controller.newsEverythingList.take(6).length,
                              scrollDirection: Axis.horizontal,
                              //هاى بتحل محل البادنح
                              separatorBuilder: (context, index) {
                                return SizedBox(width: AppSizes.pw12);
                              },

                              itemBuilder: (BuildContext context, int index) {
                                //بدل ما اضل اكتبها بكل سطر
                                final model = Controller.newsEverythingList[index];
                                return SizedBox(
                                  // عملت للكليب سايز علشان الكلام لمن يجى ما يطلع برة الصورة
                                  width: 240,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(AppSizes.r12),
                                    child: Stack(
                                      children: [
                                        //urlToImage هي nullable (String?) يعني ممكن تكون null إذا الخبر ما عنده صورة.
                                        if (model.urlToImage != null)
                                          CustomCachedNetworkImage(
                                            imagepath: model.urlToImage ?? "",
                                            width: AppSizes.w240,
                                            height: AppSizes.h140,
                                          ),

                                        //هنا بدنا نعمل لينير علشان نقدر نكتب على الصورة
                                        Positioned.fill(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Colors.black.withValues(alpha: 0.5),
                                                  Colors.black.withValues(alpha: 0.7),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),

                                        Positioned(
                                          bottom:AppSizes.ph12,
                                          right: AppSizes.pw12,
                                          left: AppSizes.pw12,

                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,

                                            children: [
                                              Text(
                                                model.title ?? "No Title",
                                                style: TextStyle(
                                                  color: Color(0xFFFFFCFC),
                                                  fontSize: AppSizes.sp14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                maxLines: 2,
                                              ),
                                              SizedBox(height: AppSizes.ph6),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        CircleAvatar(
                                                          backgroundImage: NetworkImage(model.urlToImage.toString()),
                                                          radius: AppSizes.r10,
                                                        ),
                                                        SizedBox(width: AppSizes.pw6),
                                                        Expanded(
                                                          child: Text(
                                                            model.author ?? "",
                                                            style: TextStyle(
                                                              fontSize: AppSizes.sp12,
                                                              fontWeight: FontWeight.w400,
                                                              color: Color(0XFFFFFCFC),
                                                            ),
                                                            maxLines: 1,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                    model.publishedAt.formatDateTime(),
                                                    style: TextStyle(
                                                      fontSize: AppSizes.sp14,
                                                      fontWeight: FontWeight.w400,
                                                      color: Color(0xFFFFFCFC),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//import 'package:flutter/material.dart';
// import 'package:news/features/core/enums/request-status-enums.dart';
// import 'package:news/features/core/extension/date-time-extension.dart';
// import 'package:news/features/core/theme/light-color.dart';
// import 'package:news/features/core/widgets/custom-cached-network-image.dart';
// import 'package:news/features/home/components/view-all-components.dart';
// import 'package:news/features/home/model/home-controller.dart';
// import 'package:provider/provider.dart';

// class TrendingNews extends StatelessWidget {
//   const TrendingNews({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SliverToBoxAdapter(
//       child: SizedBox(
//         height: 330,
//         child: Stack(
//           children: [
//             SizedBox(
//               height: 240,
//               width: double.infinity,

//               child: Image.asset('assets/img/background.png', fit: BoxFit.cover),
//             ),
//             //.fillبتيجى بالوسط
//             Positioned.fill(
//               top: 70,
//               child: Column(
//                 children: [
//                   Text(
//                     "NEWST",
//                     style: TextStyle(fontSize: 40, color: Lightcolor.primaryColor, fontWeight: FontWeight.w600),
//                   ),

//                   ViewAllComponents(title: 'Trending News', onTap: () {}),

//                   SizedBox(height: 12),

//                   SizedBox(
//                     height: 140,
//                     child: Consumer<Homecontroller>(
//                       builder: (context, Controller, child) {
//                         switch (Controller.everythingStatus) {
//                           case RequestStatusEnums.loading:
//                             return Center(child: CircularProgressIndicator());

//                           case RequestStatusEnums.error:
//                             return Center(child: Text(Controller.errorMessage!));
//                           case RequestStatusEnums.loaded:

//                             return ListView.separated(
//                               padding: EdgeInsets.only(left: 16),

//                               //
//                               //هيك بحكيله خود 3 بس
//                               //هيك امن اكتر حتى لو أقل من 3
//                               itemCount: Controller.newsEverything.take(6).length,
//                               scrollDirection: Axis.horizontal,
//                               //هاى بتحل محل البادنح
//                               separatorBuilder: (context, index) {
//                                 return SizedBox(width: 12);
//                               },

//                               itemBuilder: (BuildContext context, int index) {
//                                 //بدل ما اضل اكتبها بكل سطر
//                                 final model = Controller.newsEverything[index];
//                                 return SizedBox(
//                                   // عملت للكليب سايز علشان الكلام لمن يجى ما يطلع برة الصورة
//                                   width: 240,
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(12),
//                                     child: Stack(
//                                       children: [
//                                         //urlToImage هي nullable (String?) يعني ممكن تكون null إذا الخبر ما عنده صورة.
//                                         if (model.urlToImage != null)
//                                           CustomCachedNetworkImage(
//                                             imagepath: model.urlToImage ?? "",
//                                             width: 240,
//                                             height: 140,
//                                           ),

//                                         //هنا بدنا نعمل لينير علشان نقدر نكتب على الصورة
//                                         Positioned.fill(
//                                           child: Container(
//                                             decoration: BoxDecoration(
//                                               gradient: LinearGradient(
//                                                 begin: Alignment.topCenter,
//                                                 end: Alignment.bottomCenter,
//                                                 colors: [
//                                                   Colors.black.withValues(alpha: 0.5),
//                                                   Colors.black.withValues(alpha: 0.7),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ),

//                                         Positioned(
//                                           bottom: 12,
//                                           right: 12,
//                                           left: 12,

//                                           child: Column(
//                                             crossAxisAlignment: CrossAxisAlignment.start,

//                                             children: [
//                                               Text(
//                                                 model.title ?? "No Title",
//                                                 style: TextStyle(
//                                                   color: Color(0xFFFFFCFC),
//                                                   fontSize: 14,
//                                                   fontWeight: FontWeight.w700,
//                                                 ),
//                                                 maxLines: 2,
//                                               ),
//                                               SizedBox(height: 6),
//                                               Row(
//                                                 children: [
//                                                   Expanded(
//                                                     child: Row(
//                                                       children: [
//                                                         CircleAvatar(
//                                                           backgroundImage: NetworkImage(model.urlToImage.toString()),
//                                                           radius: 10,
//                                                         ),
//                                                         SizedBox(width: 4),
//                                                         Expanded(
//                                                           child: Text(
//                                                             model.author ?? "",
//                                                             style: TextStyle(
//                                                               fontSize: 12,
//                                                               fontWeight: FontWeight.w400,
//                                                               color: Color(0XFFFFFCFC),
//                                                             ),
//                                                             maxLines: 1,
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   Text(
//                                                     model.publishedAt.formatDateTime(),
//                                                     style: TextStyle(
//                                                       fontSize: 14,
//                                                       fontWeight: FontWeight.w400,
//                                                       color: Color(0xFFFFFCFC),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             );
//                         }
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
