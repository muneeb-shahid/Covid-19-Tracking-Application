import 'package:covid_19_trackingapp/Images/images.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/ReUseable%20Drawer/ReUseableDrawer.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/ReuseableHelpSymtomps/ReuseableHelpSymtomps.dart';
import 'package:covid_19_trackingapp/constants/TextHeading/text_heading.dart';
import 'package:flutter/material.dart';

import '../../Reuseable Components/Responsive_Height,Width/responsive.dart';
import '../../constants/colors_constants/colors_constants.dart';

class SymptomsView extends StatelessWidget {
  const SymptomsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextHeading("Symptoms", App_Constants_Colors.app_white_color),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        backgroundColor: App_Constants_Colors.app_green_color,
      ),
      drawer: ReUseable_Drawer(),
      body: Padding(
        padding:  EdgeInsets.only(left: screenWidth*0.05,right:  screenWidth*0.05,),
        child: SingleChildScrollView(
          child: Column(
            children: [
               SizedBox(
                height: screenHeight * 0.03,
              ),
              Image.asset(App_Images.symtomps),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ReuseableHelpSymtomps(App_Images.fever, "Sneezing"),
                  ReuseableHelpSymtomps(App_Images.DryCough, "Dry Cough"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ReuseableHelpSymtomps(App_Images.Sneezing, "Fever"),
                  ReuseableHelpSymtomps(App_Images.vomit, "Vomit"),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
