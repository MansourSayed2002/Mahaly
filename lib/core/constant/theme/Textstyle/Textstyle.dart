import 'package:flutter/cupertino.dart';
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

  static TextStyle third15 = TextStyle(
    fontSize: 15.0.sp,
    color: ColorApp.thierd,
  );
  static TextStyle second18 = TextStyle(
    fontSize: 18.0.sp,
    color: ColorApp.second,
  );
}
