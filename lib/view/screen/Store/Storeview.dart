import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mahaly/controller/Store/store_controller.dart';
import 'package:mahaly/core/class/sharedpre.dart';
import 'package:mahaly/view/screen/Store/store_closed.dart';
import 'package:mahaly/view/screen/Store/store_open.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StoreController());
    return GetBuilder<StoreController>(builder: (controller) {
      if (Sharedpre.getString('store_active') == '1') {
        return const StoreOpen();
      } else {
        return const CloseStore();
      }
    });
  }
}
