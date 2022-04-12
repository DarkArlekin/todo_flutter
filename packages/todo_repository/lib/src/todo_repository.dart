import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:todo_repository/src/models/models.dart';

List jsonString = [
  {
    "id": "1",
    "title": "post title",
    "isCompleted": false,
    "description": "post description"
  }
];

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

  @override
  List<Object?> get props => [httpClient];
}
