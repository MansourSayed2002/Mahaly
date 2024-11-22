import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahaly/core/constant/theme/Color/ColorApp.dart';

class Custom_textFormGlobal extends StatelessWidget {
  const Custom_textFormGlobal({
    super.key,
    required this.label,
    this.hint,
    this.controllerForm,
    this.suffixicon,
    this.validator,
    required this.obscureText,
    this.labelcolor,
    this.borderColor,
    this.hintColor,
    this.fillColor,
    this.filled,
    this.maxLines,
    this.contentpanding,
    this.keyboardtype,
    this.textcolor,
    this.cursorColor,
  });
  final String label;
  final String? hint;
  final TextEditingController? controllerForm;
  final Widget? suffixicon;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Color? labelcolor;
  final Color? borderColor;
  final Color? hintColor;
  final bool? filled;
  final Color? fillColor;
  final Color? cursorColor;
  final Color? textcolor;

  final int? maxLines;
  final TextInputType? keyboardtype;
  final EdgeInsetsGeometry? contentpanding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(14.0.r),
      child: TextFormField(
        maxLines: maxLines,
        validator: validator,
        controller: controllerForm,
        keyboardType: keyboardtype,
        style: TextStyle(
          color: textcolor ?? ColorApp.thierd,
          fontSize: 20.0.sp,
        ),
        cursorColor: cursorColor ?? ColorApp.thierd,
        obscureText: obscureText,
        decoration: InputDecoration(
            fillColor: fillColor,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Text(label),
            suffixIcon: suffixicon,
            filled: filled ?? false,
            hintText: hint,
            hintStyle: TextStyle(
              color: hintColor ?? ColorApp.thierd,
              fontSize: 15.0.sp,
            ),
            labelStyle: TextStyle(
              color: labelcolor ?? ColorApp.second,
              fontSize: 20.0.sp,
              fontWeight: FontWeight.bold,
            ),
            contentPadding: contentpanding ?? EdgeInsets.all(10.0.r),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? ColorApp.second,
              ),
              borderRadius: BorderRadius.circular(20.0.r),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorApp.thierd,
              ),
              borderRadius: BorderRadius.circular(20.0.r),
            )),
      ),
    );
  }
}
