import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanskar_pg_app/screens/widgets/image/image_network.dart';

class EventCard extends StatelessWidget {
  final String eventImage;
  final String title;
  final AlignmentGeometry? alignment;

  const EventCard({Key? key, required this.eventImage, required this.title, this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175.h,
      width: 126.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: Stack(
          children: [
            ImageNetwork(
              imageUrl: eventImage,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black.withOpacity(0.4)],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              )),
            ),
            Positioned(
              bottom: 15.h,
              left: 15.w,
              child: SizedBox(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Container(
                        height: 35.h,
                        width: 1,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    SizedBox(
                      width: 100.h,
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            letterSpacing: 1.2),
                      ),
                    ),
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
