import 'package:flutter/material.dart';
import '../model/todo_list_item.dart';
import '../app.dart';
import 'task_edit_view.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);
  final String title = "Tasks";

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final List<ToDoListItem> _listItems =
      App.tasks.map((e) => ToDoListItem(item: e)).toList();

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