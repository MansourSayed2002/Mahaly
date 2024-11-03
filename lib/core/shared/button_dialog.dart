import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahaly/core/constant/theme/Textstyle/Textstyle.dart';

class ButtonDialog extends StatelessWidget {
  const ButtonDialog({
    super.key,
    required this.colorbutton,
    required this.textStyletitle,
    required this.ontap,
    required this.title,
  });
  final VoidCallback ontap;
  final String title;
  final Color colorbutton;
  final TextStyle textStyletitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 100.0,
        alignment: Alignment.center,
        padding: EdgeInsets.all(10.0.r),
        decoration: BoxDecoration(
          color: colorbutton,
          borderRadius: BorderRadius.circular(20.0.r),
        ),
        child: Text(
          title,
          style: Textstyledynamic.white16Blod,
        ),
      ),
    );
  }
}
