import 'package:covid_19_trackingapp/Images/images.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/ReuseablePrevention/ReuseablePrevention.dart';
import 'package:covid_19_trackingapp/view/BlogFullPost/BlogFullPost.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:covid_19_trackingapp/constants/TextHeading/text_heading.dart';
import 'package:covid_19_trackingapp/constants/TextParagraph/TextParagraph.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/CustomButton/Login&signupButton.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/ReUseable%20Drawer/ReUseableDrawer.dart';
import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.ref("Article");

    var mediaQueryData = Get.mediaQuery;

    double screenHeight = mediaQueryData.size.height * 1;
    double screenWidth = mediaQueryData.size.width * 1;
    return Scaffold(
      backgroundColor: App_Constants_Colors.app_background_color,
      appBar: AppBar(
        title: TextHeading("Home", App_Constants_Colors.app_white_color),
        elevation: 0,
        backgroundColor: App_Constants_Colors.app_green_color,
      ),
      drawer: ReUseable_Drawer(),
      body: SingleChildScrollView(
        child: Column(
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
                  TextHeading(
                      "Prevention", App_Constants_Colors.app_black_color),
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
                              list_PreventionModel:
                                  list_PreventionModel[index]);
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          width: screenWidth * 0.05,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
                  TextHeading("Article", App_Constants_Colors.app_black_color),
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
                  height: screenHeight * 0.4,
                  // width: screenWidth * 0.8,
                  child: Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.05,
                          right: screenWidth * 0.05,
                          top: screenHeight * 0.02),
                      child: StreamBuilder(
                        stream: ref.onValue,
                        builder:
                            (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                          try {
                            Map<dynamic, dynamic> map =
                                snapshot.data?.snapshot.value as dynamic;
                            List<dynamic> list = [];
                            list.clear();
                            list = map.values.toList();
                            return ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  snapshot.data!.snapshot.children.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  width: screenWidth * 0.8,
                                  height: screenHeight * 0.6,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(BlogFullPost(
                                        blogData: list[index],
                                      ));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Card(
                                        color: App_Constants_Colors
                                            .app_white_color_70,
                                        child: Column(
                                          children: [
                                            Image.network(
                                              fit: BoxFit.cover,
                                              width: screenWidth * 0.8,
                                              height: screenHeight * 0.2,
                                              list[index]["image"].toString(),
                                            ),
                                            SizedBox(
                                              height: screenHeight * 0.02,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: screenWidth * 0.05,
                                                right: screenWidth * 0.05,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    list[index]["title"]
                                                        .toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: true,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        letterSpacing: 2,
                                                        wordSpacing: 2,
                                                        color:
                                                            App_Constants_Colors
                                                                .app_black_color,
                                                        fontFamily:
                                                            App_Fonts_Constants
                                                                .Philosopher,
                                                        fontSize: 16.sp),
                                                  ),
                                                  SizedBox(
                                                    height: screenHeight * 0.02,
                                                  ),
                                                  Text(
                                                    list[index]["content"]
                                                        .toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: true,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        color:
                                                            App_Constants_Colors
                                                                .app_black_color,
                                                        fontFamily:
                                                            App_Fonts_Constants
                                                                .Poppins,
                                                        fontSize: 13.sp),
                                                  ),
                                                  SizedBox(
                                                    height: screenHeight * 0.02,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          } catch (e) {
                            Center(
                              child: Lottie.asset(
                                App_Images.loading,
                                repeat: true,
                                width: screenWidth * 0.2,
                                height: screenHeight * 0.2,
                              ),
                            );
                          }
                          return Container(
                            child: Center(
                              child: Lottie.asset(
                                App_Images.loading,
                                repeat: true,
                                width: screenWidth * 0.2,
                                height: screenHeight * 0.2,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
