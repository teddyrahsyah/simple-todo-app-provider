import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo_app_with_provider/providers/todo_list_provider.dart';
import 'package:simple_todo_app_with_provider/shared/theme.dart';
import 'package:simple_todo_app_with_provider/widgets/add_edit_todo_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoListProvider todoProvider = context.watch<TodoListProvider>();
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(
              Icons.settings,
              color: secondary,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: ListView(
            children: todoProvider.todoList.isNotEmpty
                ? []
                : [
                    Center(
                      child: Text(
                        "No Todo Exist!",
                        style: headlineTextStyle,
                      ),
                    ),
                    Center(
                      child: Text(
                        "Create your To-Do now",
                        style: contentTextStyle.copyWith(color: primary),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height -
                          MediaQuery.of(context).size.width,
                      child: Center(
                        child: Image.asset("assets/no_todo_img.png"),
                      ),
                    )
                  ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: secondary,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (BuildContext context) => AddEditTodoWidget(),
          );
        },
        backgroundColor: primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
