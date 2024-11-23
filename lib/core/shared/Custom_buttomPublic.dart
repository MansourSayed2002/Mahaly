import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Custom_buttomPublic extends StatelessWidget {
  const Custom_buttomPublic({
    super.key,
    required this.title,
    required this.color,
    this.colortext,
    required this.ontap,
  });
  final String title;
  final Color color;
  final Color? colortext;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0.r),
          color: color,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 16,
        padding: EdgeInsets.all(10.0.r),
        margin: EdgeInsets.all(10.0.r),
        child: Text(
          title,
          style: TextStyle(
            color: colortext,
            fontSize: 18.0.sp,
          ),
        ),
      ),
    );
  }
}
