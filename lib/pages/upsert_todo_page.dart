import 'package:flutter/material.dart';
import 'package:rivepod_practice2_app/entities/todo.dart';
import 'package:rivepod_practice2_app/pages/Widget/todo_form.dart';

class UpsertTodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Todoの値を純粋に持ってくる
    final todo = ModalRoute.of(context).settings.arguments as Todo;
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo${todo == null ? '作成' : '更新'}'),
      ),
      body: TodoForm(),
    );
  }
}
