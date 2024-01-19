import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/text_heading/text_heading.dart';
import 'package:covid_19_trackingapp/reuseable_components/custom_button/login_and_signup_button.dart';
import 'package:flutter/material.dart';

Widget reuseableHelpSymtomps(image, headingtext) {
  return SizedBox(
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
              textHeading(headingtext, AppConstantsColors.appBlackColor),
            ],
          ),
        ],
      ),
    ),
  );
}
