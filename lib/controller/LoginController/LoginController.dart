import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/view/CreateBlog/CreateBlog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  get formKey => _formKey;

  bool _loading = false;
  get loading => _loading;

  final TextEditingController _login_EmailTextEditingController =
      TextEditingController();
  get login_emailAddress => _login_EmailTextEditingController;

  final TextEditingController _login_PasswordTextEditingController =
      TextEditingController();
  get login_password => _login_PasswordTextEditingController;

  FocusNode _focusNode1 = FocusNode();
  get focusNode1 => _focusNode1;
  FocusNode _focusNode2 = FocusNode();
  get focusNode2 => _focusNode2;

  login() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: login_emailAddress.text,
          password: login_password.text,
        );
        print('User Successfully login.');
         Get.snackbar(
              'Welcome Back',
              "Successfully login",
              icon: const Icon(Icons.error_outline, color: Colors.black),
              backgroundColor: App_Constants_Colors.app_white_color,
              colorText: Colors.black,
              snackPosition: SnackPosition.TOP,
            );
        Get.offAll(const CreateBlog());
      } on FirebaseAuthException catch (e) {

          if (e.code == 'user-not-found') {
            print('No user found for that email.');
            Get.snackbar(
              'Error',
              "No User Found for that Email",
              icon: const Icon(Icons.error_outline, color: Colors.black),
              backgroundColor: App_Constants_Colors.app_white_color,
              colorText: Colors.black,
              snackPosition: SnackPosition.TOP,
            );
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user.');

            Get.snackbar(
              'Error',
              "Wrong Password Provided by User",
              icon: const Icon(Icons.cancel_outlined, color: Colors.black),
              backgroundColor: App_Constants_Colors.app_white_color,
              colorText: Colors.black,
              snackPosition: SnackPosition.TOP,
            );
          }
          _login_EmailTextEditingController.clear();
          _login_PasswordTextEditingController.clear();

      }
    }
  }

  @override
  void dispose() {
    _login_EmailTextEditingController.dispose();
    _login_PasswordTextEditingController.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();

    super.dispose();
  }
}
