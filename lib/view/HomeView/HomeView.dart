import 'package:covid_19_trackingapp/Images/images.dart';
import 'package:covid_19_trackingapp/Responsive_Height,Width/responsive.dart';
import 'package:covid_19_trackingapp/constants/TextHeading/text_heading.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: App_Constants_Colors.app_background_color,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: App_Constants_Colors.app_green_color,
      ),
      drawer: Drawer(
          backgroundColor: App_Constants_Colors.app_green_color,
          child: ListView(
            children: [
              Image.asset(
                App_Images.Drawer_logo,
                height: screenHeight * 0.3,
              ),
              ListTile(
                  title: Center(
                      child: Text(
                "Corono Virus",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: App_Fonts_Constants.Poppins,
                    fontSize: App_Fonts_Constants.heading_font_size.sp,
                    color: App_Constants_Colors.app_white_color,
                    letterSpacing: 5,
                    wordSpacing: 5),
              ))),
              Divider(
                color: App_Constants_Colors.app_white_color,
                thickness: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.home_outlined,
                  color: App_Constants_Colors.app_white_color,
                ),
                title: TextHeading(
                  "Home",
                  App_Constants_Colors.app_white_color,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.analytics_outlined,
                  color: App_Constants_Colors.app_white_color,
                ),
                title: TextHeading(
                  "Statistics",
                  App_Constants_Colors.app_white_color,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.add_to_photos_outlined,
                  color: App_Constants_Colors.app_white_color,
                ),
                title: TextHeading(
                  "Symptoms",
                  App_Constants_Colors.app_white_color,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.help_outline_outlined,
                  color: App_Constants_Colors.app_white_color,
                ),
                title: TextHeading(
                  "Help",
                  App_Constants_Colors.app_white_color,
                ),
              ),
            ],
          )),
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              color: App_Constants_Colors.app_green_color,
            ),
          ),
        ],
      ),
    );
  }
}
