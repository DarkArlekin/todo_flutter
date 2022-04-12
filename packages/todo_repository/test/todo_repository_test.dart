import 'package:http/http.dart' as http;


import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:todo_repository/todo_repository.dart';

void main() {
  final httpClient = http.Client();
  final todoRepository = TodoRepository(httpClient: httpClient);

  group('TodoRepository', () {

    test('TodoRepository is Singleton', () {
    });
  });
}