import 'package:flutter/material.dart';
import 'package:news/constants/app_sizes.dart';
import 'package:news/features/core/theme/light-color.dart';
import 'package:news/features/home/categories-screen.dart';
import 'package:news/features/home/components/view-all-components.dart';
import 'package:news/features/home/model/home-controller.dart';
import 'package:provider/provider.dart';

class CategoriesList extends StatelessWidget {
  CategoriesList({super.key});

  final List categories = ["business", "entertainment", "general", "health", "science", "sports", "technology"];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Consumer<Homecontroller>(
        builder: (context, controller, child) {
          return  Column(
            children: [
               ViewAllComponents(title: 'Categories', titleColor: Color(0xff141414), onTap: () {
                //"لا تنشئ كنترولر جديد… خذ نفس الكنترولر اللي معي وودّي نفس النسخة لصفحة Categories."
                //value = نفس النسخة الحالية، مش نسخة جديدة.
                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext _){
                 return ChangeNotifierProvider.value(
                  //“هاتلي نفس نسخة Homecontroller اللي موجودة أصلاً فوقي.”
                  value: Provider.of<Homecontroller>(context,listen: false),
                  child: CategoriesScreen());
                }));
               
               }),
              Padding(
              padding:  EdgeInsets.only(left: AppSizes.pw16, bottom: AppSizes.ph16, top: AppSizes.ph16),
              child: SizedBox(
                height: AppSizes.h35,
                child: ListView.separated(
                  itemCount: categories.length,
                  padding: EdgeInsets.only(right: AppSizes.pw16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    bool isSelected=categories[index]== controller.selectedCategory;
                    return  InkWell(
                      onTap: () {
                        controller.updateSelectedCategory(categories[index]);
                      },
                      child: IntrinsicWidth(
                        child: Column(
                          children: [
                            Text(
                             categories[index][0].toUpperCase() + categories[index].substring(1),
                              style: TextStyle(fontSize: AppSizes.sp16, color: Color(0xff363636), fontWeight: FontWeight.w400,
                              //decoration: TextDecoration.underline
                              
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
                    return SizedBox(width: AppSizes.pw12);
                  },
                ),
              ),
                      ),
            ],
          );
        },
      
      ),
    );
  }
}
