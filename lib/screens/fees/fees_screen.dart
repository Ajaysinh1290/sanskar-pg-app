import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sanskar_pg_app/controllers/hostel_controller.dart';
import 'package:sanskar_pg_app/controllers/user_controller.dart';
import 'package:sanskar_pg_app/models/offer/offer.dart';
import 'package:sanskar_pg_app/models/payment/payment.dart';
import 'package:sanskar_pg_app/screens/fees/pay_fees.dart';
import 'package:sanskar_pg_app/screens/fees/transaction_details.dart';
import 'package:sanskar_pg_app/screens/fees/transactions.dart';
import 'package:sanskar_pg_app/screens/widgets/cards/my_card.dart';
import 'package:sanskar_pg_app/utils/constants/constants.dart';
import 'package:sanskar_pg_app/utils/theme/color_palette.dart';
import 'package:shimmer/shimmer.dart';

import 'offers.dart';

class FeesScreen extends StatelessWidget {
  const FeesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: Constants.scaffoldPaddingWithoutSafeArea,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent Transactions',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        IconButton(
                            onPressed: () => Get.to(const Transactions(),
                                transition: Transition.rightToLeft),
                            icon: Icon(
                              CupertinoIcons.arrow_right,
                              size: 30.sp,
                            ))
                      ],
                    ),
                    SizedBox(height: 15.h),
                    StreamBuilder<Object>(
                        stream: FirebaseFirestore.instance
                            .collection('hostels')
                            .doc(Get.find<HostelController>().hostel!.hostelId)
                            .collection('transactions')
                            .where('userId',
                                isEqualTo: userController.user!.userId)
                            .snapshots(),
                        builder: (context, AsyncSnapshot snapshot) {
                          List<Payment>? transactions;
                          if (snapshot.hasData) {
                            transactions = [];
                            for (var element in snapshot.data.docs) {
                              transactions
                                  .add(Payment.fromJson(element.data()));
                            }
                            transactions = transactions.reversed.toList();
                          }
                          return snapshot.connectionState ==
                                  ConnectionState.done
                              ? Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.white,
                                  child: ListView.builder(
                                    itemCount: 3,
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context, index) => Container(
                                      margin: EdgeInsets.only(bottom: 20.h),
                                      height: 80.h,
                                      color: Theme.of(context).cardColor,
                                    ),
                                  ),
                                )
                              : transactions == null || transactions.isEmpty
                                  ? Text(
                                      'No Transactions Found',
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    )
                                  : Column(
                                      children: [
                                        Column(
                                          children: List.generate(
                                              transactions.length > 10
                                                  ? 10
                                                  : transactions.length,
                                              (index) {
                                            Payment payment =
                                                transactions![index];
                                            return InkWell(
                                              onTap: () {
                                                Get.to(
                                                    TransactionDetails(
                                                        transactions![index]),
                                                    transition:
                                                        Transition.size);
                                              },
                                              child: MyListTile(
                                                  leadingText:
                                                      Constants.currencySymbol,
                                                  leadingWidgetColor:
                                                      Colors.black,
                                                  title:
                                                      payment.amount.toString(),
                                                  subTitleTextStyle:
                                                      Theme.of(context)
                                                          .textTheme
                                                          .bodyText2!
                                                          .copyWith(
                                                              color:
                                                                  ColorPalette
                                                                      .grey),
                                                  subTitle:
                                                      'Paid on ${Constants.dateFormat.format(payment.transactionDate)}'),
                                            );
                                          }),
                                        ),
                                      ],
                                    );
                        }),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Offers',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        IconButton(
                          icon: Icon(
                            CupertinoIcons.arrow_right,
                            size: 30.sp,
                          ),
                          onPressed: () => Get.to(const OffersScreen(),
                              transition: Transition.rightToLeft),
                        )
                      ],
                    ),
                    SizedBox(height: 5.h),
                    StreamBuilder<Object>(
                        stream: FirebaseFirestore.instance
                            .collection('hostels')
                            .doc(Get.find<HostelController>().hostel!.hostelId)
                            .collection('offers')
                            .limit(3)
                            .snapshots(),
                        builder: (context, AsyncSnapshot snapshot) {
                          List<Offer>? offers;
                          if (snapshot.hasData) {
                            offers = [];
                            for (var element in snapshot.data.docs) {
                              Offer offer = Offer.fromJson(element.data());
                              if (offer.lastDate
                                      .difference(DateTime(
                                          DateTime.now().year,
                                          DateTime.now().month,
                                          DateTime.now().day))
                                      .inDays >=
                                  0) {
                                offers.add(Offer.fromJson(element.data()));
                              }
                            }
                          }
                          return offers == null
                              ? Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.white,
                                  child: ListView.builder(
                                    itemCount: 3,
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context, index) => Container(
                                      margin: EdgeInsets.only(bottom: 20.h),
                                      height: 80.h,
                                      color: Theme.of(context).cardColor,
                                    ),
                                  ),
                                )
                              : offers.isEmpty
                                  ? Text(
                                      'No Offers Found',
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    )
                                  : Column(
                                      children: [
                                        Column(
                                          children: List.generate(offers.length,
                                              (index) {
                                            Offer offer = offers![index];
                                            return MyListTile(
                                              leadingText: offer.discountType,
                                              leadingWidgetColor: Colors.black,
                                              title:
                                                  '${offer.value}${offer.discountType} off',
                                              subTitleTextStyle: Theme.of(
                                                      context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .copyWith(
                                                      color: ColorPalette.grey),
                                              subTitle:
                                                  '${offer.value}${offer.discountType} off ${Constants.currencySymbol} valid till ${Constants.onlyDateFormat.format(offer.lastDate)}',
                                            );
                                          }),
                                        ),
                                      ],
                                    );
                        }),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(PayFees(userModel: userController.user!),
              transition: Transition.rightToLeft);
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add,
          size: 30.sp,
          color: Colors.white,
        ),
      ),
    );
  }
}
