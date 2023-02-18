import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meroquiz/controllers/datauploader.dart';
import 'package:meroquiz/firebase_ref/loadingStatus.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({super.key});
  DataUploader controller = Get.put(DataUploader());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Obx(() => Text(
          controller.loadingstatus.value == loadingStatus.completed
              ? "Uploaded"
              : "Uploading")),
    ));
  }
}
