import 'package:flutter/material.dart';
import 'package:news/features/core/theme/light-color.dart';
import 'package:news/features/home/model/home-controller.dart';
import 'package:provider/provider.dart';

class TrendingNews extends StatelessWidget {
  const TrendingNews({super.key});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
                        height: 330,
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 240,
                              width: double.infinity,

                              child: Image.asset('assets/img/background.png', fit: BoxFit.cover),
                            ),
                            //.fillبتيجى بالوسط
                            Positioned.fill(
                              top: 70,
                              child: Column(
                                children: [
                                  Text(
                                    "NEWST",
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Lightcolor.primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Trending News",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          "View all",

                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            decoration: TextDecoration.underline,
                                            decorationColor: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 12),

                                  SizedBox(
                                    height: 140,
                                    child: Consumer<Homecontroller>(
                                      builder: (context,Controller , child) {
                                        return  ListView.separated(
                                        itemCount: Controller.newsEverything.length,
                                        scrollDirection: Axis.horizontal,
                                        //هاى بتحل محل البادنح
                                        separatorBuilder: (context, index) {
                                          return SizedBox(width: 12);
                                        },
                                        itemBuilder: (BuildContext context, int index) {
                                          return ClipRRect(
                                            borderRadius: BorderRadius.circular(12),
                                            child: Stack(
                                              children: [
                                                //urlToImage هي nullable (String?) يعني ممكن تكون null إذا الخبر ما عنده صورة.
                                                if (Controller.newsEverything[index].urlToImage != null)
                                                  Image.network(Controller.newsEverything[index].urlToImage!),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                      },
                                      
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
  }
}
