import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountriesViewController extends GetxController {
  TextEditingController _searchController = TextEditingController();

  get searchController => _searchController;

  FocusNode focusnode1 = FocusNode();
  RxString searchText = ''.obs;

  void UpdateonChanged(value) {
    searchText.value = value;
    update();
  }

  @override
  void dispose() {
    focusnode1.dispose();
    _searchController.dispose();
    super.dispose();
  }
}
