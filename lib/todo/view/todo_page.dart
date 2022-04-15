import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_my/app_theme.dart';
import 'package:todo_my/todo/view/todo.dart';
import 'package:todo_my/todo/widgets/widgets.dart';

import '../bloc/todo_bloc.dart';

class TodoPage extends StatelessWidget {
  const TodoPage(this.arguments, {Key? key}) : super(key: key);

  final ScreenArguments arguments;

  @override
  Widget build(BuildContext context) {
    context.read<TodoBloc>().add(TodoFetchEvent(arguments.id));

    return Scaffold(
      appBar: TodoAppBar(arguments.title),
      body: const TodoElement(),
      backgroundColor: AppTheme.primaryWhite,
    );
  }
}

class ScreenArguments {
  ScreenArguments({required this.id, required this.title});

  final String id;
  final String title;
}
