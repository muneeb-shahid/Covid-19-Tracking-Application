import 'package:covid_19_trackingapp/Images/images.dart';
import 'package:covid_19_trackingapp/constants/text_heading/text_heading.dart';
import 'package:covid_19_trackingapp/reuseable_components/custom_button/custom_button.dart';
import 'package:covid_19_trackingapp/reuseable_components/reuseable_drawer/reuseable_drawer.dart';
import 'package:covid_19_trackingapp/reuseable_components/responsive_height_and_width/responsive.dart';
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
        title:
            textHeading("Write an Article", AppConstantsColors.appWhiteColor),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        backgroundColor: AppConstantsColors.appGreenColor,
      ),
      drawer: reUseableDrawer(),
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
                      color: AppConstantsColors.appBlackColor,
                      fontSize: AppFontsConstants.headingFontSize.sp,
                      fontFamily: AppFontsConstants.philosopher,
                      wordSpacing: 1,
                      letterSpacing: 0.5),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'published',
                        style: TextStyle(
                            fontSize: AppFontsConstants.headingFontSize.sp,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            decoration: TextDecoration.underline,
                            color: AppConstantsColors.appRedColor,
                            fontFamily: AppFontsConstants.philosopher)),
                    TextSpan(
                      text: ' by only ',
                      style: TextStyle(
                          color: AppConstantsColors.appBlackColor,
                          fontSize: AppFontsConstants.headingFontSize.sp,
                          fontFamily: AppFontsConstants.philosopher,
                          wordSpacing: 1,
                          letterSpacing: 0.5),
                    ),
                    TextSpan(
                        text: 'Authorized Person',
                        style: TextStyle(
                            fontSize: AppFontsConstants.headingFontSize.sp,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            decoration: TextDecoration.underline,
                            color: AppConstantsColors.appRedColor,
                            fontFamily: AppFontsConstants.philosopher)),
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
                  innerColor: AppConstantsColors.appGreenColor,
                  textColor: AppConstantsColors.appWhiteColor,
                  text: "Go to Login Page")
            ],
          ),
        ),
      ),
    );
  }
}
