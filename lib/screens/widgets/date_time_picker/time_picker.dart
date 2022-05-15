import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

Future<TimeOfDay?> pickTime({TimeOfDay? initialTime}) async {
  return await showTimePicker(
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            canvasColor: Colors.white,
            colorScheme: ColorScheme.light(
                primary: Theme.of(context).primaryColor,
                secondary: Colors.white,
                onBackground: Colors.grey.shade50,
                background: Colors.white,
                surface: Colors.white),
          ),
          child: child!,
        );
      },
      context: Get.context!,
      initialTime: initialTime ?? TimeOfDay.now());
}
