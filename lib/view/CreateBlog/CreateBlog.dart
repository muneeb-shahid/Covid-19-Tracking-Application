import 'dart:io';

import 'package:covid_19_trackingapp/Reuseable%20Components/CustomButton/Login&signupButton.dart';
import 'package:covid_19_trackingapp/Reuseable%20Components/ReUseable%20Drawer/ReUseableDrawer.dart';
import 'package:covid_19_trackingapp/constants/TextHeading/text_heading.dart';
import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:covid_19_trackingapp/controller/CreateBlogController/CreateBlogController.dart';
import 'package:covid_19_trackingapp/view/Login/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:image_picker/image_picker.dart';

class CreateBlog extends StatelessWidget {
  const CreateBlog({super.key});

  @override
  Widget build(BuildContext context) {
    CreateBlogController _CreateBlogController =
        Get.put(CreateBlogController());
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
                            String imageURL = "";
                            ;
                            final ImagePicker picker = ImagePicker();

                            final XFile? image = await picker.pickImage(
                                source: ImageSource.gallery);

                            print(image?.path);
                            if (image == null) return;

                            String UniqueFileName = DateTime.now()
                                .millisecondsSinceEpoch
                                .toString();
                            final storageRef = FirebaseStorage.instance.ref();

                            final storageRefImages = storageRef.child("images");

                            final storageRefImagesToUpload =
                                storageRefImages.child(UniqueFileName);

                            try {
                              await storageRefImagesToUpload
                                  .putFile(File(image!.path));
                              imageURL = await storageRefImagesToUpload
                                  .getDownloadURL();
                            } catch (e) {}
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
                    key: _CreateBlogController.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                            controller: _CreateBlogController.titleController,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            validator: _CreateBlogController.validateTitle,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: App_Constants_Colors
                                          .app_black_color)),
                              hintText: 'Write a title of blog...',
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
                            controller: _CreateBlogController.contentController,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            validator: _CreateBlogController.validateContent,
                            maxLines: 4,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: App_Constants_Colors
                                          .app_black_color)),
                              hintText: 'Write a blog content...',
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
                      func: () => _CreateBlogController.publish()),
                ],
              ),
            ),
          )),
    );
  }
}
