import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sanskar_pg_app/animation/fade_and_translate_animation.dart';
import 'package:sanskar_pg_app/controllers/user_controller.dart';
import 'package:sanskar_pg_app/models/user/user_model.dart';
import 'package:sanskar_pg_app/screens/widgets/button/rounded_border_button.dart';
import 'package:sanskar_pg_app/screens/widgets/text-field/text_field.dart';
import 'package:sanskar_pg_app/utils/constants/constants.dart';

class YourProfile extends StatefulWidget {
  const YourProfile({Key? key}) : super(key: key);

  @override
  _YourProfileState createState() => _YourProfileState();
}

class _YourProfileState extends State<YourProfile> {
  late TextEditingController userIdController;
  late TextEditingController userNameController;
  late TextEditingController emailController;

  late TextEditingController mobileNumberController;
  UserModel? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = Get.find<UserController>().user;
    if (user != null) {
      userNameController = TextEditingController(text: user!.userName);
      emailController = TextEditingController(text: user!.email);
      mobileNumberController =
          TextEditingController(text: user!.mobileNumber ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_outlined,
              size: 30.sp,
              color: Colors.black,
            )),
        title: Text(
          'Your Profile',
          style: Theme.of(context).textTheme.headline3,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: Constants.scaffoldPaddingWithoutSafeArea,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeAnimationTranslateY(
                delay: 1.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.network(
                    user!.userProfilePic ?? '',
                    width: 110.w,
                    height: 110.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 15.w,
              ),
              FadeAnimationTranslateY(
                delay: 1.0,
                child: Text(
                  'EDIT PHOTO',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(letterSpacing: 2),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              // AnimatedUnderlineTextField(
              //   hintText: 'User Id',
              //   prefixIconData: Icons.person,
              // ),
              // SizedBox(
              //   height: 15.h,
              // ),
              FadeAnimationTranslateY(
                delay: 1.2,
                child: AnimatedUnderlineTextField(
                  hintText: 'User Name',
                  prefixIconData: Icons.person,
                  controller: userNameController,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              FadeAnimationTranslateY(
                delay: 1.4,
                child: AnimatedUnderlineTextField(
                  hintText: 'Email',
                  prefixIconData: Icons.mail,
                  controller: emailController,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              FadeAnimationTranslateY(
                delay: 1.6,
                child: AnimatedUnderlineTextField(
                  hintText: 'Mobile Number',
                  prefixIconData: Icons.call,
                  controller: mobileNumberController,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              FadeAnimationTranslateY(
                delay: 1.8,
                child: RoundedBorderButton(
                  onPressed: () {},
                  buttonText: 'Update',
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              FadeAnimationTranslateY(
                delay: 2.0,
                child: RoundedBorderButton(
                  onPressed: () {},
                  buttonText: 'Change Password',
                  buttonColor: Theme.of(context).cardColor,
                  buttonTextColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
