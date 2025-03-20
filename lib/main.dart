import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_monstr/providers/todo_provider.dart';
import 'package:to_do_app_monstr/screens/todo_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => TodoProvider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo app monstr',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: TodoScreen(),
    );
  }
}
