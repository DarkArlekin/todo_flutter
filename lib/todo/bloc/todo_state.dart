part of 'todo_bloc.dart';

@immutable
abstract class TodoState {}

class TodoInitialState extends TodoState {}

class TodoLoadedState extends TodoState {}

class TodoErrorState extends TodoState {}
