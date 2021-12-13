import 'package:flutter/material.dart';
import 'todo_list_item.dart';
import 'todo_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static List<ToDoItem> tasks = [];

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Shell(),
    );
  }
}

class Shell extends StatefulWidget {
  const Shell({Key? key}) : super(key: key);
  
  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  int _currentIndex = 0;

  final _pages = [
    const HomePage(),
    const TasksPage(),
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: "Tasks")
        ],
      ),
      body: _pages[_currentIndex],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  final String title = "Home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text("There's nothing to see here right now."),
      ),
    );
  }
}

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);
  final String title = "Tasks";

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  List<ToDoListItem> _listItems = [];
  
  _TasksPageState() {
    _listItems = MyApp.tasks.map((e) => ToDoListItem(item: e)).toList();
  }

  void _addTask() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const TaskEditPage()));
  }

  void _onListItemTap() {
    const TaskEditPage();
  }

  Widget _todoListItemBuilder(BuildContext context, int index) {
    final item = _listItems[index];
    return ListTile(
      title: item.buildTitle(),
      subtitle: item.buildSubtitle(),
      isThreeLine: true,
      onTap: _onListItemTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemBuilder: _todoListItemBuilder,
        itemCount: _listItems.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        tooltip: "Add a new Task",
        onPressed: _addTask,
      ),
    );
  }
}

class TaskEditPage extends StatefulWidget {
  const TaskEditPage({Key? key}) : super(key: key);
  final String title = "Edit Task";

  @override
  State<TaskEditPage> createState() => _TaskEditState();
}

class _TaskEditState extends State<TaskEditPage> {
  void _onCheckTap() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: _onCheckTap, icon: const Icon(Icons.check))
        ],
      ),
    );
  }
}
