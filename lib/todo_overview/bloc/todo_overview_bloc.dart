import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_repository/todo_repository.dart';

part 'todo_overview_event.dart';

part 'todo_overview_state.dart';

class TodoOverviewBloc extends Bloc<TodoOverviewEvent, TodoOverviewState> {
  TodoOverviewBloc({required this.todoRepository})
      : super(const TodoOverviewState()) {
    on<TodoOverviewFetchEvent>(_onTodosFetch);
    on<TodoOverviewCompleteEvent>(_onTodoCompleteEvent);
  }

  final TodoRepository todoRepository;

  Future<void> _onTodosFetch(
      TodoOverviewFetchEvent event, Emitter<TodoOverviewState> emit) async {
    final todos = await todoRepository.fetchTodos();

    emit(state.copyWith(
      status: TodoOverviewStatus.success,
      todos: todos,
    ));
  }

  void _onTodoCompleteEvent(
      TodoOverviewCompleteEvent event, Emitter<TodoOverviewState> emit) {
      emit(state.copyWith(
        todos: state.todos.map((todo) {
          if (todo.id == event.id) {
            return todo.copyWith(isCompleted: !todo.isCompleted);
          }
          return todo;
        }).toList(),
      ));
  }
}
