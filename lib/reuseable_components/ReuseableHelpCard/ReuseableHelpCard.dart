import 'package:covid_19_trackingapp/constants/text_paragraph/text_paragraph.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:flutter/material.dart';

import '../../constants/text_heading/text_heading.dart';

Widget ReuseableHelpCard(icon, headingtext, description) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    elevation: 10,
    shadowColor: Colors.white,
    child: ListTile(
      leading: CircleAvatar(
          backgroundColor: AppConstantsColors.app_green_color,
          child: Icon(
            icon,
            color: AppConstantsColors.appWhiteColor,
          )),
      title: textHeading(headingtext, AppConstantsColors.app_black_color),
      subtitle: textParagraph(description, AppConstantsColors.appGreyColor),
    ),
  );
}
