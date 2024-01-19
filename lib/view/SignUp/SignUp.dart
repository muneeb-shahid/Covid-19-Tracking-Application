import 'package:covid_19_trackingapp/Images/images.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/text_heading/text_heading.dart';
import 'package:covid_19_trackingapp/controller/email_and_password_validation/email_and_password_validation.dart';
import 'package:covid_19_trackingapp/controller/signup_controller/signup_controller.dart';
import 'package:covid_19_trackingapp/reuseable_components/custom_button/login_and_signup_button.dart';
import 'package:covid_19_trackingapp/reuseable_components/reuseable_drawer/reuseable_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
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
      backgroundColor: AppConstantsColors.appBackgroundColor,
      appBar: AppBar(
        title: textHeading(
            "Register your account", AppConstantsColors.appWhiteColor),
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
                                  color: AppConstantsColors.appBlackColor),
                              validator: signUpController.validateName,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppConstantsColors.appWhiteColor,
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
                              controller: signUpController.password,
                              focusNode: signUpController.focusNode3,
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
                    height: heightt * 0.05,
                  ),
                  customLoginSignupButton(
                      func: () => signUpController.register(),
                      innerColor: AppConstantsColors.appGreenColor,
                      textColor: AppConstantsColors.appWhiteColor,
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
                            color: AppConstantsColors.appBlackColor,
                            fontSize: AppFontsConstants.textFontSize.sp,
                            fontFamily: AppFontsConstants.philosopher,
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
