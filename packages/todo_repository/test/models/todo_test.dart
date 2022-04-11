import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:todo_my/src/models/models.dart';

void main() {
  group('TodoBloc', () {
    const todoMock = Todo(id: '1', title: 'post title', description: 'post description', checkList: []);
    final todoJsonMock = Todo.fromJson(jsonDecode('{"id": "1", "title": "post title", "description": "post description"}')) ;

    test('initial state is PostState()', () {
      expect(todoMock, todoJsonMock);
    });
  });
}