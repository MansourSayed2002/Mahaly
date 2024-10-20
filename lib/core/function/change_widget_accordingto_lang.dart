import 'package:mahaly/core/class/sharedpre.dart';

changeWidgetaccordingtoLang(widgetar, widgeten) {
  if (Sharedpre.getString('lang') == 'ar') {
    return widgetar;
  } else if (Sharedpre.getString('lang') == 'en') {
    return widgeten;
  } else {
    return widgetar;
  }
}
