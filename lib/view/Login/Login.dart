import 'package:covid_19_trackingapp/Images/images.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/CustomButton/CustomButton.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/CustomButton/Login&signupButton.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/ReUseable%20Drawer/ReUseableDrawer.dart';
import 'package:covid_19_trackingapp/constants/TextHeading/text_heading.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:covid_19_trackingapp/controller/EmailPasswordValidationController/EmailPasswordValidationController.dart';
import 'package:covid_19_trackingapp/controller/LoginController/LoginController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  EmailPasswordValidation _emailPasswordValidation =
      Get.put(EmailPasswordValidation());
  LoginController _loginController = Get.put(LoginController());
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
                Form(
                  key: _loginController.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        controller:
                            _loginController.EmailTextEditingController.clear(),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        validator: _emailPasswordValidation.validateEmail,
                        onChanged: (value) {
                          _loginController.email = value;
                        },
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: App_Constants_Colors.app_black_color,
                            )),
                            prefixIcon: const Icon(Icons.email),
                            prefixIconColor:
                                App_Constants_Colors.app_black_color,
                            hintText: 'Email',
                            hintStyle: TextStyle()),
                      ),

                      SizedBox(
                        height: heightt * 0.04,
                      ),
                      Obx(
                        // Use Obx to observe the _isObscured variable
                        () => TextFormField(
                          controller: _loginController
                              .PasswordTextEditingController.clear(),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          validator: _emailPasswordValidation.validatePassword,

                          onChanged: (value) {
                            _loginController.password = value;
                          },
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: App_Constants_Colors.app_black_color,
                            )),
                            prefixIcon: const Icon(Icons.password),
                            prefixIconColor:
                                App_Constants_Colors.app_black_color,
                            suffixIconColor:
                                App_Constants_Colors.app_black_color,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _loginController
                                    .toggleObscure(); // Call the _toggleObscure method
                              },
                              child: Icon(
                                _loginController.isObscured.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            hintText: 'Password',
                          ),
                          obscureText: _loginController
                              .isObscured.value, // Use the value from the Obx
                        ),
                      ),
                      SizedBox(
                        height: heightt * 0.04,
                      ),

                      // customButton(
                      //     innerColor: App_Constants_Colors.app_black_color,
                      //     textColor: App_Constants_Colors.app_white_color,
                      //     text: "Login",
                      //     func: () => _loginController.onLogin()),
                      customLogin_SignupButton(
                          innerColor: App_Constants_Colors.app_green_color,
                          textColor: App_Constants_Colors.app_white_color,
                          text: "Login",
                          func: () => _loginController.onLogin()),
                      SizedBox(
                        height: heightt * 0.02,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
