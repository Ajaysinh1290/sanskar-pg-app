import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sanskar_pg_app/models/payment/payment.dart';
import 'package:sanskar_pg_app/utils/constants/constants.dart';
import 'package:sanskar_pg_app/utils/images/image_storage.dart';

class TransactionDetails extends StatelessWidget {
  final Payment payment;

  const TransactionDetails(this.payment, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          'Transaction Details',
          style: Theme.of(context).textTheme.headline3,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: Constants.scaffoldPaddingWithoutSafeArea,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                    width: 120.w,
                    height: 120.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor),
                    padding: const EdgeInsets.all(35.0),
                    child: Image.asset(ImageStorage.icons.transactionArrows)),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Text('${Constants.currencySymbol} ${payment.amount}',
                    style: Theme.of(context).textTheme.headline1),
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rent Total',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Flexible(
                    child: Text(
                      '${Constants.currencySymbol} ${payment.amount}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                width: double.infinity,
                height: 2,
                color: Theme.of(context).cardColor,
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transaction Id',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Flexible(
                    child: Text(
                      payment.transactionId.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                width: double.infinity,
                height: 2,
                color: Theme.of(context).cardColor,
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Flexible(
                    child: Text(
                      '09:20 AM 19 Aug, 2021',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ],
              ),
              if (payment.description != null &&
                  payment.description!.trim().isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    Container(
                      width: double.infinity,
                      height: 2,
                      color: Theme.of(context).cardColor,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      payment.description!,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
