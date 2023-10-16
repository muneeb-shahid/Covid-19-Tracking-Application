import 'package:covid_19_trackingapp/Reuseable%20Components/Responsive_Height,Width/responsive.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/ReusbaleRow/ReusbaleRow.dart';
import 'package:covid_19_trackingapp/constants/TextHeading/text_heading.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/controller/FullScreenCountriesDetailController/FullScreenCountriesDetailController.dart';
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
    FullScreenCountriesDetailController _fullScreenCountriesDetailController =
        Get.put(FullScreenCountriesDetailController());
    return Scaffold(
      backgroundColor: App_Constants_Colors.app_background_color,
      appBar: AppBar(
          backgroundColor: App_Constants_Colors.app_green_color,
          elevation: 0,
          title: TextHeading(
              data["country"], App_Constants_Colors.app_white_color)),
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
                              App_Constants_Colors.app_black_color,
                              data["country"],
                              App_Constants_Colors.app_blue_color),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          ReusbaleRow(
                              "Population".toString(),
                              App_Constants_Colors.app_black_color,
                              data["population"].toString(),
                              App_Constants_Colors.app_purple_color),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          ReusbaleRow(
                              "Cases".toString(),
                              App_Constants_Colors.app_black_color,
                              data["cases"].toString(),
                              App_Constants_Colors.app_blue_color),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          ReusbaleRow(
                              "Today Cases".toString(),
                              App_Constants_Colors.app_black_color,
                              data["todayCases"].toString(),
                              App_Constants_Colors.app_purple_color),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          ReusbaleRow(
                              "Deaths".toString(),
                              App_Constants_Colors.app_black_color,
                              data["deaths"].toString(),
                              App_Constants_Colors.app_red_color),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          ReusbaleRow(
                              "Recovered".toString(),
                              App_Constants_Colors.app_black_color,
                              data["recovered"].toString(),
                              App_Constants_Colors.app_green_color),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          ReusbaleRow(
                              "Active".toString(),
                              App_Constants_Colors.app_black_color,
                              data["active"].toString(),
                              App_Constants_Colors.app_red_color),
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
                              _fullScreenCountriesDetailController.colorList,
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
