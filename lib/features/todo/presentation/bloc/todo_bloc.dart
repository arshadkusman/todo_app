import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/todo/domain/entities/task.dart';
import 'package:to_do_app/features/todo/domain/usecases/manage_todo.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final ManageTodo manageTodo;

  TodoBloc(this.manageTodo) : super(TodoLoadingState()) {
    on<LoadTodosEvent>((event, emit) async {
      try {
        final todos = await manageTodo.loadTodos();
        emit(TodoLoadedState(todos));
      } catch (e) {
        emit(TodoErrorState('Failed to load todos'));
      }
    });

    on<AddTodoEvent>((event, emit) async {
      try {
        await manageTodo.addTodo(event.todo);
        final todos = await manageTodo.loadTodos();
        emit(TodoLoadedState(todos));
      } catch (e) {
        emit(TodoErrorState('Failed to add todo'));
      }
    });

    on<DeleteTodoEvent>((event, emit) async {
      try {
        await manageTodo.deleteTodoAt(event.index);
        final todos = await manageTodo.loadTodos();
        emit(TodoLoadedState(todos));
      } catch (e) {
        emit(TodoErrorState('Failed to delete todo'));
      }
    });
  }
}
