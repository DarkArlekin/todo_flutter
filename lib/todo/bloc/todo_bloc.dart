import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_repository/todo_repository.dart';
import 'package:uuid/uuid.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc({required this.todoRepository})
      : super(const TodoState(title: "...")) {
    on<TodoFetchEvent>(_onTodoFetch);
    on<TodoInitializeEvent>(_onTodoInitialize);
    on<TodoCheckItemAddEvent>(_onTodoCheckItemAdd);
    on<TodoCheckItemCompleteEvent>(_onTodoCheckItemComplete);
  }

  final TodoRepository todoRepository;

  void _onTodoInitialize(TodoInitializeEvent event, Emitter<TodoState> emit) {
    emit(state.copyWith(
      title: event.title,
      status: TodoStatus.initial,
    ));
    if (state.todo?.id != event.id) add(TodoFetchEvent(event.id));
  }

  void _onTodoCheckItemComplete(
      TodoCheckItemCompleteEvent event, Emitter<TodoState> emit) {
    Todo editedTodo = state.todo!.copyWith(
        checkList: state.todo!.checkList
            .map((todoCheckItem) => todoCheckItem.id == event.id
                ? todoCheckItem.copyWith(
                    isCompleted: !todoCheckItem.isCompleted)
                : todoCheckItem)
            .toList());
    emit(state.copyWith(
      todo: editedTodo,
    ));
  }

  void _onTodoCheckItemAdd(
      TodoCheckItemAddEvent event, Emitter<TodoState> emit) {
    final newItem = TodoCheckItem(
        id: const Uuid().v4(), title: "example", isCompleted: false);
    Todo editedTodo =
        state.todo!.copyWith(checkList: [...state.todo!.checkList, newItem]);

    emit(state.copyWith(
      todo: editedTodo,
    ));
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
