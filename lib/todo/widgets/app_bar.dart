import 'package:flutter/material.dart';
import 'package:todo_my/app_theme.dart';

class TodoAppBar extends AppBar {
  TodoAppBar(title, {Key? key})
      : super(
            key: key,
            title: Text(title),
            toolbarHeight: 48,
            backgroundColor: AppTheme.primaryBack,
            shadowColor: AppTheme.primaryBlue,
            actions: [
              IconButton(
                onPressed: () => {},
                padding: const EdgeInsets.only(right: 28),
                icon: const Icon(Icons.more_vert),
              )
            ]);
}
