import 'package:flutter_diary/model/Todo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class TodoListService {
  Future<List<Todo>> getTodoList(String listId);
}

abstract class TodoService {}

class ApiService implements TodoListService, TodoService {
  String baseUrl = "http://localhost:8080";

  @override
  Future<List<Todo>> getTodoList(String listId) async {
    final url = Uri.parse('$baseUrl/list?listId=$listId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> todoListJson = jsonResponse['todoList'];
      return todoListJson.map((todo) => Todo.fromJson(todo)).toList();
    } else {
      throw Exception('Failed to load todo list');
    }
  }
}