import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Buttonappbarback extends StatelessWidget {
  const Buttonappbarback({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Theme.of(context).iconTheme.color,
        size: 20.0.r,
      ),
      onPressed: () {
        Get.back();
      },
    );
  }
}
