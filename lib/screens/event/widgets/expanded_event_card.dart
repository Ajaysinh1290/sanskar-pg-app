import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanskar_pg_app/screens/widgets/image/image_network.dart';

class ExpandedEventCard extends StatelessWidget {
  final String eventImage;
  final String title;
  final String subTitle;

  const ExpandedEventCard(
      {Key? key,
      required this.eventImage,
      required this.title,
      required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: Stack(
          children: [
            ImageNetwork(
              imageUrl: eventImage,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              )),
            ),
            Positioned(
              bottom: 15.h,
              left: 20.w,
              child: SizedBox(
                height: 45.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Container(
                        height: double.infinity,
                        width: 1,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            subTitle,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                    letterSpacing: 1.0),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
