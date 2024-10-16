import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/constant/Routing/Routing.dart';
import 'package:mahaly/core/localization/translation.dart';
import 'core/localization/localization.dart';

class Mahaly extends StatelessWidget {
  const Mahaly({super.key});

  @override
  Widget build(BuildContext context) {
    MyLocalization controller = Get.put(MyLocalization());
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            translations: Mytranslation(),
            // home: const CongratulationView(),
            locale: controller.language,
            getPages: getPages,
          );
        });
  }
}
