import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:sanskar_pg_app/utils/theme/color_palette.dart';

class MySnackBar {
  static void showSnackBar(String title, String? description) {
    Get.snackbar(title, description ?? '',
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
        backgroundColor: ColorPalette.red.withOpacity(0.9),
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        borderRadius: 5,
        snackStyle: SnackStyle.FLOATING,
        margin: EdgeInsets.only(top: 70.h, bottom: 0.h, left: 20, right: 20));
  }
}
