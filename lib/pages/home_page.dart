import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/bloc/todo_bloc.dart';
// import 'package:todo_cubit/cubit/todo_cubit.dart';  when bloc is running
import 'package:todo_cubit/models/todo.dart';
import 'package:todo_cubit/pages/add_todo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // final todoCub = BlocProvider.of<TodoCubit>(context); when bloc is running
    final todoBloc_1 = BlocProvider.of<TodoBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo Tasks"),
        centerTitle: true,
      ),
      body: BlocBuilder<TodoBloc, List<Todo>>(
        builder: (context, todo) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: todo.length,
            itemBuilder: (context, index) {
              final t_1 = todo[index];
              return ListTile(
                onLongPress: () {
                  // todoCub.removeTask(t_1);  when bloc is running
                  todoBloc_1.add(RemoveTodo(name1: t_1));
                },
                title: Text(t_1.name),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(t_1.description),
                    Text(
                      "${t_1.time.hour}:${t_1.time.minute}",
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddTodoPage();
              },
            ),
          );
        },
        child: const Icon(
          Icons.navigate_next,
        ),
      ),
    );
  }
}
