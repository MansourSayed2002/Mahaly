import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/constant/theme/Textstyle/Textstyle.dart';

class Custom_appBar extends StatelessWidget {
  const Custom_appBar({
    super.key,
    required this.namestore,
    required this.ontapchangephoto,
  });
  final namestore;
  final ontapchangephoto;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorApp.fourth,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back_outlined,
                    size: 30.0,
                    color: ColorApp.thierd,
                  ),
                ),
                InkWell(
                  onTap: ontapchangephoto,
                  child: const Icon(
                    Icons.change_circle_outlined,
                    size: 40.0,
                    color: ColorApp.thierd,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 170.0,
            ),
            Text(
              namestore,
              style: Textstyledynamic.white20Bold,
            ),
          ],
        ),
      ),
    );
  }
}
