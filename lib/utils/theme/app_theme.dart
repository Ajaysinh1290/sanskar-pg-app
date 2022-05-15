import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_palette.dart';

mixin AppThemeMixin {
  ThemeData get appThemeData => ThemeData(
      primaryColor: ColorPalette.red,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: GoogleFonts.mulish().fontFamily,
      focusColor: Colors.black,
      disabledColor: Colors.black,
      dividerColor: ColorPalette.grey,
      cardColor: ColorPalette.lightGrey,
      buttonTheme: const ButtonThemeData(
        buttonColor: ColorPalette.red,
      ),
      appBarTheme: const AppBarTheme(
        color: Color(0xFFF00FFDE),
      ),
      textTheme: TextTheme(
        caption: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.4,
            color: Colors.black),
        overline: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.4,
            color: Colors.black),
        button: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.4,
            color: Colors.black),
        headline1: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.black),
        headline2: TextStyle(
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.4,
            color: Colors.black),
        headline3: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.black),
        headline4: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: Colors.black),
        headline5: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.4,
            color: Colors.black),
        headline6: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
            color: Colors.black),
        bodyText1: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.black),
        subtitle1: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: ColorPalette.grey),
        bodyText2: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.black),
        subtitle2: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.8,
            color: ColorPalette.grey),
      ),
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.black, selectionColor: Colors.blue[100]));
}
