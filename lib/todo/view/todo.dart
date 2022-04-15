import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todo_bloc.dart';

class TodoElement extends StatelessWidget {
  const TodoElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return const Text('page of todo');
        });
  }
}
