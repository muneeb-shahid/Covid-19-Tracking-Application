import 'package:covid_19_trackingapp/Images/images.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/text_heading/text_heading.dart';
import 'package:covid_19_trackingapp/reuseable_components/custom_button/login_and_signup_button.dart';
import 'package:covid_19_trackingapp/reuseable_components/reuseable_drawer/reuseable_drawer.dart';
import 'package:covid_19_trackingapp/reuseable_components/reuseable_help_card/reuseable_help_card.dart';
import 'package:flutter/material.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textHeading("Help", AppConstantsColors.appWhiteColor),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        backgroundColor: AppConstantsColors.appGreenColor,
      ),
      drawer: reUseableDrawer(),
      body: Padding(
        padding: EdgeInsets.only(left: screenWidth*0.05,right:  screenWidth*0.05,),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Image.asset(App_Images.help),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              ReuseableHelpCard(Icons.phone, "HotLine",
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam"),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              ReuseableHelpCard(Icons.add_to_photos_outlined, "Doctor",
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam"),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              ReuseableHelpCard(Icons.location_on_outlined, "Hospital",
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam"),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              ReuseableHelpCard(Icons.email_outlined, "Consultation",
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam"),
            ],
          ),
        ),
      ),
    );
  }
}
