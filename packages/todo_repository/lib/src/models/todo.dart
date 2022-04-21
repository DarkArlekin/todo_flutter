import 'package:equatable/equatable.dart';

import 'constants.dart';

part 'todo.g.dart';

class TodoCheckItem extends Equatable {
  const TodoCheckItem(
      {required this.id, required this.title, required this.isCompleted});

  final String id;
  final String title;
  final bool isCompleted;

  TodoCheckItem copyWith({
    String? id,
    String? title,
    bool? isCompleted,
  }) {
    return TodoCheckItem(
        id: id ?? this.id,
        title: title ?? this.title,
        isCompleted: isCompleted ?? this.isCompleted);
  }

  factory TodoCheckItem.fromJson(Map<String, dynamic> json) =>
      _$TodoCheckItemFromJson(json);

  @override
  List<Object> get props => [id, title, isCompleted];
}

class Todo extends Equatable {
  const Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.checkList,
  });

  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final List<TodoCheckItem> checkList;

  Todo copyWith({
    String? title,
    String? description,
    bool? isCompleted,
    List<TodoCheckItem>? checkList,
  }) {
    return Todo(
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      checkList: checkList ?? this.checkList,
      description: description ?? this.description,
      id: id,
    );
  }

  /// Deserializes the given [JsonMap] into a [Post].
  factory Todo.fromJson(json) => _$TodoFromJson(json);

  static toJson(Todo todo) => _$TodoToJson(todo);

  @override
  String toString() {
    return 'Todo { id: $id, title: $title, isCompleted: $isCompleted }';
  }

  @override
  List<Object> get props => [id, title, description, isCompleted, checkList];
}
