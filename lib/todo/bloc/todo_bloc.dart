import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_repository/todo_repository.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc({required this.todoRepository})
      : super(const TodoState(title: "...")) {
    on<TodoFetchEvent>(_onTodoFetch);
    on<TodoInitializeEvent>(_onTodoInitialize);
    on<TodoCheckItemCompleteEvent>(_onTodoCheckItemComplete);
  }

  final TodoRepository todoRepository;

  void _onTodoInitialize(TodoInitializeEvent event, Emitter<TodoState> emit) {
    emit(state.copyWith(
      title: event.title,
    ));
    add(TodoFetchEvent(event.id));
  }

  void _onTodoCheckItemComplete(
      TodoCheckItemCompleteEvent event, Emitter<TodoState> emit) {
    print(state.todo);
    Todo editedTodo = state.todo!.copyWith(
        checkList: state.todo!.checkList.map((todoCheckItem) {
      if (todoCheckItem.id == event.id) {
        todoCheckItem.isCompleted = event.isCompleted;
      }
      return todoCheckItem;
    }).toList());
    emit(state.copyWith(
      todo: editedTodo,
    ));
    print("x");
  }

  Future<void> _onTodoFetch(
      TodoFetchEvent event, Emitter<TodoState> emit) async {
    try {
      final todoData = await todoRepository.fetchTodo(event.id);
      emit(state.copyWith(todo: todoData, status: TodoStatus.success));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), status: TodoStatus.failure));
    }
  }
}
