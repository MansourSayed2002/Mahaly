import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/function/sizedbox.dart';

class SnackbarChangeImage extends StatelessWidget {
  const SnackbarChangeImage({
    super.key,
    required this.ontapcamera,
    required this.ontapgallery,
  });
  final VoidCallback ontapcamera;
  final VoidCallback ontapgallery;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: ontapcamera,
            child: Icon(
              Icons.camera_alt_outlined,
              size: 70.0.r,
              color: ColorApp.second,
            ),
          ),
          widthsizedBox(100.0),
          InkWell(
            onTap: ontapgallery,
            child: Icon(
              Icons.photo_library_outlined,
              size: 70.0.r,
              color: ColorApp.sixth,
            ),
          ),
        ],
      ),
    );
  }
}
