import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

Future<DateTime?> pickDate({required DateTime firstDate,required DateTime lastDate,DateTime? initialDate}) async {
  return await showDatePicker(
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
                primary: Theme.of(context).primaryColor,
                secondary: Colors.white,
                surface: Colors.white),
          ),
          child: child!,
        );
      },
      initialDate: initialDate??DateTime.now(),
      firstDate: firstDate,
      lastDate: lastDate,
      context: Get.context!);
}
