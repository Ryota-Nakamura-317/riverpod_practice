import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rivepod_practice2_app/controllers/todo_controller.dart';
import 'package:rivepod_practice2_app/entities/todo.dart';

class TodoForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String _title = '';

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context).settings.arguments as Todo;

    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFormField(
              initialValue: todo != null ? todo.title : '',
              maxLength: 20,
              //max値以上は入力不可
              maxLengthEnforced: true,
              decoration: InputDecoration(
                hintText: 'Todoタイトルを入力して下さい',
                labelText: 'Todoタイトル',
              ),
              validator: (String title) {
                return title.isEmpty ? 'Todoタイトルを入力してください' : null;
              },
              onSaved: (String title) {
                _title = title;
              },
            ),
            RaisedButton(
              onPressed: () => _submission(context, todo),
              child: Text('Todoを${todo == null ? '作成' : '更新'}する'),
            ),
          ],
        ),
      ),
    );
  }

  void _submission(BuildContext context, Todo todo) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (todo != null) {
        context.read(todoProvider).updateTodo(todo.id, _title);
      } else {
        context.read(todoProvider).createTodo(_title);
      }
      Navigator.pop(context, '$_titleを${todo == null ? '作成' : '更新'}しました');
    }
  }
}
