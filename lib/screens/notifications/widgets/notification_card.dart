import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationCard extends StatelessWidget {
  final String? imageUrl;
  final String? leadingText;
  final String title;
  final String description;
  final String time;

  const NotificationCard(
      {Key? key,
      this.imageUrl,
      this.leadingText,
      required this.title,
      required this.description,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(
          child: imageUrl != null
              ? Image.network(
                  imageUrl!,
                  width: 50.w,
                  height: 50.w,
                  fit: BoxFit.cover,
                )
              : Container(
                  alignment: Alignment.center,
                  color: Theme.of(context).primaryColor,
                  width: 50.w,
                  height: 50.w,
                  child: Text(
                    leadingText ?? 'S',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.white),
                  ),
                ),
        ),
        SizedBox(
          width: 20.w,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  // Container(
                  //   width: 10.w,
                  //   height: 10.w,
                  //   decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       color: Theme.of(context).primaryColor),
                  // )
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                description,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.normal,color: Colors.black),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                time,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
