import 'package:flutter/material.dart';
import 'package:simple_todo_app_with_provider/shared/theme.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final int maxLines;
  final EdgeInsets margin;
  final Icon? suffixIcon;
  final Function()? onTap;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.controller,
    this.maxLines = 1,
    this.margin = EdgeInsets.zero,
    this.suffixIcon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextFormField(
        controller: controller,
        cursorColor: white,
        style: contentTextStyle,
        maxLines: maxLines,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          suffixIcon: suffixIcon,
          labelText: labelText,
          labelStyle: contentTextStyle,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: white,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: white,
              width: 2.0,
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
