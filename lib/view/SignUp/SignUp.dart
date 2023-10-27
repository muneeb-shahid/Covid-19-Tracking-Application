import 'package:covid_19_trackingapp/Images/images.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/CustomButton/Login&signupButton.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/ReUseable%20Drawer/ReUseableDrawer.dart';
import 'package:covid_19_trackingapp/constants/TextHeading/text_heading.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/controller/EmailPasswordValidationController/EmailPasswordValidationController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../Controller/SignUpController/SignUpController.dart';
import '../../constants/fonts_size_constant/fonts_size_constant.dart';
import '../login/login.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController signUpController = Get.put(SignUpController());
    EmailPasswordValidation emailPasswordValidation =
        Get.put(EmailPasswordValidation());

    var heightt = MediaQuery.of(context).size.height * 1;
    var widthh = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      backgroundColor: App_Constants_Colors.app_background_color,
      appBar: AppBar(
        title: TextHeading(
            "Register your account", App_Constants_Colors.app_white_color),
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
            ),
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
                      "Welcome onBoard!",
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
                      repeat: true, reverse: true),
                  SizedBox(
                    height: heightt * 0.05,
                  ),
                  Obx(
                    () => Form(
                        key: signUpController.formKey,
                        child: Column(
                          children: [
                            // Name TextFormField
                            TextFormField(
                              controller:
                                  signUpController.NameTextEditingController,
                              keyboardType: TextInputType.name,
                              focusNode: signUpController.focusNode1,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(signUpController.focusNode2);
                              },
                              style: TextStyle(
                                  color: App_Constants_Colors.app_black_color),
                              validator: signUpController.validateName,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: App_Constants_Colors.app_white_color,
                                hintText: 'Enter your full name',
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.black,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        width: 2, color: Colors.black)),
                                prefixIcon: const Icon(Icons.person_2,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              height: heightt * 0.05,
                            ),
                            // Email TextFormField
                            TextFormField(
                              controller: signUpController.emailAddress,
                              focusNode: signUpController.focusNode2,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(signUpController.focusNode3);
                              },
                              keyboardType: TextInputType.name,
                              style: TextStyle(
                                  color: App_Constants_Colors.app_black_color),
                              validator: emailPasswordValidation.validateEmail,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: App_Constants_Colors.app_white_color,
                                hintText: 'Enter your email',
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.black,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        width: 2, color: Colors.black)),
                                prefixIcon: const Icon(Icons.email,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              height: heightt * 0.05,
                            ),

                            // Password TextFormField
                            TextFormField(
                              obscureText: signUpController.isObscured.value,
                              controller: signUpController.password,
                              focusNode: signUpController.focusNode3,
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
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.black,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        width: 2, color: Colors.black)),
                                prefixIcon: const Icon(Icons.password,
                                    color: Colors.black),
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
                    height: heightt * 0.05,
                  ),
                  customLogin_SignupButton(
                      func: () => signUpController.register(),
                      innerColor: App_Constants_Colors.app_green_color,
                      textColor: App_Constants_Colors.app_white_color,
                      text: "Register")
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
                          "Already have an account?",
                          style: TextStyle(
                            color: App_Constants_Colors.app_black_color,
                            fontSize: App_Fonts_Constants.text_font_size.sp,
                            fontFamily: App_Fonts_Constants.Philosopher,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offAll(() => const Login());
                        },
                        child: FittedBox(
                          child: Text(
                            "Log In",
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
