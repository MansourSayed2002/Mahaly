import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customdivider extends StatelessWidget {
  const Customdivider({
    super.key,
    required this.indent,
  });
  final double indent;
  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: indent.w,
    );
  }
}
