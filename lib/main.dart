import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/todo/data/datasources/task_local_data_source.dart';
import 'package:to_do_app/features/todo/data/repositories/task_repo_impl.dart';
import 'package:to_do_app/features/todo/domain/usecases/manage_todo.dart';
import 'package:to_do_app/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:to_do_app/features/todo/presentation/pages/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoBloc>(
          create: (context) => TodoBloc(
            ManageTodo(
              TodoRepository(
                TodoLocalDataSource(), 
              ),
            ),
          )..add(LoadTodosEvent()), 
        ),
      ],
      child: MaterialApp(
        title: 'To-Do App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        home: MainScreen(),
      ),
    );
  }
}
