import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/class/sharedpre.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/constant/theme/Textstyle/Textstyle.dart';

ThemeData appTheme = DesignTheme.light;

class DesignTheme {
  static changetheme(theme) {
    Sharedpre.setString('theme', theme);
    if (theme == 'dark') {
      appTheme = DesignTheme.dark;
    } else {
      appTheme = DesignTheme.light;
    }
    Get.changeTheme(appTheme);
  }

  static ThemeData light = ThemeData(
    fontFamily: Sharedpre.getString('lang') == 'en' ? "poppins" : "cairo",
    scaffoldBackgroundColor: ColorApp.thierd,
    appBarTheme: const AppBarTheme(
      color: ColorApp.thierd,
      elevation: 0.0,
    ),
    textTheme: TextTheme(
      labelMedium: Textstyledynamic.black18normal,
      titleMedium: Textstyledynamic.black20Bold,
      titleSmall: Textstyledynamic.black10normal,
    ),
    iconTheme: const IconThemeData(
      color: ColorApp.sixth,
    ),
    primaryColor: ColorApp.sixth,
    cardColor: ColorApp.primary,
  );

  static ThemeData dark = ThemeData(
    fontFamily: Sharedpre.getString('lang') == 'en' ? "poppins" : "cairo",
    scaffoldBackgroundColor: ColorApp.primary,
    appBarTheme: const AppBarTheme(
      color: ColorApp.primary,
      elevation: 0.0,
    ),
    textTheme: TextTheme(
      labelMedium: Textstyledynamic.black18normal.copyWith(color: Colors.white),
      titleMedium: Textstyledynamic.black20Bold.copyWith(color: Colors.white),
      titleSmall: Textstyledynamic.black10normal.copyWith(color: Colors.white),
    ),
    iconTheme: const IconThemeData(
      color: ColorApp.second,
    ),
    primaryColor: ColorApp.primary,
    cardColor: Colors.green,
  );
}
