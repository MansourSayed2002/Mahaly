import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/constant/theme/Textstyle/Textstyle.dart';
import 'package:mahaly/core/function/sizedbox.dart';

class CustomFloatingButtomGlobal extends StatelessWidget {
  const CustomFloatingButtomGlobal({
    super.key,
    required this.iconData,
    required this.ontap,
    required this.title,
    required this.width,
  });

  final IconData iconData;
  final VoidCallback ontap;
  final String title;
  final double width;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: width.w,
        padding: EdgeInsets.all(12.0.r),
        decoration: BoxDecoration(
            color: ColorApp.fifth, borderRadius: BorderRadius.circular(20.0.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 23.0.r,
              color: Theme.of(context).iconTheme.color,
            ),
            widthsizedBox(4.0),
            Text(
              title,
              style: Textstyledynamic.black10normal
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
