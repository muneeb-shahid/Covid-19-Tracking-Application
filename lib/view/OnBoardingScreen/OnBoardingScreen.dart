import 'package:covid_19_trackingapp/Images/images.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/Responsive_Height,Width/responsive.dart';

import 'package:covid_19_trackingapp/constants/TextHeading/text_heading.dart';
import 'package:covid_19_trackingapp/constants/TextParagraph/TextParagraph.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/controller/OnBoardingScreenController/OnBoardingScreenController.dart';
import 'package:covid_19_trackingapp/view/HomeView/HomeView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingScreenController onBoardingScreenController =
        Get.put(OnBoardingScreenController());
    return Scaffold(
      backgroundColor: App_Constants_Colors.app_background_color,
      body: 
      
      
      Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
            child: PageView.builder(
              itemCount: onBoardingScreenController.onboardingData.length,
              controller: onBoardingScreenController.pagecontroller,
              onPageChanged: onBoardingScreenController.selectedPageIndex,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(App_Images.CoronaVirus_logo),
                    SizedBox(height: screenHeight * 0.1),
                    Image.asset( onBoardingScreenController.onboardingData[index].image,
                    
                    height: screenHeight*0.3,),
                    SizedBox(height: screenHeight * 0.1),
                    TextHeading(
                        onBoardingScreenController.onboardingData[index].title,
                        App_Constants_Colors.app_black_color),
                    SizedBox(height: screenHeight * 0.05),
                    TextParagraph(
                      onBoardingScreenController
                          .onboardingData[index].description,
                      App_Constants_Colors.app_black_color,
                    ),
                  ],
                );
              },
            ),
          ),
          Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                (onBoardingScreenController.selectedPageIndex ==
                        (onBoardingScreenController.onboardingData.length - 1))
                    ? Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.07),
                        child: GestureDetector(
                          onTap: () {
                            Get.offAll(const HomeView());
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: screenHeight * 0.02,
                                right: screenHeight * 0.02),
                            child: Container(
                                height: screenHeight * 0.06,
                                width: screenWidth * 0.50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: App_Constants_Colors.app_green_color,
                                ),
                                child: Center(
                                  child: TextHeading(
                                    'Get Started',
                                    App_Constants_Colors.app_white_color,
                                  ),
                                )),
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List<Widget>.generate(
                              onBoardingScreenController.onboardingData.length,
                              (index) {
                            return AnimatedContainer(
                              duration: const Duration(
                                milliseconds: 200,
                              ),
                              height: screenHeight * 0.01,
                              width: (onBoardingScreenController
                                          .selectedPageIndex ==
                                      index)
                                  ? screenWidth * 0.08
                                  : screenWidth * 0.03,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: (onBoardingScreenController
                                            .selectedPageIndex ==
                                        index)
                                    ? App_Constants_Colors.app_green_color
                                    : Colors.grey,
                              ),
                            );
                          }),
                        ),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
