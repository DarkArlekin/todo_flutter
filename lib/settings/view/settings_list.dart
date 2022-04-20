import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_my/todo_overview/widgets/widgets.dart';

import '../bloc/settings_bloc.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
      return Column(
        children: const [
          ListTile(
            title: Text('Save method'),
          ),
        ],
      );
    });
  }
}
