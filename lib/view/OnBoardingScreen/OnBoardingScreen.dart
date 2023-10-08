import 'package:covid_19_trackingapp/Images/images.dart';
import 'package:covid_19_trackingapp/Responsive_Height,Width/responsive.dart';
import 'package:covid_19_trackingapp/constants/TextHeading/text_heading.dart';
import 'package:covid_19_trackingapp/controller/OnBoardingScreenController/OnBoardingScreenController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingScreenController onBoardingScreenController =
        Get.put(OnBoardingScreenController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0, left: 30, right: 30),
        child: PageView.builder(
          itemCount: onBoardingScreenController.onboardingData.length,
          controller: onBoardingScreenController.pageController,
          onPageChanged: onBoardingScreenController.onChanged,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Image.asset(App_Images.CoronaVirus_logo),
                SizedBox(height: screenHeight * 0.15),
                Image.asset(App_Images.onBoarding_Screen_Pic1),
                SizedBox(height: screenHeight * 0.15),
                TextHeading(onBoardingScreenController.onboardingData[index]["title"])
                // Text(onBoardingScreenController.onboardingData[index]["title"])
              ],
            );
          },
        ),
      ),
    );
  }
}
