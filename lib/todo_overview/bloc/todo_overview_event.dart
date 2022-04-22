part of 'todo_overview_bloc.dart';

abstract class TodoOverviewEvent {}

class TodoOverviewFetchEvent extends TodoOverviewEvent {}

class TodoOverviewCompleteEvent extends TodoOverviewEvent {
  TodoOverviewCompleteEvent({required this.id, required this.isCompleted});

  final String id;
  final bool isCompleted;
}

class TodoOverviewCreateEvent extends TodoOverviewEvent {}

class TodoOverviewChangeEvent extends TodoOverviewEvent{
  TodoOverviewChangeEvent({required this.todo});

  final Todo todo;
}

class TodoOverviewSaveEvent extends TodoOverviewEvent {
  TodoOverviewSaveEvent({this.todos});

  final List<Todo>? todos;
}

class TodoOverviewDeleteEvent extends TodoOverviewEvent {
  TodoOverviewDeleteEvent(this.id);

  final String id;
}
