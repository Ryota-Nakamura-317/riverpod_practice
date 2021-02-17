import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rivepod_practice2_app/pages/todo_list_page.dart';

void main() {
  runApp(ProviderScope(child: TodoListPage()));
}
