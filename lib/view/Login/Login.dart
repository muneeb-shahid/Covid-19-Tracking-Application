import 'package:covid_19_trackingapp/Images/images.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/CustomButton/Login&signupButton.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/ReUseable%20Drawer/ReUseableDrawer.dart';
import 'package:covid_19_trackingapp/constants/TextHeading/text_heading.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:covid_19_trackingapp/controller/EmailPasswordValidationController/EmailPasswordValidationController.dart';
import 'package:covid_19_trackingapp/controller/LoginController/LoginController.dart';
import 'package:covid_19_trackingapp/view/SignUp/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  EmailPasswordValidation emailPasswordValidation =
      Get.put(EmailPasswordValidation());
  LoginController _loginController = Get.put(LoginController());
  LoginController loginController = Get.put(LoginController());
  // SignUpController _signUpController = Get.put(SignUpController());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var heightt = MediaQuery.of(context).size.height * 1;
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
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: heightt * 0.05,
                ),
                FittedBox(
                  child: Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'W',
                            style: TextStyle(
                              fontSize:
                                  App_Fonts_Constants.heading_font_size.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: App_Fonts_Constants.Philosopher,
                            )),
                        TextSpan(
                          text: 'elcome',
                          style: TextStyle(
                              // color: App_Constants_Colors.app_black_color,
                              color: Colors.black,
                              fontSize:
                                  App_Fonts_Constants.heading_font_size.sp,
                              fontFamily: App_Fonts_Constants.Philosopher,
                              wordSpacing: 1,
                              letterSpacing: 2),
                        ),
                        TextSpan(
                            text: ' B',
                            style: TextStyle(
                              fontSize:
                                  App_Fonts_Constants.heading_font_size.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: App_Fonts_Constants.Philosopher,
                            )),
                        TextSpan(
                          text: 'ack',
                          style: TextStyle(
                              // color: App_Constants_Colors.app_black_color,
                              color: Colors.black,
                              fontSize:
                                  App_Fonts_Constants.heading_font_size.sp,
                              fontFamily: App_Fonts_Constants.Philosopher,
                              wordSpacing: 1,
                              letterSpacing: 2),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: heightt * 0.05,
                ),
                Lottie.asset(
                  App_Images.login_signup,
                  repeat: true,
                  reverse: false,
                  animate: true,
                ),
                SizedBox(
                  height: heightt * 0.05,
                ),
                Obx(
                  () => Form(
                      key: loginController.login_formKey,
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
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.black,
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
                            height: heightt * 0.03,
                          ),

                          // Password TextFormField
                          TextFormField(
                            obscureText: loginController.isObscured.value,
                            controller: loginController.login_password,
                            focusNode: loginController.focusNode2,
                            style: TextStyle(
                                color: App_Constants_Colors.app_black_color),
                            validator: emailPasswordValidation.validatePassword,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: App_Constants_Colors.app_white_color,
                              hintText: 'Enter your password',
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.black,
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
                                  loginController
                                      .toggleObscure(); // Call the _toggleObscure method
                                },
                                child: Icon(
                                  loginController.isObscured.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: heightt * 0.03,
                          ),
                          customLogin_SignupButton(
                              func: () => loginController.login(),
                              innerColor: App_Constants_Colors.app_green_color,
                              textColor: App_Constants_Colors.app_white_color,
                              text: "Login")
                        ],
                      )),
                ),
                SizedBox(
                  height: heightt * 0.05,
                ),
                ElevatedButton(
                    onPressed: () async {
                      Get.to(SignUp());
                    },
                    child: Text("go to signOut"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
