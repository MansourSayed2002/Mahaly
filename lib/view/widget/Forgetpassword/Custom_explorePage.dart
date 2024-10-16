import 'package:flutter/material.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';

class Custom_explorePage extends StatelessWidget {
  const Custom_explorePage({
    super.key,
    required this.title,
    this.body,
  });
  final title;
  final body;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: ColorApp.thierd,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          body,
          style: const TextStyle(
            fontSize: 18.0,
            color: ColorApp.thierd,
          ),
        ),
      ],
    );
  }
}
