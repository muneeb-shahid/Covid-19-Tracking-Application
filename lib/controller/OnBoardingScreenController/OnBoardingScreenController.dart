import 'package:covid_19_trackingapp/Images/images.dart';
import 'package:covid_19_trackingapp/model/OnBoardingScreenModel/OnBoardingScreenModel.dart';
import 'package:covid_19_trackingapp/view/HomeView/HomeView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class OnBoardingScreenController extends GetxController {
  PageController pagecontroller = PageController();
  var selectedPageIndex = 0.obs;
  bool get isFirstPage => selectedPageIndex.value == 0;
  bool get isLastPage => selectedPageIndex.value == onboardingData.length -1;

  // nextAction() {
  //   if (isLastPage) {
  //     Get.offAll(() => HomeView());
  //   } else {
  //     pagecontroller.nextPage(
  //         duration: Duration(microseconds: 300), curve: Curves.ease);
  //   }
  // }

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

  // List onboardingData = [
  //   {
  //     'image': App_Images.onBoarding_Screen_Pic1,
  //     "title": "Wear a Mask",
  //     "description":
  //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Volutpat felis sit eget euismod et vulputate.",
  //   },
  //   {
  //     'image': App_Images.onBoarding_Screen_Pic2,
  //     "title": "Hand Wash & Sanitize",
  //     "description":
  //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Volutpat felis sit eget euismod et vulputate.",
  //   },
  //   {
  //     'image': App_Images.onBoarding_Screen_Pic3,
  //     "title": "Pyshical Distancing",
  //     "description":
  //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Volutpat felis sit eget euismod et vulputate.",
  //   },
  // ];

  // PageController pageController = PageController();
  // RxInt currentPage = 0.obs;

  // onChanged(int index) {
  //   currentPage.value = index;
  // }

  // bool isGetStartedButtonVisible() {
  //   return currentPage == onboardingData.length - 1;
  // }
}
