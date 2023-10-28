import 'package:covid_19_trackingapp/Images/images.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/CustomButton/Login&signupButton.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/ReUseable%20Drawer/ReUseableDrawer.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:covid_19_trackingapp/view/BlogFullPost/BlogFullPost.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../constants/TextHeading/text_heading.dart';

class ArticlesView extends StatelessWidget {
  const ArticlesView({super.key});

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.ref("Article");

    return Scaffold(
      backgroundColor: App_Constants_Colors.app_background_color,
      appBar: AppBar(
        title: TextHeading("Articles", App_Constants_Colors.app_white_color),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        backgroundColor: App_Constants_Colors.app_green_color,
      ),
      drawer: ReUseable_Drawer(),
      body: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.02,
          right: screenWidth * 0.02,
        ),
        child: 
        
        StreamBuilder(
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
                            color: App_Constants_Colors.app_white_color_70,
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
                                            color: App_Constants_Colors
                                                .app_black_color,
                                            fontFamily:
                                                App_Fonts_Constants.Philosopher,
                                            fontSize: 16.sp),
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.03,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            list[index]['date'].toString(),
                                            style: TextStyle(
                                                color: App_Constants_Colors
                                                    .app_black_color,
                                                fontFamily:
                                                    App_Fonts_Constants.Inter,
                                                fontSize: App_Fonts_Constants
                                                    .text_font_size.sp),
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
                                            color: App_Constants_Colors
                                                .app_black_color,
                                            fontFamily: App_Fonts_Constants.Poppins,
                                            fontSize: 13.sp),
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.03,
                                      ),
                                      customLogin_SignupButton(
                                          innerColor:
                                              App_Constants_Colors.app_green_color,
                                          textColor:
                                              App_Constants_Colors.app_white_color,
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
