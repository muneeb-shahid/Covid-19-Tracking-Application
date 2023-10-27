import 'package:covid_19_trackingapp/Reuseable%20Components/CustomButton/Login&signupButton.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/ReUseable%20Drawer/ReUseableDrawer.dart';
import 'package:covid_19_trackingapp/constants/TextHeading/text_heading.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BlogFullPost extends StatelessWidget {
  final dynamic blogData;
  const BlogFullPost({
    super.key,
    required this.blogData,
  });

  @override
  Widget build(BuildContext context) {
    var heightt = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      backgroundColor: App_Constants_Colors.app_background_color,
      appBar: AppBar(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        backgroundColor: App_Constants_Colors.app_green_color,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back_ios_new,
            color: App_Constants_Colors.app_white_color,
          ),
          onTap: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.03,
            right: screenWidth * 0.03,
          ),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Image.network(
                width: double.infinity,
                height: screenHeight * 0.2,
                blogData["image"].toString(),
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Text(
                blogData["title"].toString(),
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    wordSpacing: 2,
                    color: App_Constants_Colors.app_black_color,
                    fontFamily: App_Fonts_Constants.Philosopher,
                    fontSize: 16.sp),
              ),
              SizedBox(
                height: heightt * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    blogData['date'].toString(),
                    style: TextStyle(
                        color: App_Constants_Colors.app_black_color,
                        fontFamily: App_Fonts_Constants.Poppins,
                        fontSize: App_Fonts_Constants.text_font_size.sp),
                  ),
                ],
              ),
              const Divider(
                thickness: 2,
                color: Colors.grey,
              ),
              Text(
                blogData["content"].toString(),
                textAlign: TextAlign.justify,
                style: TextStyle(
                    letterSpacing: 2,
                    wordSpacing: 2,
                    color: App_Constants_Colors.app_black_color,
                    fontFamily: App_Fonts_Constants.Poppins,
                    fontSize: 13.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
