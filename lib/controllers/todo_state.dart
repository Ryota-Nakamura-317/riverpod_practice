import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rivepod_practice2_app/entities/todo.dart';

part 'todo_state.freezed.dart';

@freezed
abstract class TodoState with _$TodoState {
  const factory TodoState({
    @Default(<Todo>[]) List<Todo> todoList,
  }) = _TodoState;
}
