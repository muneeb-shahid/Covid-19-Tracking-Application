import 'package:covid_19_trackingapp/Images/images.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:covid_19_trackingapp/constants/text_heading/text_heading.dart';
import 'package:covid_19_trackingapp/reuseable_components/custom_button/login_and_signup_button.dart';
import 'package:covid_19_trackingapp/view/articles/articles_view.dart';
import 'package:covid_19_trackingapp/view/help/help_view.dart';
import 'package:covid_19_trackingapp/view/home_view/home_view.dart';
import 'package:covid_19_trackingapp/view/statistics/statistics_view.dart';
import 'package:covid_19_trackingapp/view/symptoms/symptoms_view.dart';
import 'package:covid_19_trackingapp/view/write_articles/write_articles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

reUseableDrawer() {
  return Stack(
    children: [
      Drawer(
          backgroundColor: AppConstantsColors.appGreenColor,
          child: ListView(
            children: [
              SizedBox(
                height: screenHeight * 0.04,
              ),
              Image.asset(
                App_Images.Drawer_logo,
                height: screenHeight * 0.2,
              ),
              ListTile(
                  title: Center(
                      child: Text(
                "Corono Virus",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: AppFontsConstants.poppins,
                    fontSize: AppFontsConstants.headingFontSize.sp,
                    color: AppConstantsColors.appWhiteColor,
                    letterSpacing: 5,
                    wordSpacing: 5),
              ))),
              Divider(
                color: AppConstantsColors.appWhiteColor,
                thickness: 1,
              ),
              GestureDetector(
                onTap: () {
                  if (true == false) {
                  } else {
                    Get.off(const HomeView());
                  }
                  Get.back();
                },
                child: ListTile(
                  leading: Icon(
                    Icons.home_outlined,
                    color: AppConstantsColors.appWhiteColor,
                  ),
                  title: textHeading(
                    "Home",
                    AppConstantsColors.appWhiteColor,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (true == false) {
                  } else {
                    Get.off(const StatisticsView());
                  }
                  Get.back();
                },
                child: ListTile(
                  leading: Icon(
                    Icons.analytics_outlined,
                    color: AppConstantsColors.appWhiteColor,
                  ),
                  title: textHeading(
                    "Statistics",
                    AppConstantsColors.appWhiteColor,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (true == false) {
                  } else {
                    Get.off(const SymptomsView());
                  }
                  Get.back();
                },
                child: ListTile(
                  leading: Icon(
                    Icons.add_to_photos_outlined,
                    color: AppConstantsColors.appWhiteColor,
                  ),
                  title: textHeading(
                    "Symptoms",
                    AppConstantsColors.appWhiteColor,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (true == false) {
                  } else {
                    Get.off(const ArticlesView());
                  }
                  Get.back();
                },
                child: ListTile(
                  leading: Icon(
                    Icons.article_outlined,
                    color: AppConstantsColors.appWhiteColor,
                  ),
                  title: textHeading(
                    "Articles",
                    AppConstantsColors.appWhiteColor,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (true == false) {
                  } else {
                    Get.off(const WriteArticles());
                  }
                  Get.back();
                },
                child: ListTile(
                  leading: Icon(
                    Icons.create,
                    color: AppConstantsColors.appWhiteColor,
                  ),
                  title: textHeading(
                    "Write an Articles",
                    AppConstantsColors.appWhiteColor,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (true == false) {
                  } else {
                    Get.off(const HelpView());
                  }
                  Get.back();
                },
                child: ListTile(
                  leading: Icon(
                    Icons.help_outline_outlined,
                    color: AppConstantsColors.appWhiteColor,
                  ),
                  title: textHeading(
                    "Help",
                    AppConstantsColors.appWhiteColor,
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Positioned(
                child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: screenHeight * 0.2,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(200),
                            topRight: Radius.circular(200)),
                        color: AppConstantsColors.appBlackColor,
                      ),
                      child: Icon(
                        Icons.close_rounded,
                        size: 60,
                        color: AppConstantsColors.appWhiteColor,
                      ),
                    )),
              ),
            ],
          )),
    ],
  );
}
