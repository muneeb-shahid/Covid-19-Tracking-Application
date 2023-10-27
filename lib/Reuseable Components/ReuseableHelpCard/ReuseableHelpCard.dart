import 'package:covid_19_trackingapp/constants/TextParagraph/TextParagraph.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:flutter/material.dart';

import '../../constants/TextHeading/text_heading.dart';

Widget ReuseableHelpCard(icon, headingtext, description) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    elevation: 10,
    shadowColor: Colors.white,
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: App_Constants_Colors.app_green_color,
        child: Icon(icon,color: App_Constants_Colors.app_white_color,)
      ),
      title: TextHeading(headingtext, App_Constants_Colors.app_black_color),
      subtitle: TextParagraph(
          description,
          App_Constants_Colors.app_grey_color),
    ),
  );
}
