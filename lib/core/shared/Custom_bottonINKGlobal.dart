import 'package:flutter/material.dart';
import 'package:mahaly/core/constant/theme/Textstyle/Textstyle.dart';

class Custom_bottonINKGlobal extends StatelessWidget {
  const Custom_bottonINKGlobal({
    super.key,
    required this.body,
    required this.title,
    required this.ontap,
    required this.mainalighnment,
  });
  final String body;
  final String title;
  final VoidCallback ontap;
  final MainAxisAlignment mainalighnment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainalighnment,
      children: [
        InkWell(
          onTap: ontap,
          child: Text(
            title,
            style: Textstyledynamic.second18,
          ),
        ),
        Text(
          body,
          style: Textstyledynamic.black18normal,
        ),
      ],
    );
  }
}
