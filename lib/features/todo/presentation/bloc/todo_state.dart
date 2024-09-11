
part of 'todo_bloc.dart';



abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object?> get props => [];
}

class TodoLoadingState extends TodoState {}

class TodoLoadedState extends TodoState {
  final List<Todo> todos;

  const TodoLoadedState(this.todos);

  @override
  List<Object?> get props => [todos];
}

class TodoErrorState extends TodoState {
  final String message;

  const TodoErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
