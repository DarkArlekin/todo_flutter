import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_repository/todo_repository.dart';

import '../bloc/todo_bloc.dart';

class TodoCheckList extends BlocListener<TodoBloc, TodoState> {
  /// todo [itemCount]
  TodoCheckList({Key? key, required List<TodoCheckItem> checkList})
      : super(
            key: key,
            listener: (context, state) {},
            child: ListView.builder(
                itemCount: checkList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(checkList[index].title),
                    trailing: Checkbox(
                      onChanged: (bool? value) {
                        context.read<TodoBloc>().add(TodoCheckItemCompleteEvent(
                            id: checkList[index].id, isCompleted: value!));
                      },
                      value: checkList[index].isCompleted,
                    ),
                  );
                }));
}
