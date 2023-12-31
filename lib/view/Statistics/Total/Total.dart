import 'package:covid_19_trackingapp/Images/images.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/Responsive_Height,Width/responsive.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/Reuseable%20statistics/Reuseable_statistics.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:covid_19_trackingapp/model/WorldStatesModel/WorldStatesModel.dart';
import 'package:covid_19_trackingapp/services/StatesServices/StatesServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:lottie/lottie.dart';
import '../../../controller/TotalController/TotalController.dart';

class TotalView extends StatelessWidget {
  const TotalView({super.key});

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = Get.put(StatesServices());
    TotalController totalController = Get.put(TotalController());
    return Scaffold(
        backgroundColor: App_Constants_Colors.app_background_color,
        body: Padding(
           padding:  EdgeInsets.only(left: screenWidth*0.05,right:  screenWidth*0.05,),
          child: SingleChildScrollView(
            child: Column(
              children: [
                 SizedBox(
                height: screenHeight * 0.03,
              ),
                FutureBuilder(
                  future: statesServices.fetchWorldStatesRecord(),
                  builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: Lottie.asset(
                          App_Images.loading,
                          repeat: true,
                          width: screenWidth * 0.2,
                          height: screenHeight * 0.2,
                        ),
                      );
                    } else {
                      return Column(
                        children: [
                          Reuseable_statistics(
                            snapshot.data!.cases.toString(),
                            "Total Cases",
                            App_Images.sad_face,
                            App_Constants_Colors.app_purple_color,
                          ),
                          Reuseable_statistics(
                            snapshot.data!.active.toString(),
                            "Active Cases",
                            App_Images.expressionless,
                            App_Constants_Colors.app_blue_color,
                          ),
                          Reuseable_statistics(
                            snapshot.data!.recovered.toString(),
                            "Recovered Cases",
                            App_Images.smile,
                            App_Constants_Colors.app_green_color,
                          ),
                          Reuseable_statistics(
                            snapshot.data!.deaths.toString(),
                            "Deaths Cases",
                            App_Images.crying,
                            App_Constants_Colors.app_red_color,
                          ),
                          Card(
                            shadowColor: Colors.white,
                            elevation: 10,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: screenHeight * 0.02,
                                ),
                                Text(
                                  "Total Statistics",
                                  style: TextStyle(
                                      fontSize: App_Fonts_Constants
                                          .heading_font_size.sp,
                                      fontFamily:
                                          App_Fonts_Constants.Philosopher,
                                      color:
                                          App_Constants_Colors.app_black_color,
                                      letterSpacing: 3,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.05,
                                ),
                                PieChart(
                                  dataMap: {
                                    "Today Cases": double.parse(
                                      snapshot.data!.cases.toString(),
                                    ),
                                    "Active Cases": double.parse(
                                      snapshot.data!.active.toString(),
                                    ),
                                    "Recovered Cases": double.parse(
                                      snapshot.data!.recovered.toString(),
                                    ),
                                    "Deaths Cases": double.parse(
                                      snapshot.data!.deaths.toString(),
                                    ),
                                  },
                                  animationDuration:
                                      const Duration(milliseconds: 1500),
                                  chartRadius:
                                      MediaQuery.of(context).size.width / 3.2,
                                  colorList: totalController.colorList,
                                  chartType: ChartType.ring,
                                  ringStrokeWidth: 15,
                                  centerText: "Corono Virus",
                                  legendOptions: const LegendOptions(
                                    legendPosition: LegendPosition.bottom,
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
                              ],
                            ),
                          )
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
