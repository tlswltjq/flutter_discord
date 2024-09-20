
import 'package:flutter/material.dart';
import 'package:flutter_diary/model/Todo.dart';

class TodoItem extends StatefulWidget {
  final Todo todo;

  TodoItem({required this.todo});

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  late bool isCompleted;

  @override
  void initState() {
    super.initState();
    isCompleted = widget.todo.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.todo.descritpion,
        style: TextStyle(
          backgroundColor: Color.fromRGBO(255, 0, 0, 0.1),
          decoration: isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        value: isCompleted,
        onChanged: (bool? value) {
          setState(() {
            isCompleted = value ?? false;
          });
        },
      ),
    );
  }
}