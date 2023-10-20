import 'package:covid_19_trackingapp/Reuseable%20Components/CustomButton/Login&signupButton.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:covid_19_trackingapp/controller/EmailPasswordValidationController/EmailPasswordValidationController.dart';
import 'package:covid_19_trackingapp/controller/ForgetPasswordController/ForgetPasswordController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../images/images.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    EmailPasswordValidation emailPasswordValidation =
        Get.put(EmailPasswordValidation());
    ForgetPasswordController forgetPasswordController =
        Get.put(ForgetPasswordController());
    var heightt = MediaQuery.of(context).size.height * 1;
    var widthh = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      backgroundColor: App_Constants_Colors.app_background_color,
      body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(image: AssetImage("assets/images/shape.png")),
                  ],
                ),
                Padding(
                   padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "Reset Your Password",
                          style: TextStyle(
                              fontFamily:
                                  App_Fonts_Constants.Philosopher,
                              fontWeight: FontWeight.bold,
                              color: App_Constants_Colors.app_black_color,
                              fontSize:
                                  App_Fonts_Constants.heading_font_size.sp),
                        ),
                      ),
                      SizedBox(
                        height: heightt * 0.02,
                      ),
                      Center(
                        child: Text(
                          "Please enter your email address to reset password for your account.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily:
                                  App_Fonts_Constants.Philosopher,
                              fontWeight: FontWeight.bold,
                              color: App_Constants_Colors.app_grey_color,
                              fontSize: App_Fonts_Constants.text_font_size.sp),
                        ),
                      ),
                      SizedBox(
                        height: heightt * 0.05,
                      ),
                     
                      SizedBox(
                        height: heightt * 0.05,
                      ),
                      Form(
                          key: forgetPasswordController.formKey,
                          child: Column(
                            children: [
                              // Email TextFormField
                              TextFormField(
                                controller: forgetPasswordController
                                    .forget_emailAddress,
                                focusNode: forgetPasswordController.focusNode1,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                    color: App_Constants_Colors.app_black_color),
                                validator:
                                    emailPasswordValidation.validateEmail,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: App_Constants_Colors.app_white_color,
                                  hintText:
                                      'Enter your email to reset password',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.white,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.white)),
                                  prefixIcon:
                                      Icon(Icons.email, color: Colors.black),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: heightt * 0.05,
                      ),
                      customLogin_SignupButton(
                          func: () => forgetPasswordController.resetPassword(),
                          innerColor: App_Constants_Colors.app_pink_color,
                          textColor: App_Constants_Colors.app_white_color,
                          text: "Reset Password")
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
