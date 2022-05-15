import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:lottie/lottie.dart';
import 'package:sanskar_pg_app/models/payment/payment.dart';
import 'package:sanskar_pg_app/screens/fees/transaction_details.dart';
import 'package:sanskar_pg_app/screens/widgets/button/rounded_border_button.dart';
import 'package:sanskar_pg_app/utils/constants/constants.dart';
import 'package:sanskar_pg_app/utils/images/image_storage.dart';
class PaymentSuccessful extends StatelessWidget {
  final Payment payment;

  const PaymentSuccessful({Key? key, required this.payment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: Constants.scaffoldPaddingWithoutSafeArea,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LottieBuilder.asset(
                  ImageStorage.lottieAnimations.successful,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  repeat: false,
                ),
                // SizedBox(
                //   height: 100.h,
                // ),
                Text(
                  Constants.paymentSuccessfulTitle,
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  Constants.paymentSuccessfulSubTitle,
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 80.h,
                ),
                RoundedBorderButton(
                    onPressed: () {
                      Get.to(
                          TransactionDetails(
                            payment,
                          ),
                          transition: Transition.fade);
                    },
                    buttonText: Constants.transactionDetailsButtonText),
                SizedBox(
                  height: 5.h,
                ),
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'Back',
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
