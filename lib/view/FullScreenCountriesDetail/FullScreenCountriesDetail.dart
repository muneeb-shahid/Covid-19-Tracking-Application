import 'package:covid_19_trackingapp/Reuseable%20Components/Responsive_Height,Width/responsive.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/ReusbaleRow/ReusbaleRow.dart';
import 'package:covid_19_trackingapp/constants/TextHeading/text_heading.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:flutter/material.dart';

class FullScreenCountriesDetail extends StatelessWidget {
  dynamic data;

  FullScreenCountriesDetail({
    super.key,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: App_Constants_Colors.app_background_color,
      appBar: AppBar(
          backgroundColor: App_Constants_Colors.app_green_color,
          elevation: 0,
          title: TextHeading(
              data["country"], App_Constants_Colors.app_white_color)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: screenHeight * 0.8,
              ),
              Positioned(
                top: 50,
                height: screenHeight * 0.5,
                width: screenWidth * 1,
                child: Card(
                  elevation: 0,
                  color: Colors.grey.shade300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.1,
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
            ],
          ),
        ],
      ),
    );
  }
}
