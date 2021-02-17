import 'package:flutter/material.dart';
import 'package:rivepod_practice2_app/pages/todo_list.dart';
import 'package:rivepod_practice2_app/pages/upsert_todo_page.dart';

class Const {
  static const routeNameUpsertTodo = 'upsert-todo';
}

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.grey),
      //routesの設定、基本的に作成、更新は同じページに遷移させている。
      routes: <String, WidgetBuilder>{
        Const.routeNameUpsertTodo: (BuildContext context) => UpsertTodoPage(),
      },
      home: TodoList(),
    );
  }
}
