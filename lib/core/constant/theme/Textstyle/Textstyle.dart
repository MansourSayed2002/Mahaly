import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';

class Textstyledynamic {
  static TextStyle white20Bold = TextStyle(
    color: ColorApp.thierd,
    fontSize: 20.0.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: .6.r,
  );

  static TextStyle white16Blod = TextStyle(
    fontSize: 16.0.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: .6.r,
    color: ColorApp.thierd,
  );

  static TextStyle second18 = TextStyle(
    fontSize: 18.0.sp,
    color: ColorApp.second,
  );

  static TextStyle black18normal = TextStyle(
    fontSize: 18.0.sp,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );
  static TextStyle black10normal = TextStyle(
    fontSize: 12.0.sp,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );
  static TextStyle black20Bold = TextStyle(
    color: Colors.black,
    fontSize: 20.0.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: .6.r,
  );
}
