import 'package:flutter/material.dart';

class TodoAppBar extends AppBar {
  TodoAppBar({Key? key})
      : super(
            key: key,
            title: const Text("My Todo"),
            toolbarHeight: 48,
            actions: [
              IconButton(
                onPressed: () => {},
                icon: const Icon(Icons.add),
              )
            ]);
}
