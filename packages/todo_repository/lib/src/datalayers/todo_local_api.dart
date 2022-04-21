import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../todo_repository.dart';

class TodoLocalApi {
  // Create storage
  final storage = const FlutterSecureStorage();

  void saveTodos(todos) async {
    final todosData = jsonEncode(todos.map((todo) => Todo.toJson(todo)).toList());
    await storage.write(key: 'todos', value: todosData);
  }

  Future<List<Todo>> getTodos() async {
    final String todosData = await storage.read(key: 'todos') ?? "[]";
    final todoList = _parseTodos(todosData);
    return todoList;
  }

  void removeTodo(id) async {
    final todosData = _parseTodos(await getTodos());
    todosData.removeWhere((element) => element.id == id);
    saveTodos(todosData);
  }

  List<Todo> _parseTodos(jsonString) {
    final List<dynamic> todosListData = jsonDecode(jsonString);
    final todoList = todosListData.map((jsonMap) => Todo.fromJson(jsonMap)).toList();
    return todoList;
  }
}
