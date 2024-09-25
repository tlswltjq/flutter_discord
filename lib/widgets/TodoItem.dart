import 'package:flutter/material.dart';
import 'package:flutter_diary/api/Api.dart';
import 'package:flutter_diary/model/Todo.dart';

class TodoItem extends StatefulWidget {
  final Todo todo;
  final ApiService apiService = ApiService();

  TodoItem({required this.todo});

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  final ApiService apiService = ApiService();
  TextEditingController _textFieldController = TextEditingController();

  late bool isDone;

  @override
  void initState() {
    super.initState();
    isDone = widget.todo.isDone;
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('update description'),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: 'Enter your todo'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Submit'),
              onPressed: () async {
                Navigator.of(context).pop();
                String todoText = _textFieldController.text;
                await apiService.updateTodo(widget.todo.id.toString(), todoText);
                _textFieldController.clear();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        print(widget.todo.descritpion + " 번 아이템 꾹 누르기");
        _showDialog(context);
      },
      child: ListTile(
        title: Text(
          widget.todo.descritpion,
          style: TextStyle(
            backgroundColor: Color.fromRGBO(0, 0, 0, 0.098),
            decoration:
                isDone ? TextDecoration.lineThrough : TextDecoration.none,
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
      ),
    );
  }
}
