import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/text_heading/text_heading.dart';
import 'package:covid_19_trackingapp/controller/email_and_password_validation/email_and_password_validation.dart';
import 'package:covid_19_trackingapp/controller/login_controller/login_controller.dart';
import 'package:covid_19_trackingapp/controller/signup_controller/signup_controller.dart';
import 'package:covid_19_trackingapp/reuseable_components/custom_button/login_and_signup_button.dart';
import 'package:covid_19_trackingapp/reuseable_components/reuseable_drawer/reuseable_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../constants/fonts_size_constant/fonts_size_constant.dart';
import '../../images/images.dart';
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
      backgroundColor: AppConstantsColors.appBackgroundColor,
      appBar: AppBar(
        title: textHeading(
            "Login to your account", AppConstantsColors.appWhiteColor),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        backgroundColor: AppConstantsColors.appGreenColor,
      ),
      drawer: reUseableDrawer(),
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
                          fontFamily: AppFontsConstants.philosopher,
                          fontWeight: FontWeight.bold,
                          color: AppConstantsColors.appBlackColor,
                          fontSize: AppFontsConstants.headingFontSize.sp),
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
                                  color: AppConstantsColors.appBlackColor),
                              validator: emailPasswordValidation.validateEmail,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppConstantsColors.appWhiteColor,
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
                              controller: loginController.login_password,
                              focusNode: loginController.focusNode2,
                              style: TextStyle(
                                  color: AppConstantsColors.appBlackColor),
                              validator:
                                  emailPasswordValidation.validatePassword,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppConstantsColors.appWhiteColor,
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
                                    AppConstantsColors.appBlackColor,
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
                  customLoginSignupButton(
                      func: () => loginController.login(),
                      innerColor: AppConstantsColors.appGreenColor,
                      textColor: AppConstantsColors.appWhiteColor,
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
                            color: AppConstantsColors.appBlackColor,
                            fontSize: AppFontsConstants.textFontSize.sp,
                            fontFamily: AppFontsConstants.philosopher,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offAll(() => const SignUp());
                        },
                        child: FittedBox(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: AppConstantsColors.appBlackColor,
                              fontSize: AppFontsConstants.textFontSize.sp,
                              fontFamily: AppFontsConstants.philosopher,
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
