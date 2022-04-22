import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:todo_repository/src/models/models.dart';

import 'datalayers/todo_local_api.dart';

Map<String, dynamic> jsonTodo = {
  "id": "1",
  "title": "post title",
  "isCompleted": false,
  "description": "post description",
  "checkList": [
    {"id": "1", "title": "checkListItem1", "isCompleted": true}
  ],
};

// List jsonString = [jsonTodo];

class TodoRepository extends Equatable {
  factory TodoRepository({required http.Client httpClient}) {
    return _cache.putIfAbsent(
        httpClient, () => TodoRepository._internal(httpClient: httpClient));
  }

  TodoRepository._internal({required this.httpClient});

  static final Map<http.Client, TodoRepository> _cache = {};

  final http.Client httpClient;
  final todoApi = TodoLocalApi();
  String methodSaving = "";

  Future<List<Todo>> fetchTodos() async {
    final todos = await todoApi.getTodos();
    return Future.delayed(const Duration(seconds: 1), () => todos);
  }

  Future<Todo> fetchTodo(id) async {
    return Future.delayed(
        const Duration(milliseconds: 400), () async => await todoApi.getTodo(id));
  }

  void saveTodos(List<Todo> todos) {
    todoApi.saveTodos(todos);
  }

  void deleteTodo(id) {
    todoApi.removeTodo(id);
  }

  @override
  List<Object?> get props => [httpClient];
}
