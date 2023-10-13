import 'package:covid_19_trackingapp/view/Statistics/Countries/Countries.dart';
import 'package:covid_19_trackingapp/view/Statistics/Total/Total.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class StatisticsViewController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // late TabController tabController;
  // final List<Tab> myTabs = <Tab>[

  //   Tab(text: 'Home'),
  //   Tab(text: 'About'),
  // ];

  // @override
  // void onInit() {
  //   super.onInit();
  //   tabController = TabController(vsync: this, length: myTabs.length);
  // }

  // @override
  // void onClose() {
  //   tabController.dispose();
  //   super.onClose();
  // }

  int selectedTabIndex = 0;
  List<Tab> tabs = [
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
