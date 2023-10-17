import 'package:covid_19_trackingapp/Images/images.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/ReUseable%20Drawer/ReUseableDrawer.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/Responsive_Height,Width/responsive.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/ReuseableHelpCard/ReuseableHelpCard.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:flutter/material.dart';
import '../../constants/TextHeading/text_heading.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextHeading("Help", App_Constants_Colors.app_white_color),
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
