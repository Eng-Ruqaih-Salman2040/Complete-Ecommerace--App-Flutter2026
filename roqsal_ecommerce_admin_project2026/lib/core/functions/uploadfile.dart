import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../constant/color.dart';


imageUploadCamera() async {
  final file = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 90);
  if (file != null) {
    return File(file.path!);
  } else {
    return null;
  }

  /*final ImagePicker picker = ImagePicker();
// Pick an image.
final XFile? image = await picker.pickImage(source: ImageSource.gallery);
// Capture a photo.
final XFile? photo = await picker.pickImage(source: ImageSource.camera);
// Pick a video.
final XFile? galleryVideo =
    await picker.pickVideo(source: ImageSource.gallery);
// Capture a video.
final XFile? cameraVideo = await picker.pickVideo(source: ImageSource.camera);
// Pick multiple images.
final List<XFile> images = await picker.pickMultiImage();
// Pick singe image or video.
final XFile? media = await picker.pickMedia();
// Pick multiple images and videos.
final List<XFile> medias = await picker.pickMultipleMedia();*/
}

fileUploadGallry([isSvg = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: isSvg
          ? ['svg', 'SVG']
          : [
              //'svg',
              //'SVG',
              'jpg',
              'JPG',
              'jpeg',
              'JPEG',
              'png',
              'PNG',
              'gif',
              'GIF'
            ]);
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

void showBottomMenu(Function imageUploadCamera, Function fileUploadGallery) {
  Get.bottomSheet(
    Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: const Text(
                "اختيار صورة",
                style: TextStyle(
                  fontSize: 22,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            ListTile(
              onTap: () {
                imageUploadCamera();
                Get.back();
              },
              leading: const Icon(
                Icons.camera_alt,
                size: 40,
              ),
              title: const Text(
                "صورة من الكاميرا",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
              onTap: () {
                fileUploadGallery();
                Get.back();
              },
              leading: const Icon(
                Icons.image,
                size: 40,
              ),
              title: const Text(
                "صورة من الاستديو",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    ),
    backgroundColor: Colors.white,
  );
}

