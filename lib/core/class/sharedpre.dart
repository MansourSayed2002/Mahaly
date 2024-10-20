import 'package:get/get.dart';
import 'package:mahaly/core/services/services.dart';

class Sharedpre {
  static Myservices myservices = Get.find();

  static setString(key, val) {
    myservices.sharedpre.setString(key, val);
  }

  static getString(key) {
    return myservices.sharedpre.get(key);
  }
}
