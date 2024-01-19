import 'package:covid_19_trackingapp/reuseable_components/responsive_height_and_width/responsive.dart';
import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget customButton(
    {required nextscreen,
    required var innerColor,
    required var textColor,
    required String text}) {
  return Column(children: <Widget>[
    MaterialButton(
      minWidth: screenWidth * 0.8,
      height: screenHeight * 0.06,
      onPressed: () {
        Get.to(nextscreen);
      },
      color: innerColor,
      shape: RoundedRectangleBorder(
        
          borderRadius: BorderRadius.circular(20)),
      child: FittedBox(
        child: Text(
          text,
          style: TextStyle(
              color: textColor,
              fontSize: AppFontsConstants.subHeadingFontSize.sp,
              fontFamily: AppFontsConstants.philosopher,
              wordSpacing: 1,
              letterSpacing: 1),
        ),
      ),
    ),
  ]);
}
