import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:todo_repository/src/models/models.dart';

Map<String, dynamic> jsonTodo = {
  "id": "1",
  "title": "post title",
  "isCompleted": false,
  "description": "post description",
  "checkList": [
    {"id": "1", "title": "checkListItem1", "isCompleted": true}
  ],
};

List jsonString = [jsonTodo];

class TodoRepository extends Equatable {
  factory TodoRepository({required http.Client httpClient}) {
    return _cache.putIfAbsent(
        httpClient, () => TodoRepository._internal(httpClient: httpClient));
  }

  const TodoRepository._internal({required this.httpClient});

  static final Map<http.Client, TodoRepository> _cache = {};

  final http.Client httpClient;

  Future<List<Todo>> fetchTodos() async {
    return Future.delayed(const Duration(seconds: 1),
        () => jsonString.map((json) => Todo.fromJson(json)).toList());
  }

  Future<Todo> fetchTodo(id) {
    return Future.delayed(
        const Duration(seconds: 1), () => Todo.fromJson(jsonTodo));
  }

  @override
  List<Object?> get props => [httpClient];
}
