import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:sanskar_pg_app/utils/images/image_storage.dart';

showErrorDialog(String title, String subTitle) {
  Get.defaultDialog(
    backgroundColor: Colors.white,
    radius: 20,
    title: '',
    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    titlePadding: EdgeInsets.zero,
    content: Builder(builder: (context) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            LottieBuilder.asset(
              ImageStorage.lottieAnimations.error,
              width: 130.w,
              height: 130.w,
              fit: BoxFit.cover,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: Theme.of(context).cardColor,
            ),
            SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.h),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(100)),
                child: Text(
                  'TRY AGAIN',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      );
    }),
  );
}
