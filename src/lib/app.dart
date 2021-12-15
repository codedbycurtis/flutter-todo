import 'package:flutter/material.dart';
import 'model/todo_item.dart';
import 'views/shell_view.dart';

class App extends StatelessWidget {
  static List<ToDoItem> tasks = [
    ToDoItem(
        id: 0,
        title: "Task One Title",
        description: "Task one's description.",
        deadline: DateTime.now()),
    ToDoItem(
        id: 1,
        title: "Task One Title",
        description: "Task one's description.",
        deadline: DateTime.now()),
    ToDoItem(
        id: 2,
        title: "Task One Title",
        description: "Task one's description.",
        deadline: DateTime.now()),
    ToDoItem(
        id: 3,
        title: "Task One Title",
        description: "Task one's description.",
        deadline: DateTime.now()),
    ToDoItem(
        id: 4,
        title: "Task One Title",
        description: "Task one's description.",
        deadline: DateTime.now()),
    ToDoItem(
        id: 5,
        title: "Task One Title",
        description: "Task one's description.",
        deadline: DateTime.now()),
    ToDoItem(
        id: 6,
        title: "Task One Title",
        description: "Task one's description.",
        deadline: DateTime.now()),
    ToDoItem(
        id: 7,
        title: "Task One Title",
        description: "Task one's description.",
        deadline: DateTime.now()),
  ];

  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Shell(),
    );
  }
}