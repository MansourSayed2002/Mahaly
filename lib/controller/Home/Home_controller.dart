import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AbsHomecontroller extends GetxController {
  late TextEditingController search;
}

class HomeController extends AbsHomecontroller {
  @override
  void onInit() {
    search = TextEditingController();
    super.onInit();
  }
}
