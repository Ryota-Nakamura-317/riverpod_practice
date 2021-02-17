import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rivepod_practice2_app/todo_list_page.dart';

void main() {
  runApp(ProviderScope(child: TodoListView()));
}
