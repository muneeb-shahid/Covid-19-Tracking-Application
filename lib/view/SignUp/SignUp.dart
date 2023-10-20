import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:covid_19_trackingapp/controller/EmailPasswordValidationController/EmailPasswordValidationController.dart';
import 'package:covid_19_trackingapp/view/Login/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Reuseable Components/CustomButton/Login&signupButton.dart';
import '../../controller/SignUpController/SignUpController.dart';

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
              Column(children: [
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
                  height: heightt * 0.02,
                ),
                Center(
                  child: Text(
                    "Let’s help you meet your tasks",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: App_Fonts_Constants.Philosopher,
                        fontWeight: FontWeight.bold,
                        color: App_Constants_Colors.app_grey_color,
                        fontSize: App_Fonts_Constants.text_font_size.sp),
                  ),
                ),
                SizedBox(
                  height: heightt * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Obx(
                    () => Form(
                        key:signUpController.formKey,
                        child: Column(
                          children: [
                            // Name TextFormField
                            TextFormField(
                              controller: signUpController
                                  .NameTextEditingController,
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
                                    Icon(Icons.person_2, color: Colors.black),
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
                ),
                SizedBox(
                  height: heightt * 0.05,
                ),
                customLogin_SignupButton(
                    func: () => signUpController.register(),
                    innerColor: App_Constants_Colors.app_pink_color,
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
                        Get.offAll(() => LoginPage());
                      },
                      child: FittedBox(
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: App_Constants_Colors.app_black_color,
                            fontSize: App_Fonts_Constants.text_font_size.sp,
                            fontFamily:
                                App_Fonts_Constants.Philosopher,
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
    );
  }
}