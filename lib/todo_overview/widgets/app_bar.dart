import 'package:flutter/material.dart';

class TodoAppBar extends AppBar {
  TodoAppBar({Key? key})
      : super(key: key, title: const Center(child: Text("My Todo")), toolbarHeight: 48);
}
