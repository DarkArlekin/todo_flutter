import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_my/app_theme.dart';

import '../../todo_overview/bloc/todo_overview_bloc.dart';
import '../bloc/todo_bloc.dart';

class TodoAppBar extends AppBar {
  TodoAppBar(title, {Key? key})
      : super(
            key: key,
            title: Text(title),
            toolbarHeight: 48,
            backgroundColor: AppTheme.primaryBack,
            shadowColor: AppTheme.primaryBlue,
            actions: [_appPopupMenuButton()]);
}

/// todo test event

Widget _appPopupMenuButton() =>
    BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
      return PopupMenuButton<String>(
        padding: const EdgeInsets.only(right: 24),
        onSelected: (value) {
          if (value == "todo_delete") {
            context
                .read<TodoOverviewBloc>()
                .add(TodoOverviewDeleteEvent(state.todo!.id));
          }
        },
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem<String>(
              value: 'todo_delete',
              child: Row(
                children: const [
                  Text(
                    'Delete todo',
                    textWidthBasis: TextWidthBasis.parent,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Icon(Icons.delete),
                ],
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            )
          ];
        },
      );
    });
