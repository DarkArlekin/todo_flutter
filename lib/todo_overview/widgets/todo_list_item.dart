import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_my/app_theme.dart';
import 'package:todo_my/todo/bloc/todo_bloc.dart';

import '../bloc/todo_overview_bloc.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem(
      {Key? key,
      required this.id,
      required this.title,
      required this.isCompleted})
      : super(key: key);

  final String id;
  final String title;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      child: Column(
        children: [
          Material(
            child: ListTile(
              leading: const Icon(Icons.list),
              title: Text(title),
              trailing: Checkbox(
                onChanged: (bool? value) {
                  context
                      .read<TodoOverviewBloc>()
                      .add(TodoOverviewCompleteEvent(id: id, isCompleted: value!));
                },
                value: isCompleted,
              ),
              onTap: () {
                context.read<TodoBloc>().add(TodoInitializeEvent(id, title));
                Navigator.pushNamed(
                  context,
                  '/todo',
                );
              },
            ),
          ),

          /// todo: debug
          Text("id: " + id)

        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(bottom: BorderSide(color: AppTheme.primaryBlue)),
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
    return BlocBuilder<TodoOverviewBloc, TodoOverviewState>(
        builder: (context, state) {});
  }
}
