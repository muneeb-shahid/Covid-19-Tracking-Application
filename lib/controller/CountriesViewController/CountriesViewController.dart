import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CountriesViewController extends GetxController {
  TextEditingController searchController = TextEditingController();
  FocusNode focusnode1 = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    focusnode1;

    super.dispose();
  }
}
