import 'package:covid_19_trackingapp/Images/images.dart';
import 'package:covid_19_trackingapp/model/Onboarding_screen_model/Onboarding_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreenController extends GetxController {
  PageController pagecontroller = PageController();
  var selectedPageIndex = 0.obs;
  bool get isFirstPage => selectedPageIndex.value == 0;
  bool get isLastPage => selectedPageIndex.value == onboardingData.length - 1;

  List<OnBoardingScreenModel> onboardingData = [
    OnBoardingScreenModel(
        image: App_Images.onBoarding_Screen_Pic1,
        title: "Wear a Mask",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Volutpat felis sit eget euismod et vulputate."),
    OnBoardingScreenModel(
        image: App_Images.onBoarding_Screen_Pic2,
        title: "Hand Wash & Sanitize",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Volutpat felis sit eget euismod et vulputate."),
    OnBoardingScreenModel(
        image: App_Images.onBoarding_Screen_Pic3,
        title: "Pyshical Distancing",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Volutpat felis sit eget euismod et vulputate."),
  ];
  @override
  void dispose() {
    // TODO: implement dispose
    pagecontroller;
    super.dispose();
  }
}
