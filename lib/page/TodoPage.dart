import 'package:flutter/material.dart';
import 'package:flutter_diary/api/Api.dart';
import 'package:flutter_diary/model/Todo.dart';
import 'package:flutter_diary/widgets/TodoList.dart';

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final ApiService apiService = ApiService();
  List<Todo> _list = [];

  @override
  void initState() {
    super.initState();
    _fetchTodoList();
  }

  Future<void> _fetchTodoList() async {
    try {
      final listId = '1';
      List<Todo> todos = await apiService.getTodoList(listId);
      setState(() {
        _list = todos;
      });
    } catch (e) {
      // Handle error
      print('Failed to fetch todo list: $e');
    }
  }

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
