import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sanskar_pg_app/models/user/user_model.dart';
import 'package:sanskar_pg_app/screens/widgets/button/rounded_border_button.dart';
import 'package:sanskar_pg_app/screens/widgets/text-field/text_field.dart';
import 'package:sanskar_pg_app/utils/constants/constants.dart';
import 'package:sanskar_pg_app/utils/images/image_storage.dart';

import 'controller/payment_controller.dart';

class PayFees extends StatelessWidget {
  final UserModel userModel;
  final ValueNotifier<String> amount = ValueNotifier('');

  PayFees({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PaymentController paymentController = Get.put(PaymentController());
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_outlined,
              size: 30.sp,
              color: Colors.black,
            )),
        title: Text(
          'Pay Fees',
          style: Theme.of(context).textTheme.headline3,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: Constants.scaffoldPaddingWithoutSafeArea,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    ImageStorage.illustrations.payment,
                    height: 300.w,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
                AnimatedUnderlineTextField(
                  prefixText: Constants.currencySymbol + ' ',
                  hintText: 'Amount',
                  controller: paymentController.amountController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                AnimatedUnderlineTextField(
                  prefixIconData: Icons.description,
                  hintText: 'Description (optional)',
                  controller: paymentController.descriptionController,
                  expanded: true,
                  keyboardType: TextInputType.multiline,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Obx(
                  () => RoundedBorderButton(
                      onPressed: () {
                        paymentController.createTransaction(userModel);
                      },
                      isLoading: paymentController.isLoading.value,
                      buttonText: Constants.payFeesButtonText),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
