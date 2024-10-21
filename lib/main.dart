import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/save_task.dart';
import 'package:todolist/todo_list.dart';

import 'add_todo.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
          create: (context) => SaveTaks(),
          child: const MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const TododList(),
        '/add-todo-screen': (_) => AddTodo(),
      },
    );
  }
}


