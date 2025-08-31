import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/app_config.dart';

class ApiService {
  static String get baseUrl => AppConfig.todosEndpoint;

  // Get all todos
  static Future<List<Map<String, dynamic>>> getTodos() async {
    try {
      print('🔗 Attempting to connect to: $baseUrl'); // Debug log
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        List<dynamic> jsonList = json.decode(response.body);
        return jsonList.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to load todos');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Create a new todo
  static Future<Map<String, dynamic>> createTodo(Map<String, dynamic> todoData) async {
    try {
      print('🔗 Attempting to POST to: $baseUrl'); // Debug log
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(todoData),
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to create todo');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Update a todo
  static Future<Map<String, dynamic>> updateTodo(int id, Map<String, dynamic> todoData) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(todoData),
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to update todo');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Delete a todo
  static Future<bool> deleteTodo(int id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/$id'));
      return response.statusCode == 200;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
