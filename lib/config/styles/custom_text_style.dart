import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/config/styles/custom_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextStyle {
  // adjustable fontSize
  //　automatically changes depending on screen size
  final TextStyle fontSize36sp = TextStyle(fontSize: 36.sp);
  final TextStyle fontSize25sp = TextStyle(fontSize: 25.sp);
  final TextStyle fontSize32sp = TextStyle(fontSize: 32.sp);
  final TextStyle fontSize28sp = TextStyle(fontSize: 28.sp);
  final TextStyle fontSize26sp = TextStyle(fontSize: 26.sp);
  final TextStyle fontSize24sp = TextStyle(fontSize: 24.sp);
  final TextStyle fontSize22sp = TextStyle(fontSize: 22.sp);
  final TextStyle fontSize20sp = TextStyle(fontSize: 20.sp);
  final TextStyle fontSize18sp = TextStyle(fontSize: 18.sp);
  final TextStyle fontSize17sp = TextStyle(fontSize: 17.sp);
  final TextStyle fontSize16sp = TextStyle(fontSize: 16.sp);
  final TextStyle fontSize15sp = TextStyle(fontSize: 15.sp);
  final TextStyle fontSize14sp = TextStyle(fontSize: 14.sp);
  final TextStyle fontSize12sp = TextStyle(fontSize: 12.sp);

  // static fontSize
  // does not change with screen size.
  static const TextStyle fontSize32 = TextStyle(fontSize: 32);
  static const TextStyle fontSize30 = TextStyle(fontSize: 30);
  static const TextStyle fontSize28 = TextStyle(fontSize: 28);
  static const TextStyle fontSize24 = TextStyle(fontSize: 24);
  static const TextStyle fontSize22 = TextStyle(fontSize: 22);
  static const TextStyle fontSize20 = TextStyle(fontSize: 20);
  static const TextStyle fontSize18 = TextStyle(fontSize: 18);
  static const TextStyle fontSize16 = TextStyle(fontSize: 16);
  static const TextStyle fontSize14 = TextStyle(fontSize: 14);
  static const TextStyle fontSize12 = TextStyle(fontSize: 12);

  // fontWeight
  static const TextStyle fontWeightNormal = TextStyle(
    fontWeight: FontWeight.normal,
  );
  static const TextStyle fontWeightBold = TextStyle(
    fontWeight: FontWeight.w700,
  );

  // fontColor
  static TextStyle fontColorPrimary = TextStyle(color: CustomColor.textPrimary);
  static TextStyle fontColorOnPrimary = TextStyle(
    color: CustomColor.textOnPrimary,
  );
  static TextStyle fontColorError = TextStyle(color: CustomColor.textError);
}
