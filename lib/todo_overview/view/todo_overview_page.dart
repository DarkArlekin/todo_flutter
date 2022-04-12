import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_my/todo_overview/view/todo_list.dart';
import 'package:todo_my/todo_overview/widgets/widgets.dart';

import 'package:http/http.dart' as http;
import 'package:todo_repository/todo_repository.dart';

import '../bloc/todo_overview_bloc.dart';

class TodoOverview extends StatelessWidget {
  const TodoOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TodoAppBar(),
      body: BlocProvider(
        create: (_) => TodoOverviewBloc(
            todoRepository: TodoRepository(httpClient: http.Client())
        )..add(TodoOverviewFetchEvent()),
          // ..add(PostFetched()),
        child: const TodoList(),
      ),
    );
  }
}
