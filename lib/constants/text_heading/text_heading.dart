import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

textHeading(String TextHeading, color) {
  return Text(
    TextHeading,
    style: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: AppFontsConstants.poppins,
        fontSize: AppFontsConstants.subHeadingFontSize.sp,
        color: color,
        letterSpacing: 2,
        wordSpacing: 2),
  );
}
