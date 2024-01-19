import 'package:covid_19_trackingapp/Images/images.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:covid_19_trackingapp/constants/text_heading/text_heading.dart';
import 'package:covid_19_trackingapp/reuseable_components/custom_button/login_and_signup_button.dart';
import 'package:covid_19_trackingapp/reuseable_components/reuseable_drawer/reuseable_drawer.dart';
import 'package:covid_19_trackingapp/view/blog_full_post/blog_full_post.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ArticlesView extends StatelessWidget {
  const ArticlesView({super.key});

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.ref("Article");

    return Scaffold(
      backgroundColor: AppConstantsColors.appBackgroundColor,
      appBar: AppBar(
        title: textHeading("Articles", AppConstantsColors.appWhiteColor),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        backgroundColor: AppConstantsColors.appGreenColor,
      ),
      drawer: reUseableDrawer(),
      body: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.02,
          right: screenWidth * 0.02,
        ),
        child: StreamBuilder(
          stream: ref.onValue,
          builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
            try {
              Map<dynamic, dynamic> map =
                  snapshot.data?.snapshot.value as dynamic;
              List<dynamic> list = [];
              list.clear();
              list = map.values.toList();
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.snapshot.children.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(BlogFullPost(
                            blogData: list[index],
                          ));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Card(
                            color: AppConstantsColors.appWhiteColor70,
                            child: Column(
                              children: [
                                Image.network(
                                  width: double.infinity,
                                  height: screenHeight * 0.2,
                                  list[index]["image"].toString(),
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  height: screenHeight * 0.03,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: screenWidth * 0.05,
                                    right: screenWidth * 0.05,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        list[index]["title"].toString(),
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 2,
                                            wordSpacing: 2,
                                            color: AppConstantsColors
                                                .appBlackColor,
                                            fontFamily:
                                                AppFontsConstants.philosopher,
                                            fontSize: 16.sp),
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.03,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            list[index]['date'].toString(),
                                            style: TextStyle(
                                                color: AppConstantsColors
                                                    .appBlackColor,
                                                fontFamily:
                                                    AppFontsConstants.inter,
                                                fontSize: AppFontsConstants
                                                    .textFontSize.sp),
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        thickness: 2,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        list[index]["content"].toString(),
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        maxLines: 3,
                                        style: TextStyle(
                                            color: AppConstantsColors
                                                .appWhiteColor,
                                            fontFamily:
                                                AppFontsConstants.poppins,
                                            fontSize: 13.sp),
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.03,
                                      ),
                                      customLoginSignupButton(
                                          innerColor: AppConstantsColors
                                              .appGreenColor,
                                          textColor: AppConstantsColors
                                              .appWhiteColor,
                                          text: "Read more",
                                          func: () => Get.to(BlogFullPost(
                                                blogData: list[index],
                                              ))),
                                      SizedBox(
                                        height: screenHeight * 0.03,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                    ],
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
    );
  }
}
