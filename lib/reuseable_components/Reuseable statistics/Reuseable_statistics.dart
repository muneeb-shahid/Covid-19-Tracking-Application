import 'package:covid_19_trackingapp/Reuseable%20Components/Responsive_Height,Width/responsive.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:covid_19_trackingapp/services/StatesServices/StatesServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

StatesServices _statesServices = Get.put(StatesServices());
Widget Reuseable_statistics(statisticsNumbers, text, image, subtitlecolor) {
  return Card(
    shadowColor: Colors.white,
    elevation: 10,
    child: ListTile(
        title: Text(
       statisticsNumbers,
          style: TextStyle(
              fontSize: App_Fonts_Constants.text_font_size.sp,
              fontFamily: App_Fonts_Constants.Inter,
              color: App_Constants_Colors.app_black_color,
              letterSpacing: 3,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
         text,
          style: TextStyle(
            fontSize: App_Fonts_Constants.text_font_size.sp,
            fontFamily: App_Fonts_Constants.Inter,
            color: subtitlecolor,
            letterSpacing: 3,
          ),
        ),
        trailing: Image.asset(
          image,
          height: screenHeight * 0.05,
        )),
  );
}
