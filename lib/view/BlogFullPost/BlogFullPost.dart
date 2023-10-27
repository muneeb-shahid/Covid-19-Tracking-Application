import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/fonts_size_constant/fonts_size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class BlogFullPost extends StatelessWidget {
  final dynamic blogData;
  const BlogFullPost({super.key, 
    required this.blogData,
  });

  @override
  Widget build(BuildContext context) {
    var heightt = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      backgroundColor: App_Constants_Colors.app_background_color,
      appBar: AppBar(
        backgroundColor: App_Constants_Colors.app_background_color,
        elevation: 0,
        leading: InkWell(
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onTap: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [

                Text(
                  blogData["title"].toString(),
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
                  style: TextStyle(
                      color: App_Constants_Colors.app_black_color,
                      fontFamily: App_Fonts_Constants.Poppins,
                      fontSize: 13.sp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



