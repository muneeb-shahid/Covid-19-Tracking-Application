import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/text_heading/text_heading.dart';
import 'package:covid_19_trackingapp/controller/full_screen_countries_detail_controller/full_screen_countries_detail_controller.dart';
import 'package:covid_19_trackingapp/reuseable_components/responsive_height_and_width/responsive.dart';
import 'package:covid_19_trackingapp/reuseable_components/reusbale_row/reusbale_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

class FullScreenCountriesDetail extends StatelessWidget {
  dynamic data;

  FullScreenCountriesDetail({
    super.key,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    FullScreenCountriesDetailController fullScreenCountriesDetailController =
        Get.put(FullScreenCountriesDetailController());
    return Scaffold(
      backgroundColor: AppConstantsColors.appBackgroundColor,
      appBar: AppBar(
          backgroundColor: AppConstantsColors.appGreenColor,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          title: textHeading(
              data["country"], AppConstantsColors.appWhiteColor)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.03,
            right: screenWidth * 0.03,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: screenHeight * 1,
                  ),
                  Positioned(
                    top: screenHeight * 0.07,
                    height: screenHeight * 0.5,
                    width: screenWidth * 1,
                    child: Card(
                      shadowColor: Colors.white,
                      elevation: 10,
                      color: Colors.grey.shade300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: screenHeight * 0.05,
                          ),
                          ReusbaleRow(
                              "Country Name",
                              AppConstantsColors.appBlackColor,
                              data["country"],
                              AppConstantsColors.appBlueColor),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          ReusbaleRow(
                              "Population".toString(),
                              AppConstantsColors.appBlackColor,
                              data["population"].toString(),
                              AppConstantsColors.appPurpleColor),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          ReusbaleRow(
                              "Cases".toString(),
                              AppConstantsColors.appBlackColor,
                              data["cases"].toString(),
                              AppConstantsColors.appBlueColor),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          ReusbaleRow(
                              "Today Cases".toString(),
                              AppConstantsColors.appBlackColor,
                              data["todayCases"].toString(),
                              AppConstantsColors.appPurpleColor),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          ReusbaleRow(
                              "Deaths".toString(),
                              AppConstantsColors.appBlackColor,
                              data["deaths"].toString(),
                              AppConstantsColors.appRedColor),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          ReusbaleRow(
                              "Recovered".toString(),
                              AppConstantsColors.appBlackColor,
                              data["recovered"].toString(),
                              AppConstantsColors.appGreenColor),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          ReusbaleRow(
                              "Active".toString(),
                              AppConstantsColors.appBlackColor,
                              data["active"].toString(),
                              AppConstantsColors.appRedColor),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    child: CircleAvatar(
                      radius: screenHeight * 0.07,
                      backgroundImage: NetworkImage(
                        data["countryInfo"]["flag"],
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.58,
                    child: Card(
                      shadowColor: Colors.white,
                      color: Colors.grey.shade300,
                      elevation: 10,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: screenWidth * 0.2,
                          right: screenWidth * 0.1,
                          top: screenHeight * 0.05,
                          bottom: screenHeight * 0.05,
                        ),
                        child: PieChart(
                          dataMap: {
                            "Cases": double.parse(data["cases"].toString()),
                            "Deaths": double.parse(data["deaths"].toString()),
                            "Recovered":
                                double.parse(data["recovered"].toString()),
                            "Active": double.parse(data["active"].toString()),
                          },
                          animationDuration: const Duration(milliseconds: 1500),
                          chartRadius: MediaQuery.of(context).size.width / 3.2,
                          colorList:
                              fullScreenCountriesDetailController.colorList,
                          chartType: ChartType.ring,
                          ringStrokeWidth: 15,
                          centerText: data["country"],
                          legendOptions: const LegendOptions(
                            legendPosition: LegendPosition.right,
                            legendShape: BoxShape.circle,
                            legendTextStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true,
                            showChartValuesOutside: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
