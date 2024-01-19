import 'package:covid_19_trackingapp/Images/images.dart';
import 'package:covid_19_trackingapp/reuseable_components/custom_button/custom_button.dart';
import 'package:covid_19_trackingapp/reuseable_components/reuseable_drawer/reuseable_drawer.dart';
import 'package:covid_19_trackingapp/reuseable_components/responsive_height_and_width/responsive.dart';
import 'package:covid_19_trackingapp/constants/TextHeading/text_heading.dart';
import 'package:covid_19_trackingapp/constants/text_paragraph/text_paragraph.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:covid_19_trackingapp/view/Login/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class WriteArticles extends StatelessWidget {
  const WriteArticles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextHeading(
            "Write an Article", AppConstantsColors.app_white_color),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        backgroundColor: AppConstantsColors.app_green_color,
      ),
      drawer: ReUseable_Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Lottie.asset(
                App_Images.writeBlog,
                repeat: true,
              ),
              SizedBox(
                height: screenHeight * 0.07,
              ),
              Text.rich(
                TextSpan(
                  text: 'Article are ',
                  style: TextStyle(
                      color: AppConstantsColors.app_black_color,
                      fontSize: App_Fonts_Constants.heading_font_size.sp,
                      fontFamily: App_Fonts_Constants.Philosopher,
                      wordSpacing: 1,
                      letterSpacing: 0.5),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'published',
                        style: TextStyle(
                            fontSize: App_Fonts_Constants.heading_font_size.sp,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            decoration: TextDecoration.underline,
                            color: AppConstantsColors.appRedColor,
                            fontFamily: App_Fonts_Constants.Philosopher)),
                    TextSpan(
                      text: ' by only ',
                      style: TextStyle(
                          color: AppConstantsColors.app_black_color,
                          fontSize: App_Fonts_Constants.heading_font_size.sp,
                          fontFamily: App_Fonts_Constants.Philosopher,
                          wordSpacing: 1,
                          letterSpacing: 0.5),
                    ),
                    TextSpan(
                        text: 'Authorized Person',
                        style: TextStyle(
                            fontSize: App_Fonts_Constants.heading_font_size.sp,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            decoration: TextDecoration.underline,
                            color: AppConstantsColors.appRedColor,
                            fontFamily: App_Fonts_Constants.Philosopher)),
                  ],
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  backgroundColor: Color.fromARGB(255, 236, 238, 240),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.05,
                ),
                child: textParagraph(
                  "Please Login to your account for Write an Article",
                  AppConstantsColors.appGreyColor,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              customButton(
                  nextscreen: const Login(),
                  innerColor: AppConstantsColors.app_green_color,
                  textColor: AppConstantsColors.app_white_color,
                  text: "Go to Login Page")
            ],
          ),
        ),
      ),
    );
  }
}
