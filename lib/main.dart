import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_monstr/providers/todo_provider.dart';
import 'package:to_do_app_monstr/screens/todo_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: TodoScreen(),
    ),
  );
}
