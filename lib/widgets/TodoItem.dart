import 'package:flutter/material.dart';
import 'package:flutter_diary/api/Api.dart';
import 'package:flutter_diary/model/Todo.dart';

class TodoItem extends StatefulWidget {
  final Todo todo;

  TodoItem({required this.todo});

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  final ApiService apiService = ApiService();
  late bool isDone;

  @override
  void initState() {
    super.initState();
    isDone = widget.todo.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.todo.descritpion,
        style: TextStyle(
          backgroundColor: Color.fromRGBO(0, 0, 0, 0.098),
          decoration: isDone ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        value: isDone,
        onChanged: (bool? value) {
          setState(() {
            isDone = value ?? false;
            if (isDone) {
              apiService.doneTodo(widget.todo.id.toString());
            } else {
              apiService.unDoneTodo(widget.todo.id.toString());
            }
          });
        },
      ),
    );
  }
}
