import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahaly/core/constant/Textstyle/Textstyle.dart';

class CustomContaineritemDrawer extends StatelessWidget {
  const CustomContaineritemDrawer({
    super.key,
    required this.iconData,
    required this.ontap,
    required this.title,
  });
  final String title;
  final IconData iconData;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0.r),
      child: InkWell(
        onTap: ontap,
        child: ListTile(
          leading: Icon(
            iconData,
            size: 40.0.r,
          ),
          title: Text(
            title,
            style: Textstyledynamic.white20Bold,
          ),
        ),
      ),
    );
  }
}
