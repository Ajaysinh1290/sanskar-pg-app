import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:sanskar_pg_app/animation/fade_and_translate_animation.dart';
import 'package:sanskar_pg_app/controllers/auth_controller.dart';
import 'package:sanskar_pg_app/controllers/user_controller.dart';
import 'package:sanskar_pg_app/screens/settings/refer_and_earn.dart';
import 'package:sanskar_pg_app/screens/settings/your_profile.dart';
import 'package:sanskar_pg_app/screens/settings/widgets/settings_tile.dart';
import 'package:sanskar_pg_app/utils/theme/color_palette.dart';
import 'package:sanskar_pg_app/utils/utils.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  navigate(Widget widget) {
    Get.to(
      () => widget,
      transition: Transition.rightToLeftWithFade,
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: Constants.scaffoldPadding(context),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            FadeAnimationTranslateY(
              delay: 1.0,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Image.network(
                      userController.user!.userProfilePic ?? '',
                      width: 86.w,
                      height: 86.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 18.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userController.user!.userName,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          userController.user!.email,
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: ColorPalette.grey,
                                  ),
                          maxLines: 2,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            FadeAnimationTranslateY(
              delay: 1,
              child: Container(
                height: 2,
                width: double.infinity,
                color: Theme.of(context).cardColor,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            FadeAnimationTranslateY(
              delay: 1.2,
              child: InkWell(
                  onTap: () {
                    navigate(const YourProfile());
                  },
                  child: SettingsTile(
                    title: 'Your Profile',
                    icon: CupertinoIcons.person,
                  )),
            ),
            FadeAnimationTranslateY(
              delay: 1.4,
              child: SettingsTile(title: 'About Us', icon: CupertinoIcons.info),
            ),
            FadeAnimationTranslateY(
              delay: 1.4,
              child: SettingsTile(
                title: 'Terms & Conditions',
                icon: CupertinoIcons.bookmark,
              ),
            ),
            FadeAnimationTranslateY(
              delay: 1.6,
              child: InkWell(
                  onTap: () {
                    navigate(const ReferAndEarn());
                  },
                  child: SettingsTile(
                    title: 'Refer & Earn',
                    icon: CupertinoIcons.square_arrow_up,
                  )),
            ),
            FadeAnimationTranslateY(
              delay: 1.7,
              child: Container(
                height: 2,
                margin: EdgeInsets.symmetric(vertical: 15.h),
                width: double.infinity,
                color: Theme.of(context).cardColor,
              ),
            ),
            FadeAnimationTranslateY(
              delay: 1.8,
              child: InkWell(
                onTap: () {
                  Get.find<AuthController>().signOut();
                },
                child: SettingsTile(
                  title: 'Logout',
                  icon: CupertinoIcons.power,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
