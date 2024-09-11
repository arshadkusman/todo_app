import 'package:to_do_app/features/todo/domain/entities/task.dart';
import 'package:to_do_app/features/todo/domain/repositories/task_repository.dart';

class ManageTodo {
  final TodoRepositoryInterface repository;

  ManageTodo(this.repository);

  Future<List<Todo>> loadTodos() {
    return repository.getTodos();
  }

  Future<void> addTodo(Todo todo) async {
    final todos = await repository.getTodos();
    todos.insert(0, todo);
    await repository.saveTodos(todos);
  }

  Future<void> deleteTodoAt(int index) async {
    final todos = await repository.getTodos();
    todos.removeAt(index);
    await repository.saveTodos(todos);
  }
}
