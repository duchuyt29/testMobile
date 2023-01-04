import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';

/// Define color at theme_data.dart
class AppTextStyle {
  static const String appFont = 'Mulish';

  AppTextStyle._();

  static TextStyle regular({
    Color? color,
    double? fontSize,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) {
    return GoogleFonts.sourceSansPro(
      color: color ?? AppColor.primaryTextColor,
      fontSize: fontSize ?? 16,
      fontWeight: FontWeight.normal,
      decoration: decoration,
      fontStyle: fontStyle,
    );
  }

  static TextStyle bold({
    Color? color,
    double? fontSize,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) {
    return GoogleFonts.sourceSansPro(
      color: color ?? AppColor.primaryTextColor,
      fontSize: fontSize ?? 16,
      fontWeight: FontWeight.bold,
      decoration: decoration,
      fontStyle: fontStyle,
    );
  }

  static TextStyle heavy({
    Color? color,
    double? fontSize,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) {
    return GoogleFonts.sourceSansPro(
      color: color ?? AppColor.primaryTextColor,
      fontSize: fontSize ?? 18,
      fontWeight: FontWeight.w600,
      decoration: decoration,
      fontStyle: fontStyle,
    );
  }

  static TextStyle light({
    Color? color,
    double? fontSize,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) {
    return GoogleFonts.sourceSansPro(
      color: color ?? AppColor.primaryTextColor,
      fontSize: fontSize ?? 16,
      fontWeight: FontWeight.w300,
      decoration: decoration,
      fontStyle: fontStyle,
    );
  }

  static TextStyle error({
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) {
    return GoogleFonts.sourceSansPro(
      color: AppColor.errorColor,
      fontSize: 13,
      decoration: decoration,
      fontStyle: fontStyle,
    );
  }

  //   static TextStyle fontTest({
  //   Color? color,
  //   double? fontSize,
  //   TextDecoration? decoration,
  //   FontStyle? fontStyle,
  // }) {
  //   return GoogleFonts.
  // }
}
