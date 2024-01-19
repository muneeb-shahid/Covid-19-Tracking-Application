import 'package:covid_19_trackingapp/Images/images.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:covid_19_trackingapp/model/world_states_model/world_states_model.dart';
import 'package:covid_19_trackingapp/reuseable_components/reuseable_statistics/Reuseable_statistics.dart';
import 'package:covid_19_trackingapp/services/states_services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:lottie/lottie.dart';
import '../../../controller/total_controller/total_controller.dart';
import '../../../reuseable_components/custom_button/login_and_signup_button.dart';

class TotalView extends StatelessWidget {
  const TotalView({super.key});

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = Get.put(StatesServices());
    TotalController totalController = Get.put(TotalController());
    return Scaffold(
        backgroundColor: AppConstantsColors.appBackgroundColor,
        body: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
          ),
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
                          reuseableStatistics(
                            snapshot.data!.cases.toString(),
                            "Total Cases",
                            App_Images.sad_face,
                            AppConstantsColors.appPurpleColor,
                          ),
                          reuseableStatistics(
                            snapshot.data!.active.toString(),
                            "Active Cases",
                            App_Images.expressionless,
                            AppConstantsColors.appBlueColor,
                          ),
                          reuseableStatistics(
                            snapshot.data!.recovered.toString(),
                            "Recovered Cases",
                            App_Images.smile,
                            AppConstantsColors.appGreenColor,
                          ),
                          reuseableStatistics(
                            snapshot.data!.deaths.toString(),
                            "Deaths Cases",
                            App_Images.crying,
                            AppConstantsColors.appRedColor,
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
                                      fontSize:
                                          AppFontsConstants.headingFontSize.sp,
                                      fontFamily: AppFontsConstants.philosopher,
                                      color: AppConstantsColors.appBlackColor,
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
