import 'package:to_do_app/features/todo/data/datasources/task_local_data_source.dart';
import 'package:to_do_app/features/todo/data/models/task.dart';
import 'package:to_do_app/features/todo/domain/entities/task.dart';
import 'package:to_do_app/features/todo/domain/repositories/task_repository.dart';

class TodoRepository implements TodoRepositoryInterface {
  final TodoLocalDataSource localDataSource;

  TodoRepository(this.localDataSource);

  @override
  Future<List<Todo>> getTodos() async {
    final todos = await localDataSource.getTodos();
    return todos.map((todoModel) => Todo(title: todoModel.title)).toList();
  }

  @override
  Future<void> saveTodos(List<Todo> todos) async {
    final todoModels = todos.map((todo) => TodoModel(title: todo.title)).toList();
    await localDataSource.saveTodos(todoModels);
  }
}
