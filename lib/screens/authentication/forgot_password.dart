import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sanskar_pg_app/screens/widgets/button/rounded_border_button.dart';
import 'package:sanskar_pg_app/screens/widgets/text-field/text_field.dart';
import 'package:sanskar_pg_app/utils/utils.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Image.asset(
                ImageStorage.illustrations.forgotPassword,
                height: 248.h,
                width: 268.w,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 20.w,
              ),
              Column(
                children: [
                  Text(
                    Constants.forgotPasswordTitle,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  Text(
                    Constants.forgotPasswordSubTitle,
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              AnimatedUnderlineTextField(
                prefixIconData: Icons.mail,
                hintText: 'Email',
              ),
              SizedBox(
                height: 60.h,
              ),
              RoundedBorderButton(
                  onPressed: () {},
                  buttonText: Constants.forgotPasswordButtonText),
              SizedBox(
                height: 5.h,
              ),
              TextButton(
                  onPressed: () => Get.back(),
                  child: Text(
                    'Back',
                    style: Theme.of(context).textTheme.subtitle1,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
