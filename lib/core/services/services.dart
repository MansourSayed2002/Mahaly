import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myservices extends GetxService {
  late SharedPreferences sharedpre;

  Future<Myservices> init() async {
    sharedpre = await SharedPreferences.getInstance();
    return this;
  }
}

Future initservices() async {
  await Get.putAsync(() => Myservices().init());
}
