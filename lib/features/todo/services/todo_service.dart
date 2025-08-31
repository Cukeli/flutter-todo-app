import 'package:flutterbasic/core/api/api_service.dart';
import '../models/todo.dart';

class TodoService {
  // Get all todos
  static Future<List<Todo>> getTodos() async {
    final todosData = await ApiService.getTodos();
    return todosData.map((json) => Todo.fromJson(json)).toList();
  }

  // Create a new todo
  static Future<Todo> createTodo(String title, String? description) async {
    final todoData = {
      'title': title,
      'description': description,
      'created_at': DateTime.now().toIso8601String(),
    };
    final response = await ApiService.createTodo(todoData);
    return Todo.fromJson(response);
  }

  // Update a todo
  static Future<Todo> updateTodo(Todo todo) async {
    final todoData = todo.toJson();
    final response = await ApiService.updateTodo(todo.id!, todoData);
    return Todo.fromJson(response);
  }

  // Toggle todo completion status
  static Future<Todo> toggleTodoStatus(Todo todo) async {
    final updatedTodo = todo.copyWith(completed: !todo.completed);
    return await updateTodo(updatedTodo);
  }

  // Delete a todo
  static Future<bool> deleteTodo(int id) async {
    return await ApiService.deleteTodo(id);
  }
}
