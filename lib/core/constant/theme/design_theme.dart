import 'package:flutter/material.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';
import 'package:mahaly/core/constant/theme/Textstyle/Textstyle.dart';

ThemeData appTheme = DesignTheme.light;

class DesignTheme {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: ColorApp.thierd,
    appBarTheme: const AppBarTheme(
      color: ColorApp.thierd,
      elevation: 0.0,
    ),
    textTheme: TextTheme(
      labelMedium: Textstyledynamic.black18normal,
      titleMedium: Textstyledynamic.black20Bold,
      bodyMedium: Textstyledynamic.black18normal,
    ),
    iconTheme: const IconThemeData(
      color: ColorApp.sixth,
    ),
    primaryColor: ColorApp.sixth,
    cardColor: Colors.black,
  );

  // static ThemeData dark = ThemeData(
  //   scaffoldBackgroundColor: ColorApp.thierd,
  //   appBarTheme: const AppBarTheme(
  //     color: ColorApp.thierd,
  //     elevation: 0.0,
  //   ),
  //   textTheme: TextTheme(
  //     labelMedium: Textstyledynamic.black18normal,
  //     titleMedium: Textstyledynamic.black20Bold,
  //     bodyMedium: Textstyledynamic.black18normal,
  //   ),
  //   iconTheme: const IconThemeData(
  //     color: ColorApp.second,
  //   ),
  //   primaryColor: ColorApp.primary,
  //   cardColor: ColorApp.thierd,
  // );
}
