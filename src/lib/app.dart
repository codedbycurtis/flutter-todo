import 'package:flutter/material.dart';
import 'model/todo_item.dart';
import 'views/shell_view.dart';

class App extends StatefulWidget {
  static App? current;

  static List<ToDoItem> tasks = [
    ToDoItem(
        id: 0,
        title: "Task One Title",
        description: "Task one's description.",
        deadline: DateTime.now()),
    ToDoItem(
        id: 1,
        title: "Task Two Title",
        description: "Task two's description.",
        deadline: DateTime.now()),
  ];

  /// Creates an [App].
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  ThemeData _currentTheme = ThemeData.light();

  static AppState? current;
  static bool darkModeEnabled = false;

  AppState() {
    current = this;
  }

  void setDarkTheme() {
    setState(() {
      _currentTheme = ThemeData.dark();
    });
    darkModeEnabled = true;
  }

  void setLightTheme() {
    setState(() {
      _currentTheme = ThemeData.light();
    });
    darkModeEnabled = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo',
      theme: _currentTheme,
      home: const Shell(),
    );
  }
}