import 'package:flutter/material.dart';
import 'package:simple_todo_app_with_provider/shared/theme.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final String content;

  const InfoWidget({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      title: Text(
        title,
        style: headlineTextStyle,
        textAlign: TextAlign.center,
      ),
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                content,
                style: contentTextStyle.copyWith(color: black),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
