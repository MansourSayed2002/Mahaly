import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahaly/core/constant/Textstyle/Textstyle.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';

class ContainerShowInfo extends StatelessWidget {
  const ContainerShowInfo({
    super.key,
    required this.icon,
    required this.title,
  });
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.0.r),
      child: ListTile(
        leading: Icon(
          icon,
          size: 30.0.r,
          color: ColorApp.sixth,
        ),
        title: Text(
          title,
          style: Textstyledynamic.white20Bold,
        ),
      ),
    );
  }
}
