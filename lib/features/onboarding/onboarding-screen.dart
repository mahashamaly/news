import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news/constants/app_sizes.dart';
import 'package:news/features/core/datasource/local-data/Preferences_manager.dart';
import 'package:news/features/core/theme/light-color.dart';
import 'package:news/features/auth/login-screen.dart';
import 'package:news/features/onboarding/controller/onboarding-controller.dart';
import 'package:news/features/onboarding/model/onboarding-model.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  _onFinish(BuildContext context)async{
    //هنا بدنا نخزن الفيمة قبل ما ننتقل للوجن
  await  PreferencesManager().setBool("onboarding-complete", true);
 Navigator.push(
  context,
     MaterialPageRoute(builder: (context) => LoginScreen()),
        );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Onboardingcontroller(),
      builder: (context, child) {
        final controller = context.read<Onboardingcontroller>();
        return Scaffold(
          appBar: AppBar(
      
            actions: [
              Consumer<Onboardingcontroller>(
                builder: (context, Onboardingcontroller value, child) {
                  return value.isLastpage
                      ? SizedBox()
                      : TextButton(
                          onPressed: () {
                                 _onFinish(context);
                          },
                          child: Text(
                            "Skip",
                            style: TextStyle(
                              fontSize: AppSizes.sp16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                },
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical:AppSizes.ph30 , horizontal: AppSizes.pw16),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: (index) {
                      context
                          .read<Onboardingcontroller>()
                          .onPageChanged(index);
                    },
                    itemCount: OnboardingModel.onboardingList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final OnboardingModel model =
                          OnboardingModel.onboardingList[index];
                      return Column(
                        children: [
                          Image.asset(model.Image),
                          SizedBox(height:AppSizes.ph24),
                          Text(
                            model.title,
                            style: TextStyle(
                              fontSize: AppSizes.sp20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff4E4B66),
                            ),
                          ),
                          SizedBox(height: AppSizes.ph12),
                          Text(
                            model.description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: AppSizes.sp16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff6E7191),
                            ),
                          ),
                          Spacer()
                        ],
                      );
                    },
                  ),
                ),
                Consumer<Onboardingcontroller>(
                  builder: (context, Onboardingcontroller value, child) {
                    return SmoothPageIndicator(    
                    controller: value.pageController,    
                   count:  3,    
                 effect:  SwapEffect(
                  activeDotColor: Color(0xFFC53030),
                 ),    
              onDotClicked: (index){   
               
                }
                   );
                   //طريقة  أخرى بدل استخدام البكج
                    // return Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: List.generate(3, (index)=>Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 3),
                    //     child: Container(
                    //         width: 16,
                    //         height: 16,
                    //         decoration: BoxDecoration(
                    //             color:value.currentIndex==index? Color(0xFFC53030): Color(0xFFD3D3D3), shape: BoxShape.circle),
                    //       ),
                    //   ),
                      
                      
                    //   ),
                     
                    // );
                  },
                ),
                SizedBox(height: AppSizes.ph112),
                Consumer<Onboardingcontroller>(
                  builder: (context, Onboardingcontroller value, child) {
                    return ElevatedButton(
                      onPressed: () {
                        //هنا اذا المستخدم ما وصل للصقحة الأخيرة
                        if(!value.isLastpage){
                          //طريقة للانقال للصفحة التالية بدل ما اعمل نفيكتور
                           controller.pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          //الـ curve يحدد كيف تتسارع الحركة أو تبطئ خلال المدة المحددة.
                          curve: Curves.easeInOut,
                        );
                        //هنا وصل لاخر صفحة
                        }else{
                           _onFinish(context);
                        }
                       
                      },
                      child: Text(value.isLastpage ? 'Get Started' : "Next"),
                      // style: ElevatedButton.styleFrom(
                      //   fixedSize: Size(MediaQuery.of(context).size.width, 52),
                      // ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}





