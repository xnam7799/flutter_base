import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/config/styles/custom_color.dart';
import 'package:flutter_ecommerce_app/config/styles/theme/custom_text_theme.dart';

class CustomTheme {
  static ThemeData createTheme() {
    return ThemeData(
      primarySwatch: CustomColor.white,
      fontFamily: "Montserrat",
      textTheme: CustomTextTheme.createTextTheme(),
    );
  }
}
