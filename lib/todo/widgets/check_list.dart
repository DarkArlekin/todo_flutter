import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_my/todo_overview/bloc/todo_overview_bloc.dart';
import 'package:todo_repository/todo_repository.dart';
import 'package:collection/collection.dart';

import '../bloc/todo_bloc.dart';

class TodoCheckList extends BlocBuilder<TodoBloc, TodoState> {
  /// todo [itemCount]
  TodoCheckList({Key? key, required List<TodoCheckItem> checkList})
      : super(
            key: key,
            builder: (context, state) => Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...checkList
                            .mapIndexed((index, checkListItem) => ListTile(
                                  title: Text(checkListItem.title),
                                  trailing: Checkbox(
                                    onChanged: (bool? value) {
                                      context.read<TodoBloc>().add(
                                          TodoCheckItemCompleteEvent(
                                              id: checkListItem.id));
                                    },
                                    value: checkListItem.isCompleted,
                                  ),
                                )),
                        InkWell(
                          onTap: () {
                            context
                                .read<TodoBloc>()
                                .add(TodoCheckItemAddEvent());
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            child: Align(
                                child: Text("+ add more",
                                    style: TextStyle(fontSize: 16)),
                                alignment: Alignment.topLeft),
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
}
