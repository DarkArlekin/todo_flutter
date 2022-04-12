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
                padding: const EdgeInsets.only(right: 28),
                icon: const Icon(Icons.add),
              )
            ]);
}
