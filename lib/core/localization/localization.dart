import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/services/services.dart';
// import 'package:mahaly/core/services/services.dart';

class MyLocalization extends GetxController {
  Locale? language;

  Myservices myservices = Get.find();

  changelang(locale) {
    myservices.sharedpre.setString('lang', locale);
    Locale loc = Locale(locale);
    Get.updateLocale(loc);
  }

  @override
  void onInit() {
    var lang = myservices.sharedpre.getString('lang');
    if (lang == "ar") {
      language = const Locale("ar");
    } else if (lang == "en") {
      language = const Locale("en");
    } else {
      language = Get.deviceLocale;
    }
    super.onInit();
  }
}
