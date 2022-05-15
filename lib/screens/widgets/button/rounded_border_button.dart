import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedBorderButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
  final bool? isLoading;
  final Color? buttonColor;
  final Color? buttonTextColor;

  const RoundedBorderButton(
      {Key? key,
      required this.onPressed,
      required this.buttonText,
      this.isLoading,
      this.buttonColor,
      this.buttonTextColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ?? false ? null : onPressed,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 60.w,
        decoration: BoxDecoration(
          color: buttonColor ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: isLoading ?? false
            ? SizedBox(
                width: 25.w,
                height: 25.w,
                child: const CircularProgressIndicator(
                  strokeWidth: 3,
                  backgroundColor: Colors.white54,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ))
            : Text(
                buttonText,
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: buttonTextColor ?? Colors.white),
              ),
      ),
    );
  }
}
