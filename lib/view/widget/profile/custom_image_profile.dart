import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahaly/core/constant/Links/Links.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';

class CustomImageProfile extends StatelessWidget {
  const CustomImageProfile({
    super.key,
    this.image,
    required this.ontapchangeimage,
  });

  final String? image;
  final VoidCallback ontapchangeimage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        image != 'none'
            ? CircleAvatar(
                radius: 80.0.r,
                backgroundColor: ColorApp.fourth,
                backgroundImage:
                    NetworkImage("${Applink.dirImageProfile}/$image"))
            : CircleAvatar(
                radius: 80.0.r,
                backgroundColor: ColorApp.fourth,
                child: Icon(
                  Icons.person_2_outlined,
                  size: 150.0.r,
                ),
              ),
        Positioned(
          bottom: 10.0.r,
          right: 10,
          child: InkWell(
            onTap: ontapchangeimage,
            child: Icon(
              CupertinoIcons.pencil_circle_fill,
              color: Theme.of(context).iconTheme.color,
              size: 33.0.r,
            ),
          ),
        ),
      ],
    );
  }
}
