import 'package:flutter_sms/flutter_sms.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:covid_19_trackingapp/Images/images.dart';
import 'package:covid_19_trackingapp/Responsive_Height,Width/responsive.dart';
import 'package:covid_19_trackingapp/constants/TextHeading/text_heading.dart';
import 'package:covid_19_trackingapp/constants/TextParagraph/TextParagraph.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:covid_19_trackingapp/view/Articles/ArticlesView.dart';
import 'package:covid_19_trackingapp/view/Help/HelpView.dart';
import 'package:covid_19_trackingapp/view/Preventation/PreventationView.dart';
import 'package:covid_19_trackingapp/view/Statistics/StatisticsView.dart';
import 'package:covid_19_trackingapp/view/Symptoms/SymptomsView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: App_Constants_Colors.app_background_color,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: App_Constants_Colors.app_green_color,
      ),
      drawer: Drawer(
          backgroundColor: App_Constants_Colors.app_green_color,
          child: ListView(
            children: [
              Image.asset(
                App_Images.Drawer_logo,
                height: screenHeight * 0.3,
              ),
              ListTile(
                  title: Center(
                      child: Text(
                "Corono Virus",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: App_Fonts_Constants.Poppins,
                    fontSize: App_Fonts_Constants.heading_font_size.sp,
                    color: App_Constants_Colors.app_white_color,
                    letterSpacing: 5,
                    wordSpacing: 5),
              ))),
              Divider(
                color: App_Constants_Colors.app_white_color,
                thickness: 1,
              ),
              GestureDetector(
                onTap: () => Get.back(),
                child: ListTile(
                  leading: Icon(
                    Icons.home_outlined,
                    color: App_Constants_Colors.app_white_color,
                  ),
                  title: TextHeading(
                    "Home",
                    App_Constants_Colors.app_white_color,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Get.off(const StatisticsView()),
                child: ListTile(
                  leading: Icon(
                    Icons.analytics_outlined,
                    color: App_Constants_Colors.app_white_color,
                  ),
                  title: TextHeading(
                    "Statistics",
                    App_Constants_Colors.app_white_color,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Get.off(const SymptomsView()),
                child: ListTile(
                  leading: Icon(
                    Icons.add_to_photos_outlined,
                    color: App_Constants_Colors.app_white_color,
                  ),
                  title: TextHeading(
                    "Symptoms",
                    App_Constants_Colors.app_white_color,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Get.off(const PreventationView()),
                child: ListTile(
                  leading: Icon(
                    Icons.library_add_check_outlined,
                    color: App_Constants_Colors.app_white_color,
                  ),
                  title: TextHeading(
                    "Preventation",
                    App_Constants_Colors.app_white_color,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Get.off(const ArticlesView()),
                child: ListTile(
                  leading: Icon(
                    Icons.article_outlined,
                    color: App_Constants_Colors.app_white_color,
                  ),
                  title: TextHeading(
                    "Articles",
                    App_Constants_Colors.app_white_color,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Get.off(const HelpView()),
                child: ListTile(
                  leading: Icon(
                    Icons.help_outline_outlined,
                    color: App_Constants_Colors.app_white_color,
                  ),
                  title: TextHeading(
                    "Help",
                    App_Constants_Colors.app_white_color,
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: App_Constants_Colors.app_black_color),
                    child: Icon(
                      Icons.close_rounded,
                      size: 35,
                      color: App_Constants_Colors.app_white_color,
                    ),
                  )),
            ],
          )),
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
                  left: screenWidth * 0.1, right: screenWidth * 0.1),
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
                        height: screenHeight * 0.01,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await FlutterPhoneDirectCaller.callNumber(
                                  "+923430276090");
                            },
                            child: Container(
                              width: screenWidth * 0.5,
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
                              // await FlutterPhoneDirectCaller.callNumber(
                              //     "+923430276090");
                              String message = "This is a test message!";
                              List<String> recipents = [
                                "1234567890",
                                "5556787676"
                              ];

                              String _result = await sendSMS(
                                      message: message,
                                      recipients: recipents,
                                      sendDirect: true)
                                  .catchError((onError) {
                                print(onError);
                              });
                              print(_result);
                            },
                            child: Container(
                              width: screenWidth * 0.5,
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
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
