import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rivepod_practice2_app/entities/todo.dart';
import 'package:rivepod_practice2_app/pages/Widget/build_list.dart';
import 'package:rivepod_practice2_app/pages/todo_list_page.dart';

class TodoList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('todo'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _transitionToNextScreen(context),
          )
        ],
      ),
      body: BuildList(),
    );
  }

  Future<void> _transitionToNextScreen(BuildContext context,
      {Todo todo}) async {
    final result = await Navigator.pushNamed(context, Const.routeNameUpsertTodo,
        arguments: todo);

    if (result != null) {
      // ToastMessageを表示
      await Fluttertoast.showToast(
        msg: result.toString(),
        backgroundColor: Colors.grey,
      );
    }
  }
}
