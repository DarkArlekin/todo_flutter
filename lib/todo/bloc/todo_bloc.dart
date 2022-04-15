import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_repository/todo_repository.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc({required this.todoRepository}) : super(TodoInitialState()) {
    on<TodoFetchEvent>(_onTodoFetch);
  }

  // todo: implement state class

  final TodoRepository todoRepository;

  Future<void> _onTodoFetch(
      TodoFetchEvent event, Emitter<TodoState> emit) async {

      // try {
      //   final todoData = await todoRepository.getTodo();
      //   emit(TodoLoadedState());
      // } catch (e) {
      //   emit(TodoErrorState(e.toString()));
      // }

  }
}
