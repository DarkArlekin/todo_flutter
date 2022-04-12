import 'package:flutter/material.dart';
import 'package:todo_my/todo_overview/todo.dart';

class App extends MaterialApp {
  App({Key? key})
      : super(
          key: key,
          initialRoute: '/',
          routes: {
            '/': (context) => const TodoOverview(),
          },
        );
}
