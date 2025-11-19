import 'package:flutter/material.dart';

class Onboardingcontroller extends ChangeNotifier{
  
 final PageController pageController = PageController();
    int currentIndex=0;
    //هنا بتعرفنا اذا المستخدم وصل اخر صفحة
    bool isLastpage=false;

void onPageChanged(int index){
  currentIndex=index;
  if(index==2){
    isLastpage=true;
  }
  //علشان ماتظهر الجت ستارت بكل البتون
  else{
    isLastpage=false;
  }
  notifyListeners();

}

}