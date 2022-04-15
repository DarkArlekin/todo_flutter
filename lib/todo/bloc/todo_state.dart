part of 'todo_bloc.dart';

enum TodoStatus { initial, success, failure }

@immutable
class TodoState extends Equatable {
   const TodoState(
      {this.status = TodoStatus.initial,
      required this.title,
      this.todo,
      this.error = '',
      });

  final String title;
  final Todo? todo;
  final String error;
  final TodoStatus status;

  TodoState copyWith({
    String? title,
    Todo? todo,
    String? error,
    TodoStatus? status,
    bool? needUpdate,
  }) {
    return TodoState(
      status: status ?? this.status,
      todo: todo ?? this.todo,
      error: error ?? this.error,
      title: title ?? this.title,
    );
  }

  @override
  String toString() {
    return 'TodoOverviewState { status: $status, posts: $title }';
  }

  @override
  List<Object?> get props => [title, todo, error, status, ...?todo?.checkList.map((e) => e.isCompleted)];
}
