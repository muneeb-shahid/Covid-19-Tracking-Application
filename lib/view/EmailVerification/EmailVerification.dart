import 'package:covid_19_trackingapp/Reuseable%20Components/CustomButton/Login&signupButton.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:covid_19_trackingapp/view/CreateBlog/CreateBlog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import '../../Controller/EmailVerificationController/EmailVerificationController.dart';
import '../../images/images.dart';


class EmailVerification extends StatelessWidget {
  EmailVerification({super.key});

  EmailVerificationController emailVerificationController =
      Get.put(EmailVerificationController());
  var user = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) => emailVerificationController
          .isEmailVerified
      ? CreateBlog()
      : Scaffold(
          backgroundColor: App_Constants_Colors.app_background_color,
          body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          child: Text(
                            'A verification email has been sent to \n\n${user}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily:
                                    App_Fonts_Constants.Philosopher,
                                fontWeight: FontWeight.bold,
                                color: App_Constants_Colors.app_grey_color,
                                fontSize:
                                    App_Fonts_Constants.text_font_size.sp),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: emailVerificationController.screenHeight * 0.05,
                    ),
                   
                    SizedBox(
                      height: emailVerificationController.screenHeight * 0.05,
                    ),
                    customLogin_SignupButton(
                        func: () => emailVerificationController
                            .sendEmailVerificationCode(),
                      innerColor:App_Constants_Colors.app_pink_color,
                        textColor: App_Constants_Colors.app_white_color,
                        text: "Resend Email"),
                    SizedBox(
                      height: emailVerificationController.screenHeight * 0.05,
                    ),
                    customLogin_SignupButton(
                        func: () => emailVerificationController.signOut(),
                        innerColor: App_Constants_Colors.app_grey_color,
                        textColor: App_Constants_Colors.app_white_color,
                        text: "Cancel"),
                  ],
                ),
              )), 
        );
}
