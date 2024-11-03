import 'package:get/get.dart';
import 'package:mahaly/view/screen/Home/Home_view.dart';
import 'package:mahaly/view/screen/Profile/profile_view.dart';
import 'package:mahaly/view/screen/Store/Storeview.dart';
import 'package:mahaly/view/screen/setting/setting_view.dart';

abstract class AbsHomeScreenController extends GetxController {
  List screens = [
    const Home_view(),
    const StoreView(),
    const SettingView(),
    const ProfileView(),
  ];
  int currentindex = 0;
  changeindex(index);
}

class HomescreenController extends AbsHomeScreenController {
  @override
  changeindex(index) {
    currentindex = index;
    update();
  }
}
