import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:to_do_app/features/todo/presentation/widgets/add_todo.dart';
import 'package:to_do_app/features/todo/presentation/widgets/todo_list.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
        children: [
          Container(
            color: Colors.blueGrey[900],
            height: 200,
            width: double.infinity,
            child: Center(
              child: Text(
                "Todo App",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListTile(
              onTap: () {
                launchUrl(Uri.parse(
                    "https://arshadkusman.github.io/portfolio-website/"));
              },
              leading: Icon(Icons.person),
              title: Text("About Me",
                  style: TextStyle(fontWeight: FontWeight.bold))),
          ListTile(
              onTap: () {
                launchUrl(Uri.parse("mailto:someone@example.com"));
              },
              leading: Icon(Icons.email),
              title: Text("Contact me",
                  style: TextStyle(fontWeight: FontWeight.bold)))
        ],
      )),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.blueGrey[900],
        centerTitle: true,
        title: const Text(
          "Todo App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodoLoadedState) {
            if (state.todos.isEmpty) {
              return Center(
                child: Text(
                  'No tasks available',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              );
            } else {
              return TodoListBuilder(todos: state.todos);
            }
          } else if (state is TodoErrorState) {
            return Center(child: Text(state.message));
          }
          return Container(); // Fallback case
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.blueGrey[900],
        onPressed: () {
          showAddTodoBottomSheet(context);
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void showAddTodoBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: AddTodo(),
        );
      },
    );
  }
}
