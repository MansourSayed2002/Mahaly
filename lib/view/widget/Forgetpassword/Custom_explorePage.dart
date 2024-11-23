import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';

class Custom_explorePage extends StatelessWidget {
  const Custom_explorePage({
    super.key,
    required this.title,
    required this.body,
  });
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 30.0.sp,
            fontWeight: FontWeight.bold,
            color: ColorApp.thierd,
          ),
        ),
        SizedBox(
          height: 10.0.h,
        ),
        Text(
          body,
          style: TextStyle(
            fontSize: 18.0.sp,
            color: ColorApp.thierd,
          ),
        ),
      ],
    );
  }
}
