import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.iconDataleading,
    required this.iconDatatrailing,
    required this.title,
    required this.ontap,
  });
  final String title;
  final IconData iconDataleading;
  final IconData iconDatatrailing;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0.r),
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        leading: Container(
            padding: EdgeInsets.all(10.0.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorApp.primary.withOpacity(.8),
            ),
            child: Icon(
              iconDataleading,
              color: Theme.of(context).iconTheme.color,
            )),
        trailing: InkWell(
          onTap: ontap,
          child: Container(
              padding: EdgeInsets.all(10.0.r),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black12,
              ),
              child: Icon(
                iconDatatrailing,
                color: ColorApp.fourth.withOpacity(.4),
              )),
        ),
      ),
    );
  }
}
