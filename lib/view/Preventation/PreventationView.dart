import 'package:covid_19_trackingapp/Reuseable%20Components/ReUseable%20Drawer/ReUseableDrawer.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:flutter/material.dart';

import '../../constants/TextHeading/text_heading.dart';

class PreventationView extends StatelessWidget {
  const PreventationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
            title:
                TextHeading("Preventation", App_Constants_Colors.app_white_color),
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            backgroundColor: App_Constants_Colors.app_green_color,
           
          ),
          drawer: ReUseable_Drawer(),
    );
  }
}
