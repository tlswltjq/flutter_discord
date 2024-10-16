import 'package:flutter_diary/model/Todo.dart';

abstract class TodoListService {
  Future<List<Todo>> getTodoList(String listId);
  Future<String> createTodoList(String name);
  // Future<List<Todo>> updateTodoListName(String name, String listId);
  // Future<String> deleteTodoList(String listId);
}