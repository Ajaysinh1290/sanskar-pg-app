import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:sanskar_pg_app/animation/fade_and_translate_animation.dart';
import 'package:sanskar_pg_app/controllers/dashboard_controller.dart';
import 'package:sanskar_pg_app/controllers/hostel_controller.dart';
import 'package:sanskar_pg_app/data/foods.dart';
import 'package:sanskar_pg_app/data/hostel.dart';
import 'package:sanskar_pg_app/models/address/address.dart';
import 'package:sanskar_pg_app/models/event/event.dart';
import 'package:sanskar_pg_app/models/food/food.dart';
import 'package:sanskar_pg_app/models/hostel/hostel.dart';
import 'package:sanskar_pg_app/models/user/user_model.dart';
import 'package:sanskar_pg_app/screens/event/event_details.dart';
import 'package:sanskar_pg_app/screens/event/widgets/expanded_event_card.dart';
import 'package:sanskar_pg_app/screens/food/foods.dart';
import 'package:sanskar_pg_app/screens/notifications/notifications.dart';
import 'package:sanskar_pg_app/screens/widgets/cards/food_card.dart';
import 'package:sanskar_pg_app/screens/widgets/cards/my_card.dart';
import 'package:sanskar_pg_app/screens/widgets/dialog/show_error_dialog.dart';
import 'package:sanskar_pg_app/screens/widgets/image/full_images.dart';
import 'package:sanskar_pg_app/screens/widgets/image/image_network.dart';
import 'package:sanskar_pg_app/utils/utils.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _launchURL(url) async => await canLaunch(url)
      ? await launch(url)
      : showErrorDialog("Something went wrong..!", 'Could not launch url');

  bool _isActiveEvent(Event event) {
    DateTime todayDate = Constants.onlyDateFormat
        .parse(Constants.onlyDateFormat.format(DateTime.now()));
    DateTime todayTime = Constants.onlyTimeFormat
        .parse(Constants.onlyTimeFormat.format(DateTime.now()));
    DateTime startingTime = Constants.onlyTimeFormat
        .parse(Constants.onlyTimeFormat.format(event.startingTime));
    DateTime endingTime = Constants.onlyTimeFormat
        .parse(Constants.onlyTimeFormat.format(event.endingTime));
    DateTime startingDate = Constants.onlyDateFormat
        .parse(Constants.onlyDateFormat.format(event.startingDate));
    DateTime endingDate = Constants.onlyDateFormat
        .parse(Constants.onlyDateFormat.format(event.endingDate));
    if (todayDate.difference(startingDate).inDays >= 0) {
      if (todayDate.difference(endingDate).inDays > 0 &&
          todayTime.difference(endingTime).inSeconds > 0) {
        return false;
      } else if (todayDate.difference(startingDate).inDays == 0 &&
          todayTime.difference(startingTime).inSeconds < 0) {
        return false;
      } else {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    HostelController hostelController = Get.find();
    return Obx(() {
      Hostel? hostel = hostelController.hostel;
      return hostel == null
          ? Shimmer.fromColors(
              baseColor: Colors.grey[100]!,
              highlightColor: Colors.grey[200]!,
              child: ListView(
                padding: Constants.scaffoldPadding(context),
                children: [
                  Container(
                    width: double.infinity,
                    height: 225.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    width: 225.w,
                    height: 30.h,
                    color: Theme.of(context).cardColor,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.h),
                    width: double.infinity,
                    height: 80.h,
                    color: Theme.of(context).cardColor,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.h),
                    width: double.infinity,
                    height: 80.h,
                    color: Theme.of(context).cardColor,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.h),
                    width: double.infinity,
                    height: 80.h,
                    color: Theme.of(context).cardColor,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: 225.w,
                    height: 30.h,
                    color: Theme.of(context).cardColor,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 150.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: Theme.of(context).cardColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: Container(
                          height: 150.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: Theme.of(context).cardColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 150.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: Theme.of(context).cardColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: Container(
                          height: 150.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: Theme.of(context).cardColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                title: Text(hostel.hostelName,
                    style: Theme.of(context).textTheme.headline3),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.notifications_none,
                      size: 30.sp,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Get.to(Notifications(),
                          transition: Transition.rightToLeft);
                    },
                  )
                ],
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  padding: Constants.scaffoldPaddingWithoutSafeArea,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeAnimationTranslateY(
                        delay: 1.4,
                        child: StreamBuilder<Object>(
                            stream: FirebaseFirestore.instance
                                .collection('hostels')
                                .doc(hostel.hostelId)
                                .collection('events')
                                .snapshots(),
                            builder: (context, AsyncSnapshot snapshot) {
                              List<Event>? events;
                              if (snapshot.hasData) {
                                events = [];
                                for (var element in snapshot.data.docs) {
                                  Event event = Event.fromJson(element.data());
                                  if (_isActiveEvent(event)) {
                                    events.add(event);
                                  }
                                }
                              }

                              return events == null || events.isEmpty
                                  ? const SizedBox()
                                  : Padding(
                                      padding: EdgeInsets.only(bottom: 30.h),
                                      child: SizedBox(
                                        height: 225.h,
                                        child: PageView.builder(
                                          itemCount: events.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.all(2),
                                              child: GestureDetector(
                                                onTap: () {
                                                  Get.to(
                                                    () => EventDetails(
                                                      eventId: events![index]
                                                          .eventId,
                                                    ),
                                                  );
                                                },
                                                child: Hero(
                                                  tag: events![index].eventId,
                                                  child: ExpandedEventCard(
                                                      eventImage: events[index]
                                                          .eventImage,
                                                      title: events[index]
                                                          .eventTitle,
                                                      subTitle:
                                                          'ENDING ON ${Constants.onlyTimeFormat.format(events[index].endingTime)} ${Constants.onlyDateFormat.format(events[index].endingDate)}'
                                                              .toUpperCase()),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    );
                            }),
                      ),
                      StreamBuilder<Object>(
                          stream: FirebaseFirestore.instance
                              .collection('hostels')
                              .doc(hostel.hostelId)
                              .collection('foods')
                              .limit(8)
                              .snapshots(),
                          builder: (context, AsyncSnapshot snapshot) {
                            List<Food>? foods;
                            if (snapshot.hasData) {
                              List data = snapshot.data.docs;
                              foods = [];
                              for (var element in data) {
                                foods.add(Food.fromJson(element.data()));
                              }
                            }

                            return foods == null
                                ? Shimmer.fromColors(
                                    baseColor: Colors.grey[100]!,
                                    highlightColor: Colors.grey[200]!,
                                    child: GridView.builder(
                                      itemCount: 8,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      padding: Constants
                                          .scaffoldPaddingWithoutSafeArea,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 1,
                                              mainAxisSpacing: 20.w,
                                              crossAxisSpacing: 20.w),
                                      itemBuilder: (context, index) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Theme.of(context).cardColor,
                                        ),
                                      ),
                                    ),
                                  )
                                : foods.isEmpty
                                    ? Container()
                                    : Column(
                                        children: [
                                          FadeAnimationTranslateY(
                                            delay: 2.4,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Canteen Food',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline4,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.to(const Foods(),
                                                        transition: Transition
                                                            .rightToLeft);
                                                  },
                                                  child: Icon(
                                                    CupertinoIcons.arrow_right,
                                                    size: 30.sp,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 30.h),
                                          FadeAnimationTranslateY(
                                            delay: 2.4,
                                            child: GridView.builder(
                                                itemCount: foods.length,
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        childAspectRatio: 0.82,
                                                        crossAxisSpacing: 30.w,
                                                        mainAxisSpacing: 30.w),
                                                itemBuilder: (context, index) {
                                                  return FoodCard(
                                                      food: foods![index]);
                                                }),
                                          ),
                                          SizedBox(height: 50.h),
                                        ],
                                      );
                          }),
                      if (hostel.images != null && hostel.images!.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FadeAnimationTranslateY(
                              delay: 2,
                              child: Text(
                                'Hostel Images',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ),
                            SizedBox(height: 15.h),
                            ListView.builder(
                              itemCount: hostel.images!.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return FadeAnimationTranslateY(
                                  delay: 2 + (index * 0.2),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 20.h),
                                    child: InteractiveViewer(
                                      minScale: 0.1,
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(
                                              FullImages(
                                                imageUrls: hostel.images!,
                                                initialImage: index,
                                              ),
                                              transition: Transition.fade);
                                        },
                                        child: Hero(
                                          tag: hostel.images![index],
                                          child: ImageNetwork(
                                            imageUrl: hostel.images![index],
                                            width: double.infinity,
                                            height: 250.h,
                                            fit: BoxFit.cover,
                                            errorIcon: Icons.image,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 30.h),
                          ],
                        ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeAnimationTranslateY(
                            delay: 3,
                            child: Text(
                              'Contact',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _launchURL('mailto:${hostel.emailId}');
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 20.h),
                              child: FadeAnimationTranslateY(
                                delay: 3.1,
                                child: MyListTile(
                                    leadingIcon: Icons.mail,
                                    leadingWidgetColor: Colors.black,
                                    title: 'Email',
                                    subTitle: hostel.emailId),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _launchURL('tel:${hostel.mobileNumber}');
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 15.h),
                              child: FadeAnimationTranslateY(
                                delay: 3.1,
                                child: MyListTile(
                                    leadingIcon: Icons.call,
                                    leadingWidgetColor: Colors.black,
                                    title: 'Contact Number',
                                    subTitle: hostel.mobileNumber),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Address address = hostel.address;

                              String query =
                                  '${hostel.hostelName} ${address.street}, ${address.city}, ${address.state}, ${address.pinCode}';
                              Uri uri = Uri(
                                  scheme: 'geo',
                                  host: '0,0',
                                  queryParameters: {'q': query});
                              launch(uri.toString());
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 15.h),
                              child: FadeAnimationTranslateY(
                                  delay: 3.2,
                                  child: MyListTile(
                                      leadingIcon: Icons.location_on_sharp,
                                      leadingWidgetColor: Colors.black,
                                      title: 'Address',
                                      subTitle:
                                          '${hostel.address.street} \n${hostel.address.city}, ${hostel.address.state}\n${hostel.address.pinCode}')),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
    });
  }
}
