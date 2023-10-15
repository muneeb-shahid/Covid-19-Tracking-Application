import 'package:covid_19_trackingapp/Reuseable%20Components/Responsive_Height,Width/responsive.dart';
import 'package:covid_19_trackingapp/constants/TextHeading/text_heading.dart';
import 'package:covid_19_trackingapp/constants/TextParagraph/TextParagraph.dart';
import 'package:flutter/material.dart';

Widget ReusbaleRow(text, color, num, color1) {
  return Padding(
    padding:  EdgeInsets.only(left: screenWidth*0.03,right: screenWidth*0.03),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextHeading(text, color),
        TextHeading(num, color1),
      ],
    ),
  );
}
