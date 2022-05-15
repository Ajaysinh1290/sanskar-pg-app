import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sanskar_pg_app/animation/fade_and_translate_animation.dart';
import 'package:sanskar_pg_app/screens/widgets/button/rounded_border_button.dart';
import 'package:sanskar_pg_app/screens/widgets/snackbar/snackbar.dart';
import 'package:sanskar_pg_app/utils/utils.dart';
import 'package:share/share.dart';

class ReferAndEarn extends StatelessWidget {
  const ReferAndEarn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_outlined,
              size: 25,
              color: Colors.black,
            )),
        title: Text(
          'Invite Friends',
          style: Theme
              .of(context)
              .textTheme
              .headline3,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: Constants.scaffoldPaddingWithoutSafeArea,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FadeAnimationTranslateY(
                  delay : 1.0,
                  child: Image.asset(
                    ImageStorage.illustrations.referAndEarn,
                    height: 248.w,
                    width: 268.w,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                FadeAnimationTranslateY(
                  delay: 1.2,
                  child: Text(
                    Constants.referAndEarnTitle,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline1,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                FadeAnimationTranslateY(
                  delay: 1.4,
                  child: Text(
                    Constants.referAndEarnSubTitle,
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle1,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                FadeAnimationTranslateY(
                  delay: 1.6,
                  child: DottedBorder(
                    color: Theme
                        .of(context)
                        .primaryColor,
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding:
                      EdgeInsets.symmetric(vertical: 15.w, horizontal: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'DDIFJSDJ9838',
                            style: Theme
                                .of(context)
                                .textTheme
                                .headline5,
                          ),
                          InkWell(
                            child: Icon(
                              Icons.copy,
                              size: 25.sp,
                              color: Theme
                                  .of(context)
                                  .primaryColor,
                            ),
                            onTap: () {
                              Clipboard.setData(
                                  const ClipboardData(text: "DDIFJSDJ9838"));
                              MySnackBar.showSnackBar(
                                  'Copied', 'Referral code copied to clipboard');
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                FadeAnimationTranslateY(
                  delay: 2,
                  child: RoundedBorderButton(
                      onPressed: () {
                        Share.share(
                            'Hey, Use my code DDIFJSDJ9838 and get 1000 points in your account.\n\nDownload app now');
                      },
                      buttonText: Constants.shareCodeButton),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
