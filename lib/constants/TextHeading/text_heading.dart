import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextHeading(String TextHeading) {
  return Text(
    TextHeading,
    style: TextStyle(
        fontFamily: App_Fonts_Constants.Philosopher,
        fontSize: App_Fonts_Constants.heading_font_size.sp,
        color: App_Constants_Colors.app_black_color,
        letterSpacing: 2,
        wordSpacing: 2),
  );
}
