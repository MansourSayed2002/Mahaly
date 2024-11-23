import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/class/sharedpre.dart';
import 'package:mahaly/core/constant/theme/Textstyle/Textstyle.dart';
import 'package:mahaly/core/localization/localization.dart';

class DialogChangeLang extends GetView<MyLocalization> {
  const DialogChangeLang({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(10.0.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ButtonChange(
            iconData: Sharedpre.getString('lang') == 'ar'
                ? Icons.done_all_outlined
                : null,
            ontap: () {
              controller.changelang('ar');
              Get.back();
            },
            title: '4'.tr,
          ),
          ButtonChange(
            iconData: Sharedpre.getString('lang') == 'en'
                ? Icons.done_all_outlined
                : null,
            ontap: () {
              controller.changelang('en');
              Get.back();
            },
            title: '5'.tr,
          )
        ],
      ),
    );
  }
}

class ButtonChange extends StatelessWidget {
  const ButtonChange(
      {super.key, required this.title, required this.ontap, this.iconData});
  final String title;
  final VoidCallback ontap;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.all(10.0.r),
        child: Row(
          children: [
            Text(
              title,
              style: Textstyledynamic.black18normal,
            ),
            const Spacer(),
            Icon(
              iconData,
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
