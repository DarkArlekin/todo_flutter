import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_my/app_theme.dart';

import '../bloc/todo_overview_bloc.dart';

class TodoAppBar extends StatelessWidget {
  const TodoAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoOverviewBloc, TodoOverviewState>(
        builder: (context, state) {
      return AppBar(
          key: key,
          title: const Text("My Todo"),
          backgroundColor: AppTheme.primaryBack,
          shadowColor: AppTheme.primaryBlue,
          actions: [
            _appPopupMenuButton(context),
          ]);
    });
  }
}

PopupMenuButton _appPopupMenuButton(BuildContext context) =>
    PopupMenuButton<String>(
      padding: const EdgeInsets.only(right: 24),
      onSelected: (value) {
        if (value == "todo_add") {
          context.read<TodoOverviewBloc>().add(TodoOverviewCreateEvent());
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
            value: 'todo_add',
            child: Row(
              children: const [
                Text(
                  'Add todo',
                  textWidthBasis: TextWidthBasis.parent,
                ),
                SizedBox(
                  width: 16,
                ),
                Text('+'),
              ],
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          )
        ];
      },
    );
