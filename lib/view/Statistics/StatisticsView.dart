import 'package:covid_19_trackingapp/Reuseable%20Components/ReUseable%20Drawer/ReUseableDrawer.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/Responsive_Height,Width/responsive.dart';
import 'package:covid_19_trackingapp/constants/TextHeading/text_heading.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:covid_19_trackingapp/view/Statistics/Countries/Countries.dart';
import 'package:covid_19_trackingapp/view/Statistics/Total/Total.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/StatisticsViewController/StatisticsViewController.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    StatisticsViewController statisticsViewController =
        Get.put(StatisticsViewController());
    return DefaultTabController(
        length: statisticsViewController.tabs.length,
        child: 
        Scaffold(
          appBar: AppBar(
            title:
                TextHeading("Statistics", App_Constants_Colors.app_white_color),
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            backgroundColor: App_Constants_Colors.app_green_color,
            bottom: TabBar(
              indicatorPadding: EdgeInsets.only(
                  left: screenWidth * 0.1, right: screenWidth * 0.1),
              indicatorWeight: 3,
              labelStyle: TextStyle(
                  fontSize: App_Fonts_Constants.sub_heading_font_size.sp,
                  fontFamily: App_Fonts_Constants.Poppins,
                  fontWeight: FontWeight.bold,
                  color: App_Constants_Colors.app_white_color),
              indicatorColor: App_Constants_Colors.app_white_color,
              tabs: statisticsViewController.tabs,
            ),
          ),
          drawer: ReUseable_Drawer(),
          body:const TabBarView(
            children: [
              TotalView(),
              CountriesView(),
            ],
          ),
        ));
  }
}
