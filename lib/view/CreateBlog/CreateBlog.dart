import 'package:covid_19_trackingapp/Reuseable%20Components/ReUseable%20Drawer/ReUseableDrawer.dart';
import 'package:covid_19_trackingapp/constants/TextHeading/text_heading.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/view/Login/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateBlog extends StatelessWidget {
  const CreateBlog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            TextHeading("Create a Blog", App_Constants_Colors.app_white_color),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        backgroundColor: App_Constants_Colors.app_green_color,
      ),
      drawer: ReUseable_Drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Get.to(Login());
              },
              child: Text("signOut"))
        ],
      ),
    );
  }
}
