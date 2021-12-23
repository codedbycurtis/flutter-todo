import 'package:flutter/material.dart';
import 'home_view.dart';
import 'tasks_view.dart';
import 'settings_view.dart';

class Shell extends StatefulWidget {
  /// Creates a [Shell].
  const Shell({Key? key}) : super(key: key);

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  int _currentIndex = 0;

  final _pages = [
    const HomePage(),
    const TasksPage(),
    const SettingsPage(),
  ];

  void _onTap(int currentIndex) {
    setState(() {
      _currentIndex = currentIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
              activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(
              icon: Icon(Icons.task_outlined),
              label: "Tasks",
              activeIcon: Icon(Icons.task)),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: "Settings",
              activeIcon: Icon(Icons.settings)),
        ],
      ),
      body: _pages[_currentIndex],
    );
  }
}
