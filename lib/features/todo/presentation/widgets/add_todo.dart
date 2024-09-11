import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/todo/domain/entities/task.dart';
import 'package:to_do_app/features/todo/presentation/bloc/todo_bloc.dart';

class AddTodo extends StatelessWidget {
  final TextEditingController todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            autofocus: true,
            controller: todoController,
            decoration: InputDecoration(hintText: "Enter a new todo"),
          ),
          ElevatedButton(
            onPressed: () {
              final todoText = todoController.text;
              if (todoText.isNotEmpty) {
                
                context
                    .read<TodoBloc>()
                    .add(AddTodoEvent(Todo(title: todoText)));
                todoController
                    .clear(); 
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Task "${todoText}" Added'),
                    duration: const Duration(seconds: 2),
                  ),
                ); 
              }
            },
            child: Text("Add Todo"),
          ),
        ],
      ),
    );
  }
}
