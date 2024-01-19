import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:covid_19_trackingapp/reuseable_components/custom_button/login_and_signup_button.dart';
import 'package:covid_19_trackingapp/services/states_services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

StatesServices _statesServices = Get.put(StatesServices());
Widget reuseableStatistics(statisticsNumbers, text, image, subtitlecolor) {
  return Card(
    shadowColor: Colors.white,
    elevation: 10,
    child: ListTile(
        title: Text(
       statisticsNumbers,
          style: TextStyle(
              fontSize: AppFontsConstants.textFontSize.sp,
              fontFamily: AppFontsConstants.inter,
              color: AppConstantsColors.appBlackColor,
              letterSpacing: 3,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
         text,
          style: TextStyle(
            fontSize: AppFontsConstants.textFontSize.sp,
            fontFamily: AppFontsConstants.inter,
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
