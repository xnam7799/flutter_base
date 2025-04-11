import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/config/styles/theme/custom_text_theme.dart';

class CustomTheme {
  static ThemeData createTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: "Tenor Sans",
      textTheme: CustomTextTheme.createTextTheme(),
    );
  }
}
