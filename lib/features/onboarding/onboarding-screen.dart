import 'package:flutter/material.dart';
import 'package:news/features/onboarding/controller/onboarding-controller.dart';
import 'package:news/features/onboarding/model/onboarding-model.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Onboardingcontroller(),
      builder: (context, child) {
        final controller = context.read<Onboardingcontroller>();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFf5f5f5),
            actions: [
              Consumer<Onboardingcontroller>(
                builder: (context, Onboardingcontroller value, child) {
                  return value.isLastpage
                      ? SizedBox()
                      : TextButton(
                          onPressed: () {},
                          child: Text(
                            "Skip",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
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
                          SizedBox(height: 24),
                          Text(
                            model.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff4E4B66),
                            ),
                          ),
                          SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              model.description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff6E7191),
                              ),
                            ),
                          ),
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
                SizedBox(height: 113),
                Consumer<Onboardingcontroller>(
                  builder: (context, Onboardingcontroller value, child) {
                    return ElevatedButton(
                      onPressed: () {
                        controller.pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Text(value.isLastpage ? 'Get Started' : "Next"),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(MediaQuery.of(context).size.width, 52),
                      ),
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





// import 'package:flutter/material.dart';
// import 'package:news/features/onboarding/controller/onboarding-controller.dart';
// import 'package:news/features/onboarding/model/onboarding-model.dart';
// import 'package:provider/provider.dart';

// class OnboardingScreen extends StatelessWidget {
//   OnboardingScreen({super.key});


//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => Onboardingcontroller(),
//       builder: (context, child) {
//         final controller= context.read<Onboardingcontroller>();
//         return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(0xFFf5f5f5),
        
//           actions: [
//            //هناعلشان أحذف الskipمن أخر صفحة//
//         //  if(currentIndex!=2)
//             Consumer<Onboardingcontroller>(
//               builder: (context,Onboardingcontroller value, child) {
//              return  value.isLastpage?SizedBox(): TextButton(
//                         onPressed: () {},
//                         child: Text(
//                           "Skip",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//               );
//               }
//             ),
      
//           ],
//         ),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 16),
//           child: Column(
//             children: [
//               Expanded(
//                 child: PageView.builder(
//                   controller: controller.pageController,
//                   onPageChanged: (index) {
//                     context.read<Onboardingcontroller>().onPageChanged(index);
//                     //Provider.of<Onboardingcontroller>(context,listen: false).onPageChanged(index);
                
//                   },
                  
                 
//                   itemCount: OnboardingModel.onboardingList.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     final OnboardingModel model = OnboardingModel.onboardingList[index];
//                     return Column(
//                       children: [
                      
//                         Image.asset(model.Image),
//                         SizedBox(height: 24),
//                         Text(
//                           model.title,
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w700,
//                             color: Color(0xff4E4B66),
//                           ),
//                         ),
//                         SizedBox(height: 12),
//                         Padding(
//                           padding: const EdgeInsets.all(16),
//                           child: Text(
//                             model.description,
//                             textAlign: TextAlign.center,
                    
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w400,
//                               color: Color(0xff6E7191),
//                             ),
//                           ),
//                         ),
                      
                      
//                       ],
//                     );
//                   },
//                 ),
//               ),
           
//           Consumer<Onboardingcontroller>(
//             builder: (context, Onboardingcontroller  value, child) {
//               return Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//               width: 16,
//               height: 16,
//               decoration: BoxDecoration(
//                 color: Color(0xFFC53030),
//                 shape: BoxShape.circle
//               ),
//              ),
//              SizedBox(width:5 ,),
//                    Container(
//               width: 16,
//               height: 16,
//               decoration: BoxDecoration(
//                 color: Color(0xFFD3D3D3),
//                 shape: BoxShape.circle
//               ),
//              ),
//             SizedBox(width:5),
            
//                  Container(
//               width: 16,
//               height: 16,
//               decoration: BoxDecoration(
//                 color: Color(0xFFD3D3D3),
//                 shape: BoxShape.circle
//               ),
//              ),
            
//               ],
//               );
//             ),
//             }
//           ),
//             },
//           //   child: Row(
//           //     mainAxisAlignment: MainAxisAlignment.center,
//           //     children: [
//           //       Container(
//           //     width: 16,
//           //     height: 16,
//           //     decoration: BoxDecoration(
//           //       color: Color(0xFFC53030),
//           //       shape: BoxShape.circle
//           //     ),
//           //    ),
//           //    SizedBox(width:5 ,),
//           //          Container(
//           //     width: 16,
//           //     height: 16,
//           //     decoration: BoxDecoration(
//           //       color: Color(0xFFD3D3D3),
//           //       shape: BoxShape.circle
//           //     ),
//           //    ),
//           //               SizedBox(width:5 ,),
            
//           //        Container(
//           //     width: 16,
//           //     height: 16,
//           //     decoration: BoxDecoration(
//           //       color: Color(0xFFD3D3D3),
//           //       shape: BoxShape.circle
//           //     ),
//           //    ),
            
//           //     ],
//           //   ),
//           // ),
//            SizedBox(
//             height: 113,
//            ),
           
//                Consumer<Onboardingcontroller>(
//                             builder: (context,  Onboardingcontroller value, child) {
//                               return  ElevatedButton(
//                               onPressed: () {
//                               controller.pageController.nextPage(
//                                   duration: Duration(milliseconds: 300),
//                                   curve: Curves.easeInOut,
//                                 );
//                               },
//                               child: Text(  value.isLastpage?'Get Started' : "Next"),
//                               style: ElevatedButton.styleFrom(
//                                 fixedSize: Size(MediaQuery.of(context).size.width, 52),
//                               ),
//                             );
                              
//                             },
                          
//                           ),
//             ],
//           ),
//         ),
//       );
//       }
//     );
//   }
// }

      
