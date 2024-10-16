import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';

class Custom_bottonINKGlobal extends StatelessWidget {
  const Custom_bottonINKGlobal({
    super.key,
    required this.body,
    required this.title,
    required this.ontap,
    required this.mainalighnment,
  });
  final String body;
  final String title;
  final VoidCallback ontap;
  final MainAxisAlignment mainalighnment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainalighnment,
      children: [
        InkWell(
          onTap: ontap,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18.0.sp,
              color: ColorApp.second,
            ),
          ),
        ),
        Text(
          body,
          style: TextStyle(
            fontSize: 15.0.sp,
            color: ColorApp.thierd,
          ),
        ),
      ],
    );
  }
}
