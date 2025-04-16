import 'package:flutter/material.dart';

class CustomColor {
  // background
  static Color bgPrimary = HexColor("D9DBE9");

  // text
  static Color textPrimary = HexColor("A8715A");
  static Color textOnPrimary = HexColor("DD8560");
  static Color textError = HexColor("CD000C");
  static Color textTitle = HexColor("202224");
  static Color textBody = HexColor("727272");

  // materialColor
  static MaterialColor white =
      MaterialColor(Colors.white.toARGB32(), const <int, Color>{
        50: Colors.white,
        100: Colors.white,
        200: Colors.white,
        300: Colors.white,
        400: Colors.white,
        500: Colors.white,
        600: Colors.white,
        700: Colors.white,
        800: Colors.white,
        900: Colors.white,
      });
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
