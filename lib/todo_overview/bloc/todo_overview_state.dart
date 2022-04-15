part of 'todo_overview_bloc.dart';

enum TodoOverviewStatus { initial, success, failure }

class TodoOverviewState extends Equatable {
  const TodoOverviewState({
    this.status = TodoOverviewStatus.initial,
    this.todos = const [],
  });

  final TodoOverviewStatus status;
  final List<Todo> todos;

  TodoOverviewState copyWith({
    TodoOverviewStatus? status,
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