import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextHeading(String TextHeading,color) {
  return 
  Text(
    TextHeading,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      
        fontFamily: App_Fonts_Constants.Poppins,
        fontSize: App_Fonts_Constants.sub_heading_font_size.sp,
        color:color,
        letterSpacing: 2,
        
        
        wordSpacing: 2),
  );
}
