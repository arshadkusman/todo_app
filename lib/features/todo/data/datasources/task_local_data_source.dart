import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/features/todo/data/models/task.dart';

class TodoLocalDataSource {
  Future<List<TodoModel>> getTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? todoStrings = prefs.getStringList('todoList');
    if (todoStrings == null) return [];
    return todoStrings.map((todo) => TodoModel(title: todo)).toList();
  }

  Future<void> saveTodos(List<TodoModel> todos) async {
    final prefs = await SharedPreferences.getInstance();
    final todoStrings = todos.map((todo) => todo.title).toList();
    await prefs.setStringList('todoList', todoStrings);
  }
}
