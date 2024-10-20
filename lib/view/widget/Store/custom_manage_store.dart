import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahaly/core/constant/theme/Textstyle/Textstyle.dart';

class CustomManageStore extends StatelessWidget {
  const CustomManageStore({
    super.key,
    required this.color,
    required this.image,
    required this.title,
    required this.ontap,
  });
  final Color color;
  final String image;
  final String title;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          alignment: Alignment.bottomRight,
          margin: EdgeInsets.all(10.0.r),
          padding: EdgeInsets.all(10.0.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0.r),
              color: color,
              image: DecorationImage(
                  image: AssetImage(image), fit: BoxFit.contain)),
          child: Text(
            title,
            style: Textstyledynamic.white20Bold,
          )),
    );
  }
}
