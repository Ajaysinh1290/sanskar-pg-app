import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl/intl.dart';
import 'package:sanskar_pg_app/controllers/hostel_controller.dart';
import 'package:sanskar_pg_app/models/event/event.dart';
import 'package:sanskar_pg_app/screens/widgets/image/image_network.dart';
import 'package:sanskar_pg_app/utils/constants/constants.dart';

class EventDetails extends StatefulWidget {
  final String eventId;

  const EventDetails({
    Key? key,
    required this.eventId,
  }) : super(key: key);

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  double topOffset = 400.h;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => setState(() => topOffset = 285.h));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  String _getDate(Event event) {
    String startingTime = DateFormat('dd MMM, yyyy').format(event.startingDate);
    String endingTime = DateFormat('dd MMM, yyyy').format(event.endingDate);
    if (startingTime == endingTime) {
      return startingTime;
    }
    return startingTime + ' - ' + endingTime;
  }

  @override
  Widget build(BuildContext context) {
    Event? event;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_outlined,
              size: 25,
              color: Colors.white,
            )),
      ),
      body: StreamBuilder<Object>(
          stream: FirebaseFirestore.instance
              .collection('hostels')
              .doc(Get.find<HostelController>().hostel!.hostelId)
              .collection('events')
              .doc(widget.eventId)
              .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData && snapshot.data.data() != null) {
              event = Event.fromJson(snapshot.data.data());
            }
            return event == null
                ? const CircularProgressIndicator()
                : Stack(
                    children: [
                      Hero(
                          tag: event!.eventId,
                          child: ImageNetwork(
                            imageUrl: event!.eventImage,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            height: 350.h,
                          )),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.fastOutSlowIn,
                        margin: EdgeInsets.only(top: topOffset),
                        height: double.infinity,
                        padding: Constants.scaffoldPaddingWithoutSafeArea,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35),
                                topRight: Radius.circular(35))),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              event!.eventTitle,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Text(
                              'Date',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              _getDate(event!),
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Text(
                              'Time',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              Constants.onlyTimeFormat
                                      .format(event!.startingTime) +
                                  ' - ' +
                                  Constants.onlyTimeFormat
                                      .format(event!.endingTime),
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Text(
                              'Place',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              '${event!.address.street} \n${event!.address.city}, ${event!.address.state}\n${event!.address.pinCode}',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Text(
                              'Description',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              event!.description ??
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.'
                                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s'
                                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s'
                                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            SizedBox(
                              height: 100.h,
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 100.h,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.white12, Colors.white],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                        ),
                      )
                    ],
                  );
          }),
    );
  }
}
