import 'package:covid_19_trackingapp/Reuseable%20Components/CustomButton/Login&signupButton.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/ReUseable%20Drawer/ReUseableDrawer.dart';
import 'package:covid_19_trackingapp/constants/TextHeading/text_heading.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/controller/CreateBlogController/CreateBlogController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateBlog extends StatelessWidget {
  const CreateBlog({super.key});

  @override
  Widget build(BuildContext context) {

    CreateBlogController createBlogController =
        Get.put(CreateBlogController());
    return Scaffold(
      appBar: AppBar(
        title: TextHeading(
            "Create an article", App_Constants_Colors.app_white_color),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        backgroundColor: App_Constants_Colors.app_green_color,
      ),
      drawer: ReUseable_Drawer(),
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
                                      color: App_Constants_Colors
                                          .app_black_color)),
                              hintText: 'Write a title of article...',
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: App_Constants_Colors.app_black_color,
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
                                      color: App_Constants_Colors
                                          .app_black_color)),
                              hintText: 'Write a article content...',
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: App_Constants_Colors.app_black_color,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.04,
                  ),
                  customLogin_SignupButton(
                      innerColor: App_Constants_Colors.app_green_color,
                      textColor: App_Constants_Colors.app_white_color,
                      text: "Publish",
                      func: () => createBlogController.publish()),
                ],
              ),
            ),
          )),
    );
  }
}
