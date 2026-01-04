// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:news/constants/app_sizes.dart';

class ViewAllComponents extends StatelessWidget {
  const ViewAllComponents({
    Key? key,
    required this.title,
     this.titleColor,
     required this.onTap
  }) : super(key: key);
  final String title;
  final Color? titleColor;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return  Padding(
                  padding:  EdgeInsets.symmetric(horizontal: AppSizes.pw16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: AppSizes.sp18, color:titleColor?? Color(0xffFFFCFC), fontWeight: FontWeight.w700),
                      ),
                      InkWell(
                           onTap: () => onTap(),
                        child: Text(
                          "View all",
                        
                          style: TextStyle(
                            fontSize: AppSizes.sp14,
                            color:titleColor??Color(0xffFFFCFC),
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                            decorationColor: titleColor??Color(0xffFFFCFC),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
  }
}
