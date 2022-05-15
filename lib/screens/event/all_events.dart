import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sanskar_pg_app/controllers/hostel_controller.dart';
import 'package:sanskar_pg_app/models/event/event.dart';
import 'package:sanskar_pg_app/screens/event/widgets/expanded_event_card.dart';
import 'package:sanskar_pg_app/utils/constants/constants.dart';

import 'event_details.dart';

class AllEvents extends StatelessWidget {
  final String? title;
  final List<String> eventIds;

  const AllEvents({Key? key, this.title, required this.eventIds})
      : super(key: key);

  String _getSubTitle(Event event) {
    if (title == 'Upcoming Events') {
      return 'STARTING ON ${Constants.onlyTimeFormat.format(event.startingTime)} ${Constants.onlyDateFormat.format(event.startingDate)}'
          .toUpperCase();
    } else {
      return 'ENDED ON ${Constants.onlyTimeFormat.format(event.endingTime)} ${Constants.onlyDateFormat.format(event.endingDate)}'
          .toUpperCase();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_outlined,
              size: 30.sp,
              color: Colors.black,
            )),
        title: Text(
          title ?? 'Events',
          style: Theme.of(context).textTheme.headline3,
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<Object>(
          stream: FirebaseFirestore.instance
              .collection('hostels')
              .doc(Get.find<HostelController>().hostel!.hostelId)
              .collection('events')
              .where('eventId', whereIn: eventIds)
              .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            List<Event>? events;
            if (snapshot.hasData) {
              events = [];
              for (var element in snapshot.data.docs) {
                events.add(Event.fromJson(element.data()));
              }
            }
            return ListView.builder(
              padding: Constants.scaffoldPaddingWithoutSafeArea
                  .subtract(EdgeInsets.symmetric(vertical: 20.h)),
              itemCount: (events?.length) ?? 0,
              itemBuilder: (context, index) {
                Event event = events![index];
                return GestureDetector(
                  onTap: () {
                    Get.to(
                      () => EventDetails(
                        eventId: events![index].eventId,
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Hero(
                      tag: event.eventId,
                      child: ExpandedEventCard(
                          eventImage: event.eventImage,
                          title: event.eventTitle,
                          subTitle: _getSubTitle(event)),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
