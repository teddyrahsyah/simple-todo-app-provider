import 'package:flutter/material.dart';
import 'package:simple_todo_app_with_provider/shared/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: Text(
          "TO DO LIST",
          style: appBarTitleTextStyle,
        ),
        actions: [
          Icon(
            Icons.settings,
            color: secondary,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
