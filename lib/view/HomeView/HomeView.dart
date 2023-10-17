import 'package:covid_19_trackingapp/Reuseable%20Components/Responsive_Height,Width/responsive.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/ReuseablePrevention/ReuseablePrevention.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:covid_19_trackingapp/constants/TextHeading/text_heading.dart';
import 'package:covid_19_trackingapp/constants/TextParagraph/TextParagraph.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Reuseable Components/ReUseable Drawer/ReUseableDrawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: App_Constants_Colors.app_background_color,
      appBar: AppBar(
        title: TextHeading("Home", App_Constants_Colors.app_white_color),
        elevation: 0,
        backgroundColor: App_Constants_Colors.app_green_color,
      ),
      drawer: ReUseable_Drawer(),
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.3,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              color: App_Constants_Colors.app_green_color,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.05, right: screenWidth * 0.05),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextHeading(
                        "Covid-19",
                        App_Constants_Colors.app_white_color,
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      TextHeading(
                        "Are you feeling sick?",
                        App_Constants_Colors.app_white_color,
                      ),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      TextParagraph(
                        "If you feel sick with any of covid-19 symptoms please call or message us immediately for help.",
                        App_Constants_Colors.app_white_color,
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await FlutterPhoneDirectCaller.callNumber(
                                  "03430276090");
                            },
                            child: Container(
                              width: screenWidth * 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: App_Constants_Colors.app_red_color),
                              child: ListTile(
                                leading: Icon(
                                  Icons.call_outlined,
                                  color: App_Constants_Colors.app_white_color,
                                ),
                                title: TextParagraph(
                                  "CALL NOW",
                                  App_Constants_Colors.app_white_color,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final Uri url = Uri(
                                scheme: 'sms',
                                path: '03430276090',
                              );

                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                if (kDebugMode) {
                                  print("cannot launch this url ");
                                }
                              }
                            },
                            child: Container(
                              width: screenWidth * 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: App_Constants_Colors.app_blue_color),
                              child: ListTile(
                                leading: Icon(
                                  Icons.email_outlined,
                                  color: App_Constants_Colors.app_white_color,
                                ),
                                title: TextParagraph(
                                  "SEND SMS",
                                  App_Constants_Colors.app_white_color,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextHeading("Prevention", App_Constants_Colors.app_black_color),
                Icon(
                  Icons.forward_outlined,
                  color: App_Constants_Colors.app_black_color,
                )
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: screenHeight * 0.25,
                child: Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.05,
                        right: screenWidth * 0.05,
                        top: screenHeight * 0.02),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: list_PreventionModel.length,
                      itemBuilder: (context, index) {
                        return buildPreventionCard(
                            list_PreventionModel: list_PreventionModel[index]);
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        width: screenWidth * 0.05,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
