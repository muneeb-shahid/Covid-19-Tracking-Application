import 'package:covid_19_trackingapp/Reuseable%20Components/CustomButton/Login&signupButton.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/ReUseable%20Drawer/ReUseableDrawer.dart';
import 'package:covid_19_trackingapp/constants/TextHeading/text_heading.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/controller/EmailPasswordValidationController/EmailPasswordValidationController.dart';
import 'package:covid_19_trackingapp/controller/EmailVerificationController/EmailVerificationController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../Controller/LoginController/LoginController.dart';
import '../../Controller/SignUpController/SignUpController.dart';
import '../../constants/fonts_size_constant/fonts_size_constant.dart';
import '../../images/images.dart';
import '../forgetpassword/forgetpassword.dart';
import '../signUp/signUp.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());

    EmailPasswordValidation emailPasswordValidation =
        Get.put(EmailPasswordValidation());
    SignUpController signUpController = Get.put(SignUpController());

    var heightt = MediaQuery.of(context).size.height * 1;
    var widthh = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      backgroundColor: App_Constants_Colors.app_background_color,
      appBar: AppBar(
        title: TextHeading(
            "Login to your account", App_Constants_Colors.app_white_color),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        backgroundColor: App_Constants_Colors.app_green_color,
      ),
      drawer: ReUseable_Drawer(),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(children: [
                  SizedBox(
                    height: heightt * 0.05,
                  ),
                  Center(
                    child: Text(
                      "Welcome Back!",
                      style: TextStyle(
                          fontFamily: App_Fonts_Constants.Philosopher,
                          fontWeight: FontWeight.bold,
                          color: App_Constants_Colors.app_black_color,
                          fontSize: App_Fonts_Constants.heading_font_size.sp),
                    ),
                  ),
                  SizedBox(
                    height: heightt * 0.05,
                  ),
                  Lottie.asset(App_Images.login_signup,
                      repeat: true, reverse: true
                      ),
                  SizedBox(
                    height: heightt * 0.05,
                  ),
                  Obx(
                    () => Form(
                        key: loginController.formKey,
                        child: Column(
                          children: [
                            // Email TextFormField

                            TextFormField(
                              controller: loginController.login_emailAddress,
                              focusNode: loginController.focusNode1,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(loginController.focusNode2);
                              },
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                  color: App_Constants_Colors.app_black_color),
                              validator: emailPasswordValidation.validateEmail,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: App_Constants_Colors.app_white_color,
                                hintText: 'Enter your email',
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:const BorderSide(
                                    width: 2,
                                    color: Colors.black,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:const BorderSide(
                                        width: 2, color: Colors.black)),
                                prefixIcon:
                                  const  Icon(Icons.email, color: Colors.black),
                              ),
                            ),

                            SizedBox(
                              height: heightt * 0.05,
                            ),

                            // Password TextFormField
                            TextFormField(
                              obscureText: signUpController.isObscured.value,
                              controller: loginController.login_password,
                              focusNode: loginController.focusNode2,
                              style: TextStyle(
                                  color: App_Constants_Colors.app_black_color),
                              validator:
                                  emailPasswordValidation.validatePassword,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: App_Constants_Colors.app_white_color,
                                hintText: 'Enter your password',
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:const BorderSide(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:const BorderSide(
                                        width: 2, color: Colors.white)),
                                prefixIcon:
                                    Icon(Icons.password, color: Colors.black),
                                suffixIconColor:
                                    App_Constants_Colors.app_black_color,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    signUpController
                                        .toggleObscure(); // Call the _toggleObscure method
                                  },
                                  child: Icon(
                                    signUpController.isObscured.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
               
                 
                  SizedBox(
                    height: heightt * 0.07,
                  ),
                  customLogin_SignupButton(
                      func: () => loginController.login(),
                      innerColor: App_Constants_Colors.app_green_color,
                      textColor: App_Constants_Colors.app_white_color,
                      text: "Login")
                ]),
                SizedBox(
                  height: heightt * 0.02,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Text(
                          "Don’t have an account ?",
                          style: TextStyle(
                            color: App_Constants_Colors.app_black_color,
                            fontSize: App_Fonts_Constants.text_font_size.sp,
                            fontFamily: App_Fonts_Constants.Philosopher,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offAll(() => SignUp());
                        },
                        child: FittedBox(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: App_Constants_Colors.app_black_color,
                              fontSize: App_Fonts_Constants.text_font_size.sp,
                              fontFamily: App_Fonts_Constants.Philosopher,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
