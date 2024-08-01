import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/bloc/todo_bloc.dart';
// import 'package:todo_cubit/cubit/todo_cubit.dart'; when bloc is running

class AddTodoPage extends StatelessWidget {
  AddTodoPage({super.key});

  final TextEditingController t_2 = TextEditingController();

  final TextEditingController t_3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final todoCubit = BlocProvider.of<TodoCubit>(context); when bloc is running
    final todoBloc = BlocProvider.of<TodoBloc>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: t_2,
                decoration: const InputDecoration(
                  hintText: "Enter Tasks",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: t_3,
                decoration: const InputDecoration(
                  hintText: "Enter Tasks Description",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // todoCubit.addTodo(t_2.text, t_3.text); when bloc is  running
                  todoBloc.add(AddTodo(name1: t_2.text, des_1: t_3.text));
                  Navigator.pop(context);
                },
                child: const Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
