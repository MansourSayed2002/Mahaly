import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0.r),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Text(
            'M',
            style: TextStyle(
              fontSize: 35.0.sp,
              color: ColorApp.second,
            ),
          ),
          Positioned(
            left: 20.0.w,
            top: 5.0.h,
            child: Text(
              'y',
              style: TextStyle(
                fontSize: 35.0.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
