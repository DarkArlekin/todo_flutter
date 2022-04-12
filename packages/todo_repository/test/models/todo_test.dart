import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:todo_repository/src/models/models.dart';

void main() {
  group('TodoBloc', () {
    const todoMock = Todo(
        id: '1',
        title: 'post title',
        description: 'post description',
        isCompleted: false,
        checkList: []);

    final todoJsonMock = Todo.fromJson(jsonDecode(
        '{"id": "1", "title": "post title", "isCompleted": ${false}, "description": "post description"}'));

    test('constructors fromJson is similar to fromJson', () {
      expect(todoMock, todoJsonMock);
    });
  });
}
