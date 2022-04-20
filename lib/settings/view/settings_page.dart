import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:todo_my/app_theme.dart';
import 'package:todo_my/todo_overview/view/todo_list.dart';
import 'package:todo_my/settings/widgets/widgets.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Portal(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: TodoAppBar()),
        body: TodoList(),
        backgroundColor: AppTheme.primaryWhite,
      ),
    );
  }
}
