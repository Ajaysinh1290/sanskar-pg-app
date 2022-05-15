import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDropDownMenuButton extends StatelessWidget {
  final Function(Object?)? onChanged;
  final Object? value;
  final List<DropdownMenuItem<Object?>> items;

  const MyDropDownMenuButton(
      {Key? key, this.onChanged, this.value, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<Object?>(
            value: value,
            isExpanded: true,
            underline: Container(),
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black,
              size: 30.sp,
            ),
            onChanged: onChanged,
            items: items),
        Container(
          width: double.infinity,
          height: 1,
          color: Theme.of(context).dividerColor,
        ),
      ],
    );
  }
}
