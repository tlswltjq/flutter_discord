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
  TextEditingController _textFieldController = TextEditingController();
  final listId = '1';

  @override
  void initState() {
    super.initState();
    _fetchTodoList();
  }

  Future<void> _fetchTodoList() async {
    try {
      List<Todo> todos = await apiService.getTodoList(listId);
      setState(() {
        _list = todos;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Fetching done...'),
          ),
        );
      });
    } catch (e) {
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
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_task),
          onPressed: () {
            _showDialog(context);
          }),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add a new todo'),
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
                await apiService.addTodo(todoText, listId);
                _textFieldController.clear();
                _fetchTodoList();
              },
            ),
          ],
        );
      },
    );
  }
}
