import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



var mediaQueryData = Get.mediaQuery;

double screenHeight = mediaQueryData.size.height * 1;
double screenWidth = mediaQueryData.size.width * 1;

Widget  customLogin_SignupButton(
    {required func,
    var innerColor,
    required var textColor,
    required String text}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      height: screenHeight * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: innerColor,
      ),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            fontFamily: App_Fonts_Constants.Inter,
            fontSize: App_Fonts_Constants.sub_heading_font_size.sp,
            fontWeight: FontWeight.w700,
            color: textColor),
      )),
    ),
  );
}