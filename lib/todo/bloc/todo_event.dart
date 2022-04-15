part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class TodoInitializeEvent extends TodoEvent {
  TodoInitializeEvent(this.id, this.title);

  final String id;
  final String title;
}

class TodoCheckItemAddEvent extends TodoEvent {}

class TodoFetchEvent extends TodoEvent {
  TodoFetchEvent(this.id);

  final String id;
}

class TodoCheckItemCompleteEvent extends TodoEvent {
  TodoCheckItemCompleteEvent({required this.id});

  final String id;
}
