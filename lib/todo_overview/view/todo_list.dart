import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_my/todo_overview/widgets/widgets.dart';

import '../bloc/todo_overview_bloc.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoOverviewBloc, TodoOverviewState>(
        builder: (context, state) {
      return ListView.builder(
        itemCount: state.todos.length,
        itemBuilder: (BuildContext context, int index) {
          final todo = state.todos[index];
          return TodoListItem(
              id: todo.id, title: todo.title, isCompleted: todo.isCompleted);
        },
      );
    });
  }
}
