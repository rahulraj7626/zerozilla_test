import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'font_size.dart';

class AppTextStyle {
  static TextStyle normalStyle(
      {Color? fontColor,
      double? fontSize,
      FontWeight? fontWeight,
      FontStyle? fontStyle,
      TextDecoration? decoration}) {
    return TextStyle(
        color: fontColor ?? CColors.black152e22,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontSize: fontSize ?? FontSize.mediumFont,
        fontStyle: fontStyle ?? FontStyle.normal,
        decoration: decoration ?? TextDecoration.none);
  }

  static TextStyle normalDesc(
      {Color? fontColor,
      double? fontSize,
      FontWeight? fontWeight,
      FontStyle? fontStyle,
      TextDecoration? decoration}) {
    return TextStyle(
        color: fontColor ?? CColors.black152e22,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: fontSize ?? FontSize.mediumFont,
        fontStyle: fontStyle ?? FontStyle.normal,
        decoration: decoration ?? TextDecoration.none);
  }

  static TextStyle largeStyle(
      {Color? fontColor,
      double? fontSize,
      FontWeight? fontWeight,
      FontStyle? fontStyle,
      TextDecoration? decoration}) {
    return TextStyle(
        color: fontColor ?? CColors.black152e22,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontSize: fontSize ?? FontSize.largeFont,
        fontStyle: fontStyle ?? FontStyle.normal,
        decoration: decoration ?? TextDecoration.none);
  }

  static TextStyle large400Style(
      {Color? fontColor,
      double? fontSize,
      FontWeight? fontWeight,
      FontStyle? fontStyle,
      TextDecoration? decoration}) {
    return TextStyle(
        color: fontColor ?? CColors.black152e22,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: fontSize ?? FontSize.largeFont,
        fontStyle: fontStyle ?? FontStyle.normal,
        decoration: decoration ?? TextDecoration.none);
  }
}
