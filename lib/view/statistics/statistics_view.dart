import 'package:covid_19_trackingapp/constants/text_heading/text_heading.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:covid_19_trackingapp/reuseable_components/custom_button/login_and_signup_button.dart';
import 'package:covid_19_trackingapp/reuseable_components/reuseable_drawer/reuseable_drawer.dart';
import 'package:covid_19_trackingapp/view/statistics/Countries/Countries.dart';
import 'package:covid_19_trackingapp/view/statistics/Total/Total.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/statistics_View_controller/statistics_View_controller.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    StatisticsViewController statisticsViewController =
        Get.put(StatisticsViewController());
    return DefaultTabController(
        length: statisticsViewController.tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title:
                textHeading("Statistics", AppConstantsColors.appWhiteColor),
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            backgroundColor: AppConstantsColors.appGreenColor,
            bottom: TabBar(
              indicatorPadding: EdgeInsets.only(
                  left: screenWidth * 0.1, right: screenWidth * 0.1),
              indicatorWeight: 3,
              labelStyle: TextStyle(
                  fontSize: AppFontsConstants.subHeadingFontSize.sp,
                  fontFamily: AppFontsConstants.poppins,
                  fontWeight: FontWeight.bold,
                  color: AppConstantsColors.appWhiteColor),
              indicatorColor: AppConstantsColors.appWhiteColor,
              tabs: statisticsViewController.tabs,
            ),
          ),
          drawer: reUseableDrawer(),
          body: const TabBarView(
            children: [
              TotalView(),
              CountriesView(),
            ],
          ),
        ));
  }
}
