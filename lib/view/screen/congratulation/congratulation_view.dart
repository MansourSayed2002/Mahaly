import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/constant/image/imageapp.dart';
import 'package:mahaly/core/function/sizedbox.dart';
import 'package:mahaly/core/shared/Custom_buttomPublic.dart';
import 'package:mahaly/view/screen/Auth/Register_view.dart';

class CongratulationView extends StatelessWidget {
  const CongratulationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200.0.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageApp.congrat),
              ),
            ),
          ),
          heightsizedBox(100.0),
          Custom_buttomPublic(
            title: 'Go To Register',
            color: ColorApp.second,
            colortext: ColorApp.thierd,
            ontap: () {
              Get.offAll(() => const Register_view(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(milliseconds: 300));
            },
          ),
        ],
      ),
    );
  }
}
