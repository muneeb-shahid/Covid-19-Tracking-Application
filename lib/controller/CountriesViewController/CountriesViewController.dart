import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CountriesViewController extends GetxController {
  TextEditingController _searchController = TextEditingController();

  get searchController => _searchController;

  FocusNode focusnode1 = FocusNode();
  RxString searchText = ''.obs;

  UpdateonChanged(value) {
    _searchController.value = value;
  }

  @override
  void onInit() {
    UpdateonChanged;
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    focusnode1;
    searchController;
    super.dispose();
  }
}
