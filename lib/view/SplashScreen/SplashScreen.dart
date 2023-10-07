import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:covid_19_trackingapp/Responsive_Height,Width/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Images/images.dart';
import '../../constants/colors_constants/colors_constants.dart';
import '../../constants/fonts_size_constant/fonts_size_constant.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(App_Images.SplashScreen_Image)),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            SizedBox(
              width: double.infinity,
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: App_Fonts_Constants.heading_font_size.sp,
                  color: App_Constants_Colors.app_black_color,
                  fontFamily: App_Fonts_Constants.Philosopher,
                ),
                child: Center(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                          'Covid 19\n\nTracking Application'),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
