import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sanskar_pg_app/controllers/auth_controller.dart';
import 'package:sanskar_pg_app/screens/referral-code/referral_code.dart';
import 'package:sanskar_pg_app/screens/widgets/button/rounded_border_button.dart';
import 'package:sanskar_pg_app/screens/widgets/text-field/text_field.dart';
import 'package:sanskar_pg_app/utils/utils.dart';
import 'forgot_password.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: Constants.scaffoldPadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Image.asset(
                ImageStorage.illustrations.login,
                height: 172.h,
                width: 165.w,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 30.h,
              ),
              Column(
                children: [
                  Text(
                    Constants.loginTitle,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    Constants.loginSubTitle,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Column(
                children: [
                  AnimatedUnderlineTextField(
                    prefixIconData: Icons.mail,
                    hintText: 'Email',
                    controller: authController.email,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  AnimatedUnderlineTextField(
                    prefixIconData: Icons.lock,
                    hintText: 'Password',
                    obscureText: true,
                    controller: authController.password,
                  )
                ],
              ),
              SizedBox(
                height: 60.h,
              ),
              Obx(() {
                return Column(
                  children: [
                    RoundedBorderButton(
                        onPressed: () {
                          authController.signUp();
                        },
                        isLoading: authController.isLoading.value,
                        buttonText: 'Create Account'),
                    SizedBox(
                      height: 15.h,
                    ),
                    RoundedBorderButton(
                        onPressed: () {
                          authController.signIn();
                        },
                        isLoading: authController.isLoading.value,
                        buttonText: Constants.loginTitle),
                  ],
                );
              }),
              SizedBox(
                height: 5.h,
              ),
              TextButton(
                  onPressed: () {
                    Get.to(const ForgotPassword(),
                        transition: Transition.topLevel);
                  },
                  child: Text(
                    Constants.forgotPasswordTitle,
                    style: Theme.of(context).textTheme.subtitle1,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
