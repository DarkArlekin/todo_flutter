import 'package:equatable/equatable.dart';

import 'constants.dart';

part 'todo.g.dart';

class Todo extends Equatable {
  const Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.checkList,
  });

  final String id;
  final String title;
  final String description;
  final List checkList;

  /// Deserializes the given [JsonMap] into a [Post].
  factory Todo.fromJson(JsonMap json) => _$TodoFromJson(json);

  @override
  String toString() {
    return 'Todo { id: $id, title: $title }';
  }

  @override
  List<Object> get props => [id, title, description];
}
