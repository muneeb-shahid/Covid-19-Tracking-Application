import 'package:covid_19_trackingapp/Reuseable%20Components/Responsive_Height,Width/responsive.dart';
import 'package:covid_19_trackingapp/constants/TextHeading/text_heading.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:flutter/material.dart';

Widget ReuseableHelpSymtomps(image, headingtext) {
  return Container(
    height: screenHeight * 0.3,
    width: screenWidth * 0.4,
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      shadowColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: screenHeight * 0.15,
                width: screenWidth * 0.3,
              ),
            ],
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextHeading(headingtext, App_Constants_Colors.app_black_color),
            ],
          ),
        ],
      ),
    ),
  );
}
