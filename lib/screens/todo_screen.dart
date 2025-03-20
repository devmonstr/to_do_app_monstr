import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_monstr/providers/todo_provider.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});
  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              spacing: 18.0,
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: InputDecoration(
                      hintText: 'Enter Task',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                  width: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      if (_taskController.text.isNotEmpty) {
                        Provider.of<TodoProvider>(
                          context,
                          listen: false,
                        ).addTodos(_taskController.text);
                        _taskController.clear();
                      }
                    },
                    child: Text('Add'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<TodoProvider>(
              builder: (context, TodoProvider, child) {
                return ListView.builder(
                  itemCount: TodoProvider.todos.length,
                  itemBuilder: (context, index) {
                    final todo = TodoProvider.todos[index];
                    return Slidable(
                      startActionPane: ActionPane(
                        motion: const DrawerMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              TodoProvider.removeTodo(index);
                            },
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      endActionPane: ActionPane(
                        motion: DrawerMotion(),
                        children: [
                          SlidableAction(
                            onPressed: null,
                            backgroundColor: Color(0xFF7BC043),
                            foregroundColor: Colors.white,
                            icon: Icons.archive,
                            label: 'Archive',
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(todo.title),
                        /* trailing: IconButton(
                          onPressed: () {
                            TodoProvider.removeTodo(index);
                          },
                          icon: Icon(Icons.delete),
                        ), */
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
