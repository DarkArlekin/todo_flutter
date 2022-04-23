import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_my/todo/bloc/todo_bloc.dart';
import 'package:todo_repository/todo_repository.dart';
import 'package:uuid/uuid.dart';

part 'todo_overview_event.dart';

part 'todo_overview_state.dart';

class TodoOverviewBloc extends Bloc<TodoOverviewEvent, TodoOverviewState> {
  TodoOverviewBloc({required this.todoRepository, required this.todoBloc})
      : super(const TodoOverviewState()) {
    on<TodoOverviewFetchEvent>(_onTodosFetch);
    on<TodoOverviewCompleteEvent>(_onTodoCompleteEvent);
    on<TodoOverviewCreateEvent>(_onTodoOverviewCreate);
    on<TodoOverviewSaveEvent>(_onTodoOverviewSave);
    on<TodoOverviewChangeEvent>(_onTodoOverviewChange);

    todoBlocSubscription = todoBloc.stream.listen((state) {
      // todo handle test

      /// if [Todo] in [TodoStatus.initial], don`t update the state
      if (state.status == TodoStatus.initial) return;

      /// if first time assignment of choused [Todo] in [state]
      if (currentEditedTodoId != state.todo!.id) {
        currentEditedTodoId = state.todo!.id;
        return;
      }

      add(TodoOverviewChangeEvent(todo: state.todo!));
    });
  }

  final TodoRepository todoRepository;
  final TodoBloc todoBloc;
  bool isTodoBlocInitialized = false;
  String currentEditedTodoId = "";
  late StreamSubscription todoBlocSubscription;

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
    _saveTodos();
  }

  void _onTodoOverviewCreate(
      TodoOverviewCreateEvent event, Emitter<TodoOverviewState> emit) {
    final newTodo = Todo(
        id: const Uuid().v4(),
        title: 'untitled',
        description: '',
        isCompleted: false,
        checkList: const []);
    emit(state.copyWith(todos: [...state.todos, newTodo]));
    _saveTodos();
  }

  void _onTodoOverviewChange(
      TodoOverviewChangeEvent event, Emitter<TodoOverviewState> emit) {
    emit(state.copyWith(
        todos: state.todos.map((todo) {
      if (todo.id == event.todo.id) return event.todo;
      return todo;
    }).toList()));
    _saveTodos();
  }

  void _onTodoOverviewSave(
      TodoOverviewSaveEvent event, Emitter<TodoOverviewState> emit) {
    _saveTodos(todos: event.todos);
  }

  void _saveTodos({todos}) {
    todoRepository.saveTodos(todos ?? state.todos);
  }
}
