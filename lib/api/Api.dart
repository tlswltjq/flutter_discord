import 'package:flutter_diary/model/Todo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class TodoListService {
  Future<List<Todo>> getTodoList(String listId);
  Future<String> createTodoList(String name);
  // Future<List<Todo>> updateTodoListName(String name, String listId);
  // Future<String> deleteTodoList(String listId);
}

abstract class TodoService {
  Future<String> addTodo(String description, String listId);
}

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
  
  @override
  Future<String> createTodoList(String name) async {
    final url = Uri.parse('$baseUrl/list?name=$name');
    final response = await http.post(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to create todo list');
    }
  }
  
  @override
  Future<String> addTodo(String description, String listId) async{
    final url = Uri.parse('$baseUrl/todo?desc=$description&list=$listId');
    final response = await http.post(url);
    
    if(response.statusCode == 200){
        return response.body;
    }else{
      throw Exception('Failed to create todo list');
    }
  }
  
  // @override
  // Future<String> deleteTodoList(String listId) {
  //   // TODO: implement deleteTodoList
  // }
  
  // @override
  // Future<List<Todo>> updateTodoListName(String name, String listId) {
  //   // TODO: implement updateTodoListName
  // }
}