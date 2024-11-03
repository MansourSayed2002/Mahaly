import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaly/core/function/change_widget_accordingto_lang.dart';

class Buttonappbarback extends StatelessWidget {
  const Buttonappbarback({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        changeWidgetaccordingtoLang(Icons.arrow_back, Icons.arrow_forward),
        color: Theme.of(context).iconTheme.color,
      ),
      onPressed: () {
        Get.back();
      },
    );
  }
}
