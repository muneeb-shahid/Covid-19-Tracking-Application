import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

textParagraph(
  String TextParagraph,
  color,
) {
  return Text(
    TextParagraph,
    style: TextStyle(
        fontFamily: AppFontsConstants.inter,
        fontSize: AppFontsConstants.textFontSize.sp,
        color: color,
        letterSpacing: 2,
        wordSpacing: 2),
  );
}
