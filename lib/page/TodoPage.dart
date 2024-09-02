import 'package:flutter/material.dart';
import 'package:flutter_diary/model/Todo.dart';
import 'package:flutter_diary/widgets/TodoList.dart';

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final List<Todo> _list = [
    Todo(
      todoID: 1,
      todoTitle: '밥먹기',
      done: false,
    ),
    Todo(
      todoID: 2,
      todoTitle: '잠자기',
      done: false,
    ),
    Todo(
      todoID: 3,
      todoTitle: 'ㅡㅔ',
      done: false,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Page'),
      ),
      body: Center(
        child: Container(
          child: TodoList(todos: _list),
        ),
      ),
    );
  }
}
