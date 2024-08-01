import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:todo_cubit/bloc/todo_bloc.dart";
import "package:todo_cubit/cubit/todo_cubit.dart";
import "package:todo_cubit/pages/home_page.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodoCubit(),
        ),
        BlocProvider(
          create: (context) => TodoBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Todo Cubit",
        home: HomePage(),
      ),
    );
  }
}
