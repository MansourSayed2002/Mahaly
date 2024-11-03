import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaly/controller/Home/homescreen_controller.dart';
import 'package:mahaly/view/widget/Home/custom_bottom_nvigation_bar.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomescreenController());
    return Scaffold(
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: GetBuilder<HomescreenController>(
          builder: (controller) =>
              controller.screens.elementAt(controller.currentindex),
        ));
  }
}
