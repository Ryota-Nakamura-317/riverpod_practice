import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rivepod_practice2_app/controllers/todo_controller.dart';
import 'package:rivepod_practice2_app/entities/todo.dart';
import 'package:rivepod_practice2_app/pages/todo_list_page.dart';

class BuildList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final todoState = useProvider(todoProvider.state);
    final _todoList = todoState.todoList;
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _todoList.length,
      itemBuilder: (BuildContext context, int index) {
        return _dismissible(_todoList[index], context);
      },
    );
  }

  //スライドして削除するDismissibleパッケージ
  Widget _dismissible(Todo todo, BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      //確認のダイアログを出す
      confirmDismiss: (direction) async {
        final confirmResult =
            await _showDeleteConfirmDialog(todo.title, context);
        return confirmResult;
      },
      onDismissed: (DismissDirection direction) {
        context.read(todoProvider).deleteTodo(todo.id);
        Fluttertoast.showToast(
          msg: '${todo.title}を削除しました',
          backgroundColor: Colors.grey,
        );
      },
      //スライド出来る方向の指定
      direction: DismissDirection.startToEnd,
      background: Container(
        alignment: Alignment.centerLeft,
        color: Colors.red,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      //TodoをDismissibleで囲んでいる。
      child: _todoItem(todo, context),
    );
  }

  Widget _todoItem(Todo todo, BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
      ),
      child: ListTile(
        title: Text(
          todo.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        //onTapで更新画面に遷移
        onTap: () {
          _transitionToNextScreen(context, todo: todo);
        },
      ),
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

  Future<bool> _showDeleteConfirmDialog(
      String title, BuildContext context) async {
    final result = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('削除'),
            content: Text('$titleを削除しますか？'),
            actions: [
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('cancel'),
              ),
              FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('OK'),
              ),
            ],
          );
        });
    return result;
  }
}
