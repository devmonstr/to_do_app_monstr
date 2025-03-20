import 'package:flutter/material.dart';
import 'package:to_do_app_monstr/models/todo_model.dart';

class TodoProvider with ChangeNotifier {
  List<TodoModel> _todos = [];
  List<TodoModel> get todos => _todos;

  TodoProvider() {
    loadTodos();
  }

  void addTodos(String title) {
    _todos.add(TodoModel(title: title));
    saveTodos();
    notifyListeners();
  }

  Future<void> loadTodos() async {}

  Future<void> saveTodos() async {}
}
