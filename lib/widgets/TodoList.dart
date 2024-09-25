import 'package:flutter/material.dart';
import 'package:flutter_diary/api/Api.dart';
import 'package:flutter_diary/model/Todo.dart';
import 'package:flutter_diary/widgets/TodoItem.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final Function(Todo) onDismissed;
  ApiService apiService = ApiService();
  TodoList({required this.todos, required this.onDismissed});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return Dismissible(
          key: Key(todo.id.toString()),
          child: TodoItem(todo: todo),
          onDismissed: (direction) async {
            onDismissed(todo);
            String result = await apiService.deleteTodo(todo.id.toString());
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(result),
              ),
            );
          },
          direction: DismissDirection.endToStart,
          background: Container(color: Colors.yellow),
        );
      },
    );
  }
}
