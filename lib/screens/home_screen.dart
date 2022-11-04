import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo_app_with_provider/models/todo_model.dart';
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
          child: todoProvider.todoList.isNotEmpty
              ? Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/list_icon.png",
                          width: 25,
                          height: 24.5,
                        ),
                        const SizedBox(width: 9),
                        Text(
                          "LIST OF TODO",
                          style: headlineTextStyle,
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView(
                        children: todoProvider.todoList
                            .map((todo) => CustomListTile(todo: todo))
                            .toList(),
                      ),
                    )
                  ],
                )
              : Column(
                  children: [
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
                  ],
                )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: secondary,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (BuildContext context) => const AddEditTodoWidget(isAddButton: true,),
          );
        },
        backgroundColor: primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final TodoModel todo;

  const CustomListTile({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: secondary,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20)),
            ),
            builder: (context) => AddEditTodoWidget(
              todo: todo,
              isAddButton: false,
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            //set border radius more than 50% of height and width to make circle
          ),
          color: primary,
          child: Container(
            height: 120,
            padding: const EdgeInsets.only(
              left: 16,
              top: 10,
              right: 10,
              bottom: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        todo.title,
                        style: titleTextTyle,
                      ),
                    ),
                    Icon(
                      Icons.access_time,
                      color: white,
                      size: 18,
                    )
                  ],
                ),
                Expanded(
                  child: Text(
                    todo.description,
                    style: contentTextStyle.copyWith(height: 1.7),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  "Deadline at ${todo.deadline}",
                  style: contentSmallTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
