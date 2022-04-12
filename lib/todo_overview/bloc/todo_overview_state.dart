part of 'todo_overview_bloc.dart';

enum TodoStatus { initial, success, failure }

class TodoOverviewState extends Equatable {
  const TodoOverviewState({
    this.status = TodoStatus.initial,
    this.todos = const [],
  });

  final TodoStatus status;
  final List<Todo> todos;

  TodoOverviewState copyWith({
    TodoStatus? status,
    List<Todo>? todos,
  }) {
    return TodoOverviewState(
      status: status ?? this.status,
      todos: todos ?? this.todos,
    );
  }

  @override
  String toString() {
    return 'TodoOverviewState { status: $status, posts: ${todos.length} }';
  }

  @override
  List<Object> get props => [status, todos];
}