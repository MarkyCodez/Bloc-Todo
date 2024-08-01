import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/models/todo.dart';

sealed class TodoEvents {}

class AddTodo extends TodoEvents {
  final String name1;
  final String des_1;
  AddTodo({
    required this.name1,
    required this.des_1,
  });
}

class RemoveTodo extends TodoEvents {
  final Todo name1;
  RemoveTodo({required this.name1});
}

class TodoBloc extends Bloc<TodoEvents, List<Todo>> {
  TodoBloc() : super([]) {
    on<AddTodo>((event, emit) {
      final todo_1 = Todo(
        name: event.name1,
        description: event.des_1,
        time: DateTime.now(),
      );
      emit([...state, todo_1]);
    });

    on<RemoveTodo>((event, emit) {
      state.remove(event.name1);
      emit([...state]);
    });
  }
}
