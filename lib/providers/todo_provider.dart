import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  void removeTodo(int index) {
    _todos.removeAt(index);
    saveTodos();
    notifyListeners();
  }

  Future<void> saveTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = json.encode(
      _todos.map((todos) => todos.toJson()).toList(),
    );
    await prefs.setString('todos', encodedData);
  }

  Future<void> loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final String? todosString = prefs.getString('todos');
    if (todosString != null) {
      final List<dynamic> docodeData = json.decode(todosString);
      _todos = docodeData.map((json) => TodoModel.fromJson(json)).toList();
      notifyListeners();
    }
  }
}
