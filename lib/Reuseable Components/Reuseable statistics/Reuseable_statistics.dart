import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:covid_19_trackingapp/model/WorldStatesModel/WorldStatesModel.dart';
import 'package:covid_19_trackingapp/services/StatesServices/StatesServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

StatesServices _statesServices = Get.put(StatesServices());
Widget Reuseable_statistics(statistics_numbers, text, image) {
  return 

  FutureBuilder(
    future: _statesServices.fetchWorldStatesRecord(),
    builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
      if (!snapshot.hasData) {
        return const Column(
          children: [
            CircularProgressIndicator(
              value: 0.7,
              color: Colors.greenAccent, //<-- SEE HERE
              backgroundColor: Colors.grey, //<-- SEE HERE
            ),
          ],
        );
      } else {
        return Card(
          child: ListTile(
              title: Text(
                statistics_numbers,
                style: TextStyle(
                  fontSize: App_Fonts_Constants.sub_heading_font_size.sp,
                  fontFamily: App_Fonts_Constants.Inter,
                  color: App_Constants_Colors.app_black_color,
                  letterSpacing: 3,
                ),
              ),
              subtitle: Text(
                text,
                style: TextStyle(
                  fontSize: App_Fonts_Constants.sub_heading_font_size.sp,
                  fontFamily: App_Fonts_Constants.Inter,
                  color: App_Constants_Colors.app_black_color,
                  letterSpacing: 3,
                ),
              ),
              trailing: Image.asset(image)),
        );
      }
    },
  );

}
