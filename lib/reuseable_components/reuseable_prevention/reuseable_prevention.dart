import 'package:covid_19_trackingapp/Images/images.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/text_heading/text_heading.dart';
import 'package:covid_19_trackingapp/model/prevention/prevention.dart';
import 'package:covid_19_trackingapp/reuseable_components/custom_button/login_and_signup_button.dart';
import 'package:flutter/material.dart';

List<PreventionModel> list_PreventionModel = [
  PreventionModel(image: App_Images.Usemask, title: "Use Mask"),
  PreventionModel(image: App_Images.Washyourhand, title: "Wash your hand"),
  PreventionModel(
      image: App_Images.Avoidclosecontact, title: "Avoid close contact"),
];

Widget buildPreventionCard({required PreventionModel list_PreventionModel}) =>
    Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      shadowColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.05,
          right: screenWidth * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  list_PreventionModel.image,
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                textHeading(list_PreventionModel.title,
                    AppConstantsColors.appBlackColor),
              ],
            ),
          ],
        ),
      ),
    );
