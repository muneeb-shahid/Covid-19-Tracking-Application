import 'dart:io';

import 'package:covid_19_trackingapp/constants/colors_constants/colors_constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';

class CreateBlogController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  get formKey => _formKey;

  final TextEditingController _titleController = TextEditingController();
  get titleController => _titleController;

  final TextEditingController _contentController = TextEditingController();
  get contentController => _contentController;
  final databaseRef = FirebaseDatabase.instance.ref("Article");

  String? validateTitle(String? input) {
    if (input == null || input.isEmpty) {
      return 'Article title is required.';
    }
    input = input.trim();

    List<String> words = input.split(' ');

    if (words.length < 2) {
      return 'Please write at least 2 words.';
    } else if (words.length > 51) {
      return 'Please do not write more than 20 words.';
    }

    return null;
  }

  String? validateContent(String? input) {
    if (input == null || input.isEmpty) {
      return 'Article content is required.';
    }
    input = input.trim();

    List<String> words = input.split(' ');

    if (words.length < 21) {
      return 'Please write at least 20 words.';
    }

    return null;
  }

  String imageURL = "";
  uploadingImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    print(image?.path);
    if (image == null) return;

    String UniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    final storageRef = FirebaseStorage.instance.ref();

    final storageRefImages = storageRef.child("images");

    final storageRefImagesToUpload = storageRefImages.child(UniqueFileName);

    try {
      await storageRefImagesToUpload.putFile(File(image.path));
      imageURL = await storageRefImagesToUpload.getDownloadURL();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  publish() {
    if (imageURL.isEmpty) {
      Get.snackbar(
        "Error",
        'Please upload an image',
        icon: const Icon(Icons.error, color: Colors.black),
        backgroundColor: AppConstantsColors.appWhiteColor,
        colorText: Colors.black,
        snackPosition: SnackPosition.TOP,
      );
      return;
    } else if (formKey.currentState!.validate()) {
      final now = DateTime.now();
      final dateFormat = DateFormat('yyyy-MM-dd');
      final formattedDate = dateFormat.format(now);
      databaseRef.child(DateTime.now().millisecondsSinceEpoch.toString()).set({
        "title": titleController.text.toString(),
        "content": contentController.text.toString(),
        "id": DateTime.now().millisecondsSinceEpoch.toString(),
        "date": formattedDate,
        "image": imageURL,
      }).then((value) {
        titleController.clear();
        contentController.clear();

        Get.snackbar(
          "Successfully",
          'Article is published',
          icon: const Icon(Icons.publish, color: Colors.black),
          backgroundColor: AppConstantsColors.appWhiteColor,
          colorText: Colors.black,
          snackPosition: SnackPosition.TOP,
        );
      }).onError((error, stackTrace) {});
    }
  }
}
