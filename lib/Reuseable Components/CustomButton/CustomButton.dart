import 'package:covid_19_trackingapp/Reuseable%20Components/Responsive_Height,Width/responsive.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


Widget customButton(
    {required nextScreen,
    required var innerColor,
    required var textColor,
    required String text}) {
  return Column(children: <Widget>[
    MaterialButton(
      minWidth: screenWidth * 0.8,
      height: screenHeight * 0.06,
      onPressed: () {
        Get.off(nextScreen);
      },
      color: innerColor,
      shape: RoundedRectangleBorder(
          side:
              BorderSide(color: App_Constants_Colors.app_black_color, width: 2),
          borderRadius: BorderRadius.circular(20)),
      child: FittedBox(
        child: Text(
          text,
          style: TextStyle(
              color: textColor,
              fontSize: App_Fonts_Constants.sub_heading_font_size.sp,
              fontFamily: App_Fonts_Constants.Philosopher,
              wordSpacing: 1,
              letterSpacing: 1),
        ),
      ),
    ),
  ]);
}