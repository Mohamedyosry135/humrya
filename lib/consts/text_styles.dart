import 'package:example_structure/consts/colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle text25 = TextStyle(
      fontSize: 25.sp,
      color: const Color(ColorCode.white),
      fontWeight: FontWeight.w800,
      fontFamily: "almarai");
  static TextStyle text22 = TextStyle(
      fontSize: 22.sp,
      color: const Color(ColorCode.white),
      fontWeight: FontWeight.w700,
      height: 1.0454545454545454,
      fontFamily: "almarai");
  static TextStyle  text16 = TextStyle(
      fontSize: 16.sp,
      color: const Color(ColorCode.white),
      fontWeight: FontWeight.w700,
      height: 1.5,
      fontFamily: "almarai");
  static const  textDefault = TextStyle(
      fontSize: 16,
      color: Color(ColorCode.white),
      fontWeight: FontWeight.w700,
      height: 1.5,
      fontFamily: "almarai");
  static TextStyle text13 = TextStyle(
      fontSize: 13.sp,
      height: 1,
      color: const Color(ColorCode.white),
      fontWeight: FontWeight.w700,
      fontFamily: "almarai");
  static TextStyle text11 = TextStyle(
      fontSize: 11.sp,
      color: const Color(ColorCode.white),
      fontWeight: FontWeight.w600,
      fontFamily: "almarai");

  static TextStyle bottomNavBarItemStyle =
      TextStyle(fontFamily: "almarai", height: 1, fontSize: 13.sp);
}
