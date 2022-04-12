import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          return ListTile(
            leading: const Icon(Icons.list),
            title: Text(todo.title),
            trailing: Checkbox(
              onChanged: (bool? value) {
                context.read<TodoOverviewBloc>().add(
                    TodoOverviewCompleteEvent(id: todo.id, isCompleted: value!));
              },
              value: todo.isCompleted,
            ),
          );
        },
      );
    });
  }
}
