import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_my/todo/widgets/check_list.dart';
import 'package:todo_my/todo/widgets/form_input.dart';

import '../bloc/todo_bloc.dart';

class TodoElement extends StatelessWidget {
  const TodoElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
      if (state.status == TodoStatus.initial) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state.status == TodoStatus.success) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            children: [
              FormInput(
                  initialValue: state.todo!.description,
                  labelText: "description"),
              const Padding(
                padding: EdgeInsets.only(top: 16, left: 16),
                child: Align(
                    child: Text("Check list", style: TextStyle(fontSize: 12)),
                    alignment: Alignment.topLeft),
              ),
              Expanded(child: TodoCheckList(checkList: state.todo!.checkList))
            ],
          ),
        );
      }
      if (state.status == TodoStatus.failure) {
        return Center(
          child: Text(state.error.toString()),
        );
      }
      return Container();
    });
  }
}
