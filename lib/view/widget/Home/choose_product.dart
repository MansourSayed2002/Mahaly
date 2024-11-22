import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/constant/image/imageapp.dart';
import 'package:mahaly/core/constant/theme/Textstyle/Textstyle.dart';

class Choosecategory extends StatelessWidget {
  const Choosecategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 130.0.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(10.0.r),
        physics: const BouncingScrollPhysics(),
        children: [
          CustomItemScrollProduct(
            image: ImageApp.clothes,
            title: '46'.tr,
          ),
          CustomItemScrollProduct(
            image: ImageApp.sneaker,
            title: "47".tr,
          ),
          CustomItemScrollProduct(
            image: ImageApp.mobile,
            title: "48".tr,
          ),
          CustomItemScrollProduct(
            image: ImageApp.laptop,
            title: "49".tr,
          ),
          CustomItemScrollProduct(
            image: ImageApp.futniture,
            title: "50".tr,
          ),
          CustomItemScrollProduct(
            image: ImageApp.washingmachine,
            title: "51".tr,
          ),
        ],
      ),
    );
  }
}

class CustomItemScrollProduct extends StatelessWidget {
  const CustomItemScrollProduct({
    super.key,
    required this.image,
    required this.title,
  });
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 60.0.h,
          width: 60.0.w,
          margin: EdgeInsets.all(10.0.r),
          padding: EdgeInsets.all(5.0.r),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).iconTheme.color!,
              width: 4.0.w,
            ),
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Image.asset(image),
        ),
        Text(
          title,
          style: Textstyledynamic.white16Blod,
        )
      ],
    );
  }
}
