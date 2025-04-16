import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/config/styles/custom_color.dart';
import 'package:flutter_ecommerce_app/config/styles/custom_text_style.dart';

class CustomTextTheme {
  static TextTheme createTextTheme() {
    final customTextStyle = CustomTextStyle();
    return TextTheme(
      headlineLarge: TextStyle(
        color: CustomColor.textTitle,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
      ).merge(customTextStyle.fontSize32sp),
      headlineMedium: TextStyle(
        color: CustomColor.textTitle,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
      ).merge(customTextStyle.fontSize28sp),
      headlineSmall: TextStyle(
        color: CustomColor.textTitle,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
      ).merge(customTextStyle.fontSize24sp),
      titleLarge: TextStyle(
        color: CustomColor.textTitle,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ).merge(customTextStyle.fontSize20sp),
      titleMedium: TextStyle(
        color: CustomColor.textTitle,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ).merge(customTextStyle.fontSize18sp),
      titleSmall: TextStyle(
        color: CustomColor.textTitle,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ).merge(customTextStyle.fontSize16sp),
      bodyLarge: TextStyle(
        color: CustomColor.textBody,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ).merge(customTextStyle.fontSize15sp),
      bodyMedium: TextStyle(
        color: CustomColor.textBody,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ).merge(customTextStyle.fontSize14sp),
      bodySmall: TextStyle(
        color: CustomColor.textBody,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ).merge(customTextStyle.fontSize12sp),
    );
  }
}
