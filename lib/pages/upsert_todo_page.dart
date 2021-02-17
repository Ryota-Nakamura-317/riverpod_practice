import 'package:flutter/material.dart';
import 'package:rivepod_practice2_app/controllers/todo_state.dart';
import 'package:rivepod_practice2_app/pages/todo_form.dart';

class UpsertTodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Todoの値を純粋に持ってくる
    final todo = ModalRoute.of(context).settings.arguments as TodoState;
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo${todo == null ? '作成' : '更新'}'),
      ),
      body: TodoForm(),
    );
  }
}
