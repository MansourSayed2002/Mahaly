import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahaly/core/constant/Links/Links.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/function/sizedbox.dart';

class CustomCardItems extends StatelessWidget {
  const CustomCardItems({
    super.key,
    required this.image,
    required this.price,
    required this.title,
  });
  final String image;
  final String title;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0.r),
      padding: EdgeInsets.all(10.0.r),
      decoration: BoxDecoration(
          color: ColorApp.fourth.withOpacity(.2),
          borderRadius: BorderRadius.circular(20.0.r)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0.r),
                    image: DecorationImage(
                        image:
                            NetworkImage("${Applink.dirImageProduct}/$image"),
                        fit: BoxFit.cover)),
                width: 200.0.w,
                height: 140.0.h,
              ),
              Positioned(
                right: 10.0,
                top: 10.0,
                child: Container(
                  width: 30.0.w,
                  height: 30.0.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorApp.fifth,
                  ),
                  child: const Icon(
                    Icons.favorite_outline,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          heightsizedBox(4.0),
          Opacity(
            opacity: .5,
            child: Text(
              title,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
          ),
          Text(
            '\$$price',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
