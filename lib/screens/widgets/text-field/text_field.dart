import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedUnderlineTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final bool? obscureText;
  final bool? expanded;
  late TextInputType? keyboardType;
  final String? suffixText;
  final String? prefixText;
  FocusNode? focusNode = FocusNode();
  final TextCapitalization? textCapitalization;
  final Function(String)? onChanged;
  final bool? enableInteractiveSelection;
  final bool? readOnly;
  final Widget? suffixIcon;
  final IconData? prefixIconData;
  final TextStyle? prefixStyle;
  final Color? color;
  final double? width;
  final String? initialValue;
  final ValueNotifier<double> _lineWidth = ValueNotifier(0);
  final bool? isNumber;
  List<TextInputFormatter>? inputFormatters;

  AnimatedUnderlineTextField(
      {Key? key,
      required this.hintText,
      this.controller,
      this.validator,
      this.expanded,
      this.obscureText,
      this.keyboardType,
      this.suffixText,
      this.textCapitalization,
      this.onChanged,
      this.readOnly,
      this.enableInteractiveSelection,
      this.color,
      this.suffixIcon,
      this.prefixText,
      this.prefixIconData,
      this.prefixStyle,
      this.width,
      this.inputFormatters,
      this.isNumber,
      this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    focusNode!.addListener(() {
      _lineWidth.value =
          focusNode!.hasPrimaryFocus ? MediaQuery.of(context).size.width : 0;
    });
    if (isNumber != null && isNumber!) {
      keyboardType = TextInputType.number;
      inputFormatters = <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ];
    }
    return SizedBox(
      width: width ?? double.infinity,
      child: Column(
        children: [
          TextFormField(
              initialValue: initialValue,
              maxLines: expanded ?? false ? null : 1,
              validator: validator,
              readOnly: readOnly ?? false,
              inputFormatters: inputFormatters,
              textCapitalization:
                  textCapitalization ?? TextCapitalization.sentences,
              autovalidateMode: AutovalidateMode.disabled,
              enableInteractiveSelection: enableInteractiveSelection ?? true,
              focusNode: focusNode,
              controller: controller,
              onChanged: onChanged,
              keyboardType: keyboardType ?? TextInputType.name,
              obscureText: obscureText ?? false,
              cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setHeight(15),
                      horizontal: ScreenUtil().setWidth(10)),
                  border: InputBorder.none,
                  // focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 1)),
                  suffixText: suffixText,
                  suffixIcon: suffixIcon,
                  prefixIcon: Align(
                    alignment: Alignment.centerLeft,
                    child: prefixIconData != null
                        ? Icon(
                            prefixIconData,
                            color: Colors.black,
                            size: 24.sp,
                          )
                        : Text(
                            prefixText ?? '',
                            style: prefixStyle ??
                                Theme.of(context).textTheme.headline4,
                            textAlign: TextAlign.center,
                          ),
                  ),
                  suffixStyle: Theme.of(context).textTheme.bodyText1,
                  prefixIconConstraints: BoxConstraints(maxWidth: 40.w),
                  hintText: hintText,
                  hintStyle: Theme.of(context).textTheme.subtitle1),
              style: Theme.of(context).textTheme.headline5),
          SizedBox(
            height: 8.h,
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 1,
                color: Theme.of(context).dividerColor,
              ),
              ValueListenableBuilder<double>(
                valueListenable: _lineWidth,
                builder: (context, double value, Widget? child) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: value,
                    height: 1,
                    color: Colors.black,
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
