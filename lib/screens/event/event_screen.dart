import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:sanskar_pg_app/animation/fade_and_translate_animation.dart';
import 'package:sanskar_pg_app/controllers/hostel_controller.dart';
import 'package:sanskar_pg_app/models/event/event.dart';
import 'package:sanskar_pg_app/screens/event/widgets/event_card.dart';
import 'package:sanskar_pg_app/screens/event/widgets/expanded_event_card.dart';
import 'package:sanskar_pg_app/utils/constants/constants.dart';
import 'package:shimmer/shimmer.dart';
import 'all_events.dart';
import 'event_details.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  List<Event> activeEvents = [];
  List<Event> pastEvents = [];
  List<Event> upComingEvents = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  filterEvents(Event event) {
    DateTime todayDate = Constants.onlyDateFormat
        .parse(Constants.onlyDateFormat.format(DateTime.now()));
    DateTime todayTime = Constants.onlyTimeFormat
        .parse(Constants.onlyTimeFormat.format(DateTime.now()));

    debugPrint('today date : ' + todayDate.toString());

    // This lines will remove hours, minutes and seconds from date
    DateTime startingDate = Constants.onlyDateFormat
        .parse(Constants.onlyDateFormat.format(event.startingDate));
    DateTime endingDate = Constants.onlyDateFormat
        .parse(Constants.onlyDateFormat.format(event.endingDate));

    // This lines will remove date, month and year from date
    DateTime startingTime = Constants.onlyTimeFormat
        .parse(Constants.onlyTimeFormat.format(event.startingTime));
    DateTime endingTime = Constants.onlyTimeFormat
        .parse(Constants.onlyTimeFormat.format(event.endingTime));

    debugPrint('');
    debugPrint('today date :' + todayDate.toString());
    debugPrint('today time :' + todayTime.toString());
    debugPrint('starting date :' + startingDate.toString());
    debugPrint('ending date :' + endingDate.toString());
    debugPrint('starting time :' + startingTime.toString());
    debugPrint('ending time :' + endingTime.toString());
    debugPrint('difference date today-start :' +
        todayDate.difference(startingDate).inDays.toString());
    debugPrint('difference date today-end :' +
        todayDate.difference(endingDate).inDays.toString());
    debugPrint('difference time today-start :' +
        todayTime.difference(startingTime).inSeconds.toString());
    debugPrint('difference time today-end :' +
        todayTime.difference(endingTime).inSeconds.toString());

    if (todayDate.difference(startingDate).inDays >= 0) {
      if (todayDate.difference(endingDate).inDays > 0 &&
          todayTime.difference(endingTime).inSeconds > 0) {
        debugPrint("Past Event");
        pastEvents.add(event);
      } else if (todayDate.difference(startingDate).inDays == 0 &&
          todayTime.difference(startingTime).inSeconds < 0) {
        debugPrint("Upcoming Event in first condition");
        upComingEvents.add(event);
      } else {
        debugPrint("Active Event");
        activeEvents.add(event);
      }
    } else {
      debugPrint("Upcoming Event");
      upComingEvents.add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: Constants.scaffoldPadding(context),
          child: StreamBuilder<Object>(
              stream: FirebaseFirestore.instance
                  .collection('hostels')
                  .doc(Get.find<HostelController>().hostel!.hostelId)
                  .collection('events')
                  .snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  activeEvents = [];
                  pastEvents = [];
                  upComingEvents = [];
                  for (var element in snapshot.data.docs) {
                    Event event = Event.fromJson(element.data());
                    filterEvents(event);
                  }
                }
                return !snapshot.hasData
                    ? Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30.h,
                            ),
                            Container(
                              width: 200.w,
                              height: 30.h,
                              color: Colors.grey.shade100,
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Container(
                              width: double.infinity,
                              height: 225.h,
                              color: Colors.grey.shade100,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              width: double.infinity,
                              height: 225.h,
                              color: Colors.grey.shade100,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Container(
                              width: 200.w,
                              height: 30.h,
                              color: Colors.grey.shade100,
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            SizedBox(
                              height: 175.h,
                              child: ListView.builder(
                                itemCount: 5,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(right: 20.w),
                                    height: 175.h,
                                    width: 126.w,
                                    color: Colors.grey.shade100,
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Container(
                              width: 200.w,
                              height: 30.h,
                              color: Colors.grey.shade100,
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            SizedBox(
                              height: 175.h,
                              child: ListView.builder(
                                itemCount: 5,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(right: 20.w),
                                    height: 175.h,
                                    width: 126.w,
                                    color: Colors.grey.shade100,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (activeEvents.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FadeAnimationTranslateY(
                                  delay: 1.0,
                                  child: Text(
                                    'Active Events',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                ListView.builder(
                                  itemCount: activeEvents.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (context, index) {
                                    return FadeAnimationTranslateY(
                                      delay: (1.2) + (index * 0.2),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 20.h),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(
                                              () => EventDetails(
                                                eventId:
                                                    activeEvents[index].eventId,
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: activeEvents[index].eventId,
                                            child: ExpandedEventCard(
                                                eventImage: activeEvents[index]
                                                    .eventImage,
                                                title: activeEvents[index]
                                                    .eventTitle,
                                                subTitle:
                                                    'ENDING ON ${Constants.onlyTimeFormat.format(activeEvents[index].endingTime)} ${Constants.onlyDateFormat.format(activeEvents[index].endingDate)}'
                                                        .toUpperCase()),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          if (upComingEvents.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FadeAnimationTranslateY(
                                  delay: 1.6,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Upcoming Events',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Get.to(
                                            AllEvents(
                                              eventIds: upComingEvents
                                                  .map((e) => e.eventId)
                                                  .toList(),
                                              title: 'Upcoming Events',
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          CupertinoIcons.arrow_right,
                                          size: 30.sp,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                FadeAnimationTranslateY(
                                  delay: 1.6,
                                  child: SizedBox(
                                    height: 175.h,
                                    child: ListView.builder(
                                      itemCount: upComingEvents.length,
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Get.to(
                                              () => EventDetails(
                                                eventId: upComingEvents[index]
                                                    .eventId,
                                              ),
                                            );
                                          },
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(right: 20.w),
                                            child: Hero(
                                              tag:
                                                  upComingEvents[index].eventId,
                                              child: EventCard(
                                                  eventImage:
                                                      upComingEvents[index]
                                                          .eventImage,
                                                  title: upComingEvents[index]
                                                      .eventTitle),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15.h),
                              ],
                            ),
                          if (pastEvents.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FadeAnimationTranslateY(
                                  delay: 1.8,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Past Events',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Get.to(AllEvents(
                                            eventIds: pastEvents
                                                .map((e) => e.eventId)
                                                .toList(),
                                            title: 'Past Events',
                                          ));
                                        },
                                        icon: Icon(
                                          CupertinoIcons.arrow_right,
                                          size: 30.sp,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                FadeAnimationTranslateY(
                                  delay: 1.8,
                                  child: SizedBox(
                                    height: 175.h,
                                    child: ListView.builder(
                                      itemCount: pastEvents.length,
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Get.to(
                                              () => EventDetails(
                                                eventId:
                                                    pastEvents[index].eventId,
                                              ),
                                            );
                                          },
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(right: 20.w),
                                            child: Hero(
                                              tag: pastEvents[index].eventId,
                                              child: EventCard(
                                                  eventImage: pastEvents[index]
                                                      .eventImage,
                                                  title: pastEvents[index]
                                                      .eventTitle),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                        ],
                      );
              }),
        ),
      ),
    );
  }
}
