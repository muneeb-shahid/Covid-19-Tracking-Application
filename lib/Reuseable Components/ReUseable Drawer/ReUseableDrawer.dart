import 'package:covid_19_trackingapp/Images/images.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/Responsive_Height,Width/responsive.dart';
import 'package:covid_19_trackingapp/constants/TextHeading/text_heading.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:covid_19_trackingapp/view/Articles/ArticlesView.dart';
import 'package:covid_19_trackingapp/view/Help/HelpView.dart';
import 'package:covid_19_trackingapp/view/HomeView/HomeView.dart';
import 'package:covid_19_trackingapp/view/Statistics/StatisticsView.dart';
import 'package:covid_19_trackingapp/view/Symptoms/SymptomsView.dart';
import 'package:covid_19_trackingapp/view/WriteArticles/WriteArticles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

ReUseable_Drawer() {
  return Drawer(
      backgroundColor: App_Constants_Colors.app_green_color,
      child: ListView(
        children: [
          SizedBox(height: screenHeight*0.04,)
,          Image.asset(
            App_Images.Drawer_logo,
            height: screenHeight * 0.2,
          ),
          ListTile(
              title: Center(
                  child: Text(
            "Corono Virus",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: App_Fonts_Constants.Poppins,
                fontSize: App_Fonts_Constants.heading_font_size.sp,
                color: App_Constants_Colors.app_white_color,
                letterSpacing: 5,
                wordSpacing: 5),
          ))),
          Divider(
            color: App_Constants_Colors.app_white_color,
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
                color: App_Constants_Colors.app_white_color,
              ),
              title: TextHeading(
                "Home",
                App_Constants_Colors.app_white_color,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Get.off(const StatisticsView()),
            child: ListTile(
              leading: Icon(
                Icons.analytics_outlined,
                color: App_Constants_Colors.app_white_color,
              ),
              title: TextHeading(
                "Statistics",
                App_Constants_Colors.app_white_color,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Get.off(const SymptomsView()),
            child: ListTile(
              leading: Icon(
                Icons.add_to_photos_outlined,
                color: App_Constants_Colors.app_white_color,
              ),
              title: TextHeading(
                "Symptoms",
                App_Constants_Colors.app_white_color,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Get.off(const ArticlesView()),
            child: ListTile(
              leading: Icon(
                Icons.article_outlined,
                color: App_Constants_Colors.app_white_color,
              ),
              title: TextHeading(
                "Articles",
                App_Constants_Colors.app_white_color,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Get.off(const WriteArticles()),
            child: ListTile(
              leading: Icon(
                Icons.create,
                color: App_Constants_Colors.app_white_color,
              ),
              title: TextHeading(
                "Write an Articles",
                App_Constants_Colors.app_white_color,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Get.off(const HelpView()),
            child: ListTile(
              leading: Icon(
                Icons.help_outline_outlined,
                color: App_Constants_Colors.app_white_color,
              ),
              title: TextHeading(
                "Help",
                App_Constants_Colors.app_white_color,
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                height: screenHeight*0.2,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(200),
                        topRight: Radius.circular(200)),
                    color: App_Constants_Colors.app_black_color),
                child: Icon(
                  Icons.close_rounded,
                  size: 60,
                  color: App_Constants_Colors.app_white_color,
                ),
              )),
             
        ],
      ));
}
