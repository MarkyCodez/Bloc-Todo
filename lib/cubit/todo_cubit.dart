import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/models/todo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title, String des) {
    if (title.isEmpty) {
      return;
    } else {
      final todo = Todo(
        name: title,
        description: des,
        time: DateTime.now(),
      );
      emit([...state, todo]);
    }
  }

  removeTask(Todo value) {
    state.remove(value);
    emit([...state]);
  }

  @override
  void onChange(Change<List<Todo>> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }
}
