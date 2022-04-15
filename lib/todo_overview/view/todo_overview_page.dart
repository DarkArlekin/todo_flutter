import 'package:flutter/material.dart';
import 'package:todo_my/app_theme.dart';
import 'package:todo_my/todo_overview/view/todo_list.dart';
import 'package:todo_my/todo_overview/widgets/widgets.dart';

class TodoOverview extends StatelessWidget {
  const TodoOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TodoAppBar(),
      body: const TodoList(),
      backgroundColor: AppTheme.primaryWhite,
    );
  }
}
