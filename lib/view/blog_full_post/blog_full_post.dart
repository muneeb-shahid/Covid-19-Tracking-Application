import 'package:covid_19_trackingapp/reuseable_components/custom_button/login_and_signup_button.dart';
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
      backgroundColor: AppConstantsColors.appBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        backgroundColor: AppConstantsColors.appGreenColor,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back_ios_new,
            color: AppConstantsColors.appWhiteColor,
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
                    color: AppConstantsColors.appBlackColor,
                    fontFamily: AppFontsConstants.philosopher,
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
                        color: AppConstantsColors.appBlackColor,
                        fontFamily: AppFontsConstants.poppins,
                        fontSize: AppFontsConstants.textFontSize.sp),
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
                    color: AppConstantsColors.appBlackColor,
                    fontFamily: AppFontsConstants.poppins,
                    fontSize: 13.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
