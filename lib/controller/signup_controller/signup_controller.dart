import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/view/home_view/home_view.dart';
import 'package:covid_19_trackingapp/view/Login/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var isObscured = true.obs;
  final bool _isEmailVerified = false;
  get isEmailVerified => _isEmailVerified;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  get formKey => _formKey;
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  get NameTextEditingController => _nameTextEditingController;

  final TextEditingController _emailTextEditingController =
      TextEditingController();
  get emailAddress => _emailTextEditingController;

  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  get password => _passwordTextEditingController;

  final FocusNode _focusNode1 = FocusNode();
  get focusNode1 => _focusNode1;
  final FocusNode _focusNode2 = FocusNode();
  get focusNode2 => _focusNode2;

  final FocusNode _focusNode3 = FocusNode();
  get focusNode3 => _focusNode3;

  void toggleObscure() {
    isObscured.toggle(); // Toggle the value of _isObscured
  }

  String? validateName(String? input) {
    if (input == null || input.isEmpty) {
      return 'User name is required.';
    }

    return null;
  }

  register() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress.text,
          password: password.text,
        );
        _nameTextEditingController.clear();
        _emailTextEditingController.clear();
        _passwordTextEditingController.clear();

        Get.to(()=>HomeView());

      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          Get.snackbar(
            'Account Already Exists. ', //Snackbar title
            'Please Login!', // Snackbar message
            icon: const Icon(Icons.error_outline, color: Colors.black),
            backgroundColor: AppConstantsColors.appWhiteColor,
            colorText: Colors.black,
            snackPosition: SnackPosition.TOP,
            duration: const Duration(
                seconds: 3), // Duration for which the Snackbar is shown
          );
          Get.to(const Login());
        }
      } catch (e) {
        print(e);
        Get.snackbar(
          'Error!', //Snackbar title
          e.toString(), // Snackbar message
          icon: const Icon(Icons.error_outline, color: Colors.black),
          backgroundColor: AppConstantsColors.appWhiteColor,
          colorText: Colors.black,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(
              seconds: 3), // Duration for which the Snackbar is shown
        );
      }
    }
  }

  @override
  void dispose() {
    _nameTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();

    super.dispose();
  }
}
