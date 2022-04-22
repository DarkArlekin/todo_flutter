import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_my/app_theme.dart';
import 'package:todo_my/settings/bloc/settings_bloc.dart';

import '../../todo_overview/bloc/todo_overview_bloc.dart';

class TodoAppBar extends StatelessWidget {
  const TodoAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
      return AppBar(
          key: key,
          title: const Text("Settings"),
          backgroundColor: AppTheme.primaryBack,
          shadowColor: AppTheme.primaryBlue,
      );
    });
  }
}
