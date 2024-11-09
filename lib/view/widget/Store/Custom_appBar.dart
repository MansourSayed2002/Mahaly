import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/constant/theme/Textstyle/Textstyle.dart';

class Custom_appBar extends StatelessWidget {
  const Custom_appBar({
    super.key,
    required this.namestore,
    required this.image,
  });
  final String namestore;

  final String image;
  @override
  Widget build(BuildContext context) {
    return InstaImageViewer(
      child: Container(
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          color: ColorApp.fourth,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15.0.r),
            bottomRight: Radius.circular(15.0.r),
          ),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0.r),
          child: Text(
            namestore,
            style: Textstyledynamic.white20Bold,
          ),
        ),
      ),
    );
  }
}
