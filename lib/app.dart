import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_my/todo/bloc/todo_bloc.dart';
import 'package:todo_my/todo/view/todo_page.dart';

import 'package:todo_my/todo_overview/todo.dart';

import 'package:todo_repository/todo_repository.dart';

import 'package:http/http.dart' as http;

class AppMultiBlocProvider extends MultiBlocProvider {
  AppMultiBlocProvider({Key? key})
      : super(
            key: key,
            providers: appProviders(),
            child: MaterialApp(initialRoute: '/', routes: appRoutes()));
}

Map<String, Widget Function(BuildContext)> appRoutes() => {
      '/': (context) => const TodoOverview(),
      '/todo': (context) => TodoPage(
          ModalRoute.of(context)?.settings.arguments as ScreenArguments),
    };

List<BlocProvider> appProviders() => [
      BlocProvider<TodoOverviewBloc>(
        create: (BuildContext context) => TodoOverviewBloc(
            todoRepository: TodoRepository(httpClient: http.Client()))
          ..add(TodoOverviewFetchEvent()),
      ),
      BlocProvider<TodoBloc>(
        create: (BuildContext context) =>
            TodoBloc(todoRepository: TodoRepository(httpClient: http.Client())),
      ),
    ];
