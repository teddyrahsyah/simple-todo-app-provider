import 'package:flutter/material.dart';
import 'package:simple_todo_app_with_provider/models/todo_model.dart';

class TodoListProvider extends ChangeNotifier {
  List<TodoModel> _todoList = [];

  List<TodoModel> get todoList => _todoList;

  void addTodo(TodoModel todo) {
    _todoList.add(todo);
    notifyListeners();
  }
}