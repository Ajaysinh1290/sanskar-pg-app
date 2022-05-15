import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsTile extends StatelessWidget {
  IconData? icon;
  String title;

  SettingsTile({Key? key, this.icon, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Theme.of(context).primaryColor.withOpacity(0.02)),
            child: Icon(
              icon,
              size: 25.sp,
            ),
          ),
          SizedBox(
            width: 40.w,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headline4,
          )
        ],
      ),
    );
  }
}
