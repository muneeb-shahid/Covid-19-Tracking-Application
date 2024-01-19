import 'package:covid_19_trackingapp/Images/images.dart';
import 'package:covid_19_trackingapp/constants/text_heading/text_heading.dart';
import 'package:covid_19_trackingapp/reuseable_components/custom_button/login_and_signup_button.dart';
import 'package:covid_19_trackingapp/reuseable_components/reuseable_drawer/reuseable_drawer.dart';
import 'package:covid_19_trackingapp/reuseable_components/reuseable_help_symtomps/reuseable_help_symtomps.dart';
import 'package:flutter/material.dart';
import '../../constants/colors_constants/colors_constants.dart';

class SymptomsView extends StatelessWidget {
  const SymptomsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textHeading("Symptoms", AppConstantsColors.appWhiteColor),
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
        padding: EdgeInsets.only(
          left: screenWidth * 0.05,
          right: screenWidth * 0.05,
        ),
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
                  reuseableHelpSymtomps(App_Images.fever, "Sneezing"),
                  reuseableHelpSymtomps(App_Images.DryCough, "Dry Cough"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  reuseableHelpSymtomps(App_Images.Sneezing, "Fever"),
                  reuseableHelpSymtomps(App_Images.vomit, "Vomit"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
