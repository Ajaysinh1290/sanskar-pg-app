import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sanskar_pg_app/controllers/hostel_controller.dart';

import 'full_image.dart';

class FullImages extends StatelessWidget {
  final List<String> imageUrls;
  final int initialImage;

  const FullImages(
      {Key? key, required this.imageUrls, required this.initialImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_outlined,
              size: 30.sp,
              color: Colors.white,
            )),
      ),
      body: GetBuilder<HostelController>(builder: (hostelController) {
        return PageView.builder(
          itemCount: imageUrls.length,
          controller: PageController(initialPage: initialImage),
          itemBuilder: (context, index) {
            return FullImage(
              imageUrl: imageUrls[index],
              heroTag: imageUrls[index],
              showAppBar: false,
            );
          },
        );
      }),
    );
  }
}
