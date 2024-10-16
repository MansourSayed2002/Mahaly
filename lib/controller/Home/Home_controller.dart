import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

abstract class AbsHomecontroller extends GetxController {
  late AdvancedDrawerController advancedDrawerController;
}

class HomeController extends AbsHomecontroller {
  @override
  void onInit() {
    advancedDrawerController = AdvancedDrawerController();
    super.onInit();
  }
}
