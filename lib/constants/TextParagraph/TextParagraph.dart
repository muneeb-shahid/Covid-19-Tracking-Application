import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextParagraph(String TextParagraph,color) {
  return Text(
    TextParagraph,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: App_Fonts_Constants.Inter,
        fontSize: App_Fonts_Constants.text_font_size.sp,
        color: color,
        
        letterSpacing: 2,
        
        wordSpacing: 2),
  );
}
