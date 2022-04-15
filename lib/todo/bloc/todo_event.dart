part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class TodoFetchEvent extends TodoEvent {
  TodoFetchEvent(this.id);

  final String id;
}
