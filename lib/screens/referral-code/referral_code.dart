import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:sanskar_pg_app/screens/dashboard/dashboard.dart';
import 'package:sanskar_pg_app/screens/widgets/button/rounded_border_button.dart';
import 'package:sanskar_pg_app/screens/widgets/text-field/text_field.dart';
import 'package:sanskar_pg_app/utils/utils.dart';

class ReferralCode extends StatelessWidget {
  const ReferralCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: Constants.scaffoldPadding(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  ImageStorage.illustrations.referAndEarn,
                  height: 248.h,
                  width: 268.w,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  Constants.referralCodeTitle,
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  Constants.referralCodeSubTitle,
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30.h,
                ),
                AnimatedUnderlineTextField(
                  prefixIconData: Icons.style,
                  hintText: 'Referral Code',
                ),
                SizedBox(
                  height: 40.h,
                ),
                RoundedBorderButton(
                    onPressed: () {
                      Get.to(Dashboard(),transition: Transition.fade);
                    },
                    buttonText: Constants.referralCodeButtonText),
                SizedBox(
                  height: 5.h,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Skip',
                      style: Theme.of(context).textTheme.subtitle1,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
