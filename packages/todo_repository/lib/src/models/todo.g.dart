part of 'todo.dart';

Todo _$TodoFromJson(JsonMap json) => Todo(
      id: json['id'] as String,
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool,
      description: (json['description'] ?? '') as String,
      checkList: (json['checkList'] ?? []) as List,
    );
