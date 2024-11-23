import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mahaly/Offline.dart';
import 'package:mahaly/core/constant/Routing/Routing.dart';
import 'package:mahaly/core/constant/theme/design_theme.dart';
import 'package:mahaly/core/localization/translation.dart';
import 'core/localization/localization.dart';

class Mahaly extends StatelessWidget {
  const Mahaly({super.key});

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (context, connectivity, child) {
        final bool connected = !connectivity.contains(ConnectivityResult.none);
        if (connected) {
          return const OnLine();
        } else {
          return const OffLine();
        }
      },
      child: const CircularProgressIndicator(),
    );
  }
}

class OnLine extends StatelessWidget {
  const OnLine({super.key});

  @override
  Widget build(BuildContext context) {
    MyLocalization controller = Get.put(MyLocalization());
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            theme: appTheme,
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            translations: Mytranslation(),
            locale: controller.language,
            getPages: getPages,
          );
        });
  }
}
