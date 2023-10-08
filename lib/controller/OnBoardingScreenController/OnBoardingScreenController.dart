import 'package:covid_19_trackingapp/Images/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreenController extends GetxController {
  List onboardingData = [
    {
      'image': App_Images.onBoarding_Screen_Pic1,
      "title": "Wear a Mask",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Volutpat felis sit eget euismod et vulputate.",
    },
    {
      'image': App_Images.onBoarding_Screen_Pic2,
      "title": "Hand Wash & Sanitize",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Volutpat felis sit eget euismod et vulputate.",
    },
    {
      'image': App_Images.onBoarding_Screen_Pic3,
      "title": "Pyshical Distancing",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Volutpat felis sit eget euismod et vulputate.",
    },
  ];

  PageController pageController = PageController();
  RxInt currentPage = 0.obs;

  onChanged(int index) {
    currentPage.value = index;
  }
}
