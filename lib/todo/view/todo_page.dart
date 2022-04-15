import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_my/app_theme.dart';
import 'package:todo_my/todo/view/todo.dart';
import 'package:todo_my/todo/widgets/widgets.dart';

import '../bloc/todo_bloc.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
      return Scaffold(
        appBar: TodoAppBar(getTitle(state)),
        body: const TodoElement(),
        backgroundColor: AppTheme.primaryWhite,
      );
    });
  }
}

String getTitle(TodoState state) {
  if (state.status == TodoStatus.initial) {
    return state.title;
  }
  if (state.status == TodoStatus.success) {
    return state.todo?.title ?? "";
  }
  return "...";
}
