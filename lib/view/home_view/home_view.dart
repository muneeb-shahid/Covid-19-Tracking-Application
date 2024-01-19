import 'package:covid_19_trackingapp/Images/images.dart';
import 'package:covid_19_trackingapp/reuseable_components/reuseable_prevention/reuseable_prevention.dart';
import 'package:covid_19_trackingapp/view/onboarding_screen/onboarding_screen.dart';
import 'package:covid_19_trackingapp/view/blog_full_post/blog_full_post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:covid_19_trackingapp/constants/text_heading/text_heading.dart';
import 'package:covid_19_trackingapp/constants/text_paragraph/text_paragraph.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:covid_19_trackingapp/reuseable_components/custom_button/login_and_signup_button.dart';
import 'package:covid_19_trackingapp/reuseable_components/reuseable_drawer/reuseable_drawer.dart';
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
      backgroundColor: AppConstantsColors.appBackgroundColor,
      appBar: AppBar(
        title: textHeading("Home", AppConstantsColors.appWhiteColor),
        elevation: 0,
        backgroundColor: AppConstantsColors.appGreenColor,
      ),
      drawer: reUseableDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.3,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                color: AppConstantsColors.appGreenColor,
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
                        textHeading(
                          "Covid-19",
                          AppConstantsColors.appWhiteColor,
                        ),
                        SizedBox(
                          height: screenHeight * 0.03,
                        ),
                        textHeading(
                          "Are you feeling sick?",
                          AppConstantsColors.appWhiteColor,
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        textParagraph(
                          "If you feel sick with any of covid-19 symptoms please call or message us immediately for help.",
                          AppConstantsColors.appWhiteColor,
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
                                    color: AppConstantsColors.appRedColor),
                                child: ListTile(
                                  leading: Icon(
                                    Icons.call_outlined,
                                    color: AppConstantsColors.appWhiteColor,
                                  ),
                                  title: textParagraph(
                                    "CALL NOW",
                                    AppConstantsColors.appWhiteColor,
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
                                    color: AppConstantsColors.appBlueColor),
                                child: ListTile(
                                  leading: Icon(
                                    Icons.email_outlined,
                                    color: AppConstantsColors.appWhiteColor,
                                  ),
                                  title: textParagraph(
                                    "SEND SMS",
                                    AppConstantsColors.appWhiteColor,
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
                  textHeading("Prevention", AppConstantsColors.appBlackColor),
                  Icon(
                    Icons.forward_outlined,
                    color: AppConstantsColors.appBlackColor,
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
                  textHeading("Article", AppConstantsColors.appBlackColor),
                  Icon(
                    Icons.forward_outlined,
                    color: AppConstantsColors.appBlackColor,
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
                                        color:
                                            AppConstantsColors.appWhiteColor70,
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
                                                            AppConstantsColors
                                                                .appBlackColor,
                                                        fontFamily:
                                                            AppFontsConstants
                                                                .philosopher,
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
                                                            AppConstantsColors
                                                                .appBlackColor,
                                                        fontFamily:
                                                            AppFontsConstants
                                                                .poppins,
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
