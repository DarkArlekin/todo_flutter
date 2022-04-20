part of 'todo_overview_bloc.dart';

abstract class TodoOverviewEvent {}

class TodoOverviewFetchEvent extends TodoOverviewEvent {}

class TodoOverviewCompleteEvent extends TodoOverviewEvent {
  TodoOverviewCompleteEvent({required this.id, required this.isCompleted});

  final String id;
  final bool isCompleted;
}

class TodoOverviewCreateEvent extends TodoOverviewEvent {}
