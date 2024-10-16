abstract class TodoService {
  Future<String> addTodo(String description, String listId);
  Future<String> doneTodo(String todoId);
  Future<String> unDoneTodo(String todoId);
  Future<String> deleteTodo(String todoId);
  Future<String> updateTodo(String todoId, String description);
}
