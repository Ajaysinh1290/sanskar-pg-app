import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:sanskar_pg_app/animation/fade_and_translate_animation.dart';
import 'package:sanskar_pg_app/controllers/hostel_controller.dart';
import 'package:sanskar_pg_app/models/offer/offer.dart';
import 'package:sanskar_pg_app/models/payment/payment.dart';
import 'package:sanskar_pg_app/screens/fees/transaction_details.dart';
import 'package:sanskar_pg_app/screens/widgets/cards/my_card.dart';
import 'package:sanskar_pg_app/utils/constants/constants.dart';
import 'package:sanskar_pg_app/utils/images/image_storage.dart';
import 'package:sanskar_pg_app/utils/theme/color_palette.dart';
import 'package:shimmer/shimmer.dart';

class Transactions extends StatelessWidget {
  const Transactions({Key? key}) : super(key: key);

  showUndoSnackBar(Offer offer) {
    Get.showSnackbar(GetBar(
      animationDuration: const Duration(milliseconds: 1000),
      reverseAnimationCurve: Curves.easeOut,
      forwardAnimationCurve: Curves.easeOut,
      duration: const Duration(seconds: 5),
      isDismissible: true,
      messageText: Text(
        'Offer Deleted Successfully',
        style: Theme.of(Get.context!)
            .textTheme
            .headline5!
            .copyWith(color: Colors.white),
      ),
      mainButton: TextButton(
        child: Text(
          'UNDO',
          style: Theme.of(Get.context!)
              .textTheme
              .headline5!
              .copyWith(color: Colors.green),
        ),
        onPressed: () async {
          Get.back();
          await FirebaseFirestore.instance
              .collection('hostels')
              .doc(Get.find<HostelController>().hostel!.hostelId)
              .collection('offers')
              .doc(offer.offerId)
              .set(offer.toJson());
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Transactions',
          style: Theme.of(context).textTheme.headline3,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                size: 30.sp,
                color: Colors.black,
              ))
        ],
      ),
      body: StreamBuilder<Object>(
          stream: FirebaseFirestore.instance
              .collection('hostels')
              .doc(Get.find<HostelController>().hostel!.hostelId)
              .collection('transactions')
              .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            List<Payment>? transactions;
            if (snapshot.hasData) {
              transactions = [];
              for (var element in snapshot.data.docs) {
                transactions.add(Payment.fromJson(element.data()));
              }
              transactions = transactions.reversed.toList();
            }
            return transactions == null
                ? Shimmer.fromColors(
                    baseColor: Colors.grey[100]!,
                    highlightColor: Colors.grey[200]!,
                    child: ListView.builder(
                      itemCount: 10,
                      padding: Constants.scaffoldPaddingWithoutSafeArea,
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.only(bottom: 20.h),
                        height: 80.h,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                  )
                : transactions.isEmpty
                    ? SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 130.h,
                            ),
                            LottieBuilder.asset(
                              ImageStorage.lottieAnimations.notFound,
                              height: 350.h,
                              repeat: false,
                            ),
                            Text(
                              'No Transactions Found..!',
                              style: Theme.of(context).textTheme.headline3,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        itemCount: transactions.length,
                        itemBuilder: (context, index) {
                          Payment payment = transactions![index];
                          return FadeAnimationTranslateY(
                            delay: 1.4 + index * 0.2,
                            child: InkWell(
                              onTap: () => Get.to(TransactionDetails(payment),
                                  transition: Transition.rightToLeft),
                              child: MyListTile(
                                leadingText: Constants.currencySymbol,
                                leadingWidgetColor: Colors.black,
                                subTitle:
                                    'Paid on ${Constants.dateFormat.format(payment.transactionDate)}',
                                title: payment.amount.toString(),
                                subTitleTextStyle: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(color: ColorPalette.grey),
                              ),
                            ),
                          );
                        },
                      );
          }),
    );
  }
}
