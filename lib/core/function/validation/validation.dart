import 'package:get/get.dart';

textformvalidation(int min, int max, String type, String value) {
  if (type == 'username') {
    if (!GetUtils.isUsername(value) &&
        GetUtils.capitalizeFirst(value) != true) {
      return 'it has error in username';
    }
  }

  if (type == 'emailgoogle') {
    if (!GetUtils.isEmail(value)) {
      return 'it has error in email';
    }
  }

  if (type == 'name') {
    if (!GetUtils.isAlphabetOnly(value)) {
      return 'it has error in name';
    }
  }

  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(value)) {
      return 'it has error in PhoneNamber';
    }
  }

  if (value.isEmpty) {
    return "8".tr;
  } else if (value.length > max) {
    return "9".tr;
  } else if (value.length < min) {
    return "10".tr;
  }
}
