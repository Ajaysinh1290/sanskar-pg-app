import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:sanskar_pg_app/animation/fade_and_translate_animation.dart';
import 'package:sanskar_pg_app/screens/home/home_page.dart';
import 'package:sanskar_pg_app/screens/notifications/widgets/notification_card.dart';
import 'package:sanskar_pg_app/utils/constants/constants.dart';

class Notifications extends StatelessWidget {

  final ScrollController scrollController = ScrollController();
  Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Notifications',
          style: Theme.of(context).textTheme.headline3,
        ),
        centerTitle: true,
      ),
      body: FadeAnimationTranslateY(
        delay: 1.2,
        child: ListView.separated(
          itemCount: 10,
          controller: scrollController,

          padding: Constants.scaffoldPaddingWithoutSafeArea,
          itemBuilder: (context, index) {

            return index.isEven
                ? const NotificationCard(
                    imageUrl:
                        'https://images.unsplash.com/photo-1503499746616-a6d202989535?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
                    title: 'Event Announcement',
                    description:
                        'Fresher\' party event 2021 on 22 Dec 2021 9:00 AM',
                    time: '2 min ago')
                : const NotificationCard(
                    leadingText: '%',
                    title: 'Discount',
                    description: 'Last day of 5% discount on Rent',
                    time: '54 min ago');
          },
          separatorBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Container(
                height: 2,
                width: double.infinity,
                color: Theme.of(context).cardColor,
              ),
            );
          },
        ),
      ),
    );
  }
}
