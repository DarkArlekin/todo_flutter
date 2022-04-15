import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_my/app_theme.dart';

import '../../todo/view/todo_page.dart';
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
          return Container(
            margin: const EdgeInsets.only(top: 4),
            child: Material(
              child: ListTile(
                leading: const Icon(Icons.list),
                title: Text(todo.title),
                trailing: Checkbox(
                  onChanged: (bool? value) {
                    context.read<TodoOverviewBloc>().add(
                        TodoOverviewCompleteEvent(
                            id: todo.id, isCompleted: value!));
                  },
                  value: todo.isCompleted,
                ),
                onTap: () => {
                  Navigator.pushNamed(context, '/todo',
                      arguments: ScreenArguments(id: 'id', title: todo.title))
                },
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border:
                  const Border(bottom: BorderSide(color: AppTheme.primaryBlue)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
