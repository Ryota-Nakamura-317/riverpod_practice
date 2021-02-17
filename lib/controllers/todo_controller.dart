import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rivepod_practice2_app/controllers/todo_state.dart';
import 'package:rivepod_practice2_app/entities/todo.dart';

//StateNotifierProviderによって状態変更を通知
final todoProvider = StateNotifierProvider((ref) => TodoController());

//TodoStateのStateNotifierで唯一持てるstate変数を利用して、create update deleteを記述する。
//firestoreに書き込む際はここに
class TodoController extends StateNotifier<TodoState> {
  TodoController() : super(const TodoState());

  void createTodo(String title) {
    final id = state.todoList.length + 1;
    final newList = [...state.todoList, Todo(id, title)];
    state = state.copyWith(todoList: newList);
  }

  void updateTodo(int id, String title) {
    state = state.copyWith(
        todoList: state.todoList
            .map((todo) => todo.id == id ? Todo(id, title) : todo)
            .toList());
  }

  void deleteTodo(int id) {
    state = state.copyWith(
        todoList: state.todoList.where((todo) => todo.id != id).toList());
  }
}
