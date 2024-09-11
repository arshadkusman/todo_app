import 'package:to_do_app/features/todo/domain/entities/task.dart';

abstract class TodoRepositoryInterface {
  Future<List<Todo>> getTodos();
  Future<void> saveTodos(List<Todo> todos);
}
