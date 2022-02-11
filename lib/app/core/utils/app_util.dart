import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppUtil {
  AppUtil._();
  static Future<void> showLoading({String text = 'Loading...'}) {
    return Get.dialog(
      Material(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void stopLoading() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }
}
