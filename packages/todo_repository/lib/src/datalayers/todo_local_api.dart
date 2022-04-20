import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../todo_repository.dart';

class TodoLocalApi {
  // Create storage
  final storage = const FlutterSecureStorage();

  void saveTodos(todos) async {
    final todosData = todos.map((todo) => '${Todo.toJson(todo)}').toList();
    await storage.write(key: 'todos', value: jsonEncode(todosData));
  }

  Future<String> getTodos() async {
    final todosData = await storage.read(key: 'todos') ?? "[]";
    print(todosData);
    return todosData;
  }
}
