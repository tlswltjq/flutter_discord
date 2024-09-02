import 'package:flutter/material.dart';
import 'package:flutter_diary/model/Todo.dart';
import 'package:flutter_diary/widgets/TodoItem.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;

  TodoList({required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return TodoItem(todo: todos[index]);
      },
    );
  }
}
