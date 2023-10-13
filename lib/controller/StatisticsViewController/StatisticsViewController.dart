import 'package:covid_19_trackingapp/view/Statistics/Countries/Countries.dart';
import 'package:covid_19_trackingapp/view/Statistics/Total/Total.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class StatisticsViewController extends GetxController {
  int selectedTabIndex = 0;
  List<Tab> tabs = const [
    Tab(
      text: 'Total',
    ),
    Tab(text: 'Countries'),
  ];

  void changeTab(int index) {
    selectedTabIndex = index;
    update();
  }
}
