import 'package:covid_19_trackingapp/constants/text_heading/text_heading.dart';
import 'package:covid_19_trackingapp/reuseable_components/custom_button/login_and_signup_button.dart';
import 'package:flutter/material.dart';

Widget ReusbaleRow(text, color, num, color1) {
  return Padding(
    padding:  EdgeInsets.only(left: screenWidth*0.04,right: screenWidth*0.04),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textHeading(text, color),
        textHeading(num, color1),
      ],
    ),
  );
}
