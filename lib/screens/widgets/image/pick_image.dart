import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImage() async {
  var pickedFile = await ImagePicker()
      .pickImage(source: ImageSource.gallery, imageQuality: 20);
  if (pickedFile != null) {
    return File(pickedFile.path);
  } else {
    debugPrint('no image selected');
  }
}
