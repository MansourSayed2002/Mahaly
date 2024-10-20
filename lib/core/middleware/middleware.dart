import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/class/AppRouting/AppRouting.dart';
import 'package:mahaly/core/services/services.dart';

class Mymiddleware extends GetMiddleware {
  Myservices myservice = Get.find();
  @override
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    if (myservice.sharedpre.getString('step') == '1') {
      return const RouteSettings(name: AppRouting.signup);
    } else if (myservice.sharedpre.getString('step') == '2') {
      return const RouteSettings(name: AppRouting.home);
    }
    return null;
  }
}
