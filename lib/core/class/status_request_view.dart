import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mahaly/core/constant/StatusRequest/StatusRequest.dart';
import 'package:mahaly/core/constant/animated/animated.dart';

class StatusRequestView extends StatelessWidget {
  const StatusRequestView(
      {super.key, required this.statusRequest, required this.widget});
  final StatusRequest statusRequest;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(Animated.loading, height: 200.0.h))
        // : statusRequest == StatusRequest.failure
        //     ? Center(child: Image.asset(Animated.nodata, height: 200.0.h))
        : widget;
  }
}
