import 'package:equatable/equatable.dart';

import 'constants.dart';

part 'todo.g.dart';

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
  final List checkList;

  Todo copyWith({
    String? title,
    String? description,
    bool? isCompleted,
    List? checkList,
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
  factory Todo.fromJson(JsonMap json) => _$TodoFromJson(json);

  @override
  String toString() {
    return 'Todo { id: $id, title: $title, isCompleted: $isCompleted }';
  }

  @override
  List<Object> get props => [id, title, description, isCompleted];
}
