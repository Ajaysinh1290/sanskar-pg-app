import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyListTile extends StatelessWidget {
  final IconData? leadingIcon;
  final Color? leadingWidgetColor;
  final String title;
  final String subTitle;
  final String? leadingText;
  final TextStyle? subTitleTextStyle;
  final Widget? trailing;

  const MyListTile(
      {Key? key,
      this.leadingIcon,
      this.leadingWidgetColor,
      required this.title,
      required this.subTitle,
      this.leadingText,
      this.subTitleTextStyle,
      this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.all(10.0.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(color: Theme.of(context).cardColor, width: 2)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: leadingIcon != null
                ? Icon(
                    leadingIcon,
                    color: leadingWidgetColor ?? Theme.of(context).primaryColor,
                    size: 24.sp,
                  )
                : Text(
                    (leadingText ?? ''),
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.center,
                  ),
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(5.r)),
            height: 55.h,
            width: 50.w,
          ),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  subTitle,
                  style: subTitleTextStyle ??
                      Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
          if (trailing != null) trailing!
        ],
      ),
    );
  }
}
