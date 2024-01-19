import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/constants/text_heading/text_heading.dart';
import 'package:covid_19_trackingapp/controller/create_blog_controller/create_blog_controller.dart';
import 'package:covid_19_trackingapp/reuseable_components/reuseable_drawer/reuseable_drawer.dart';
import 'package:covid_19_trackingapp/view/home_view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../reuseable_components/custom_button/login_and_signup_button.dart';

class CreateBlog extends StatelessWidget {
  const CreateBlog({super.key});

  @override
  Widget build(BuildContext context) {

    CreateBlogController createBlogController =
        Get.put(CreateBlogController());
    return Scaffold(
      appBar: AppBar(
        title: textHeading(
            "Create an article", AppConstantsColors.appWhiteColor),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        backgroundColor: AppConstantsColors.appGreenColor,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Get.offAll(() => HomeView());
              },
              icon: Icon(Icons.login_outlined)),
        ],
      ),
      drawer: reUseableDrawer(),
      body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                          onPressed: () async {
                            createBlogController.uploadingImage();
                          },
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            size: 50,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  Form(
                    key: createBlogController.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                            controller: createBlogController.titleController,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            validator: createBlogController.validateTitle,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppConstantsColors
                                          .appBlackColor)),
                              hintText: 'Write a title of article...',
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: AppConstantsColors.appBlackColor,
                                ),
                              ),
                            )),
                        SizedBox(
                          height: screenHeight * 0.03,
                        ),
                        TextFormField(
                            controller: createBlogController.contentController,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            validator: createBlogController.validateContent,
                            maxLines: 4,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppConstantsColors
                                          .appBlackColor)),
                              hintText: 'Write a article content...',
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: AppConstantsColors.appBlackColor,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.04,
                  ),
                  customLoginSignupButton(
                      innerColor: AppConstantsColors.appGreenColor,
                      textColor: AppConstantsColors.appWhiteColor,
                      text: "Publish",
                      func: () => createBlogController.publish()),
                ],
              ),
            ),
          )),
    );
  }
}
