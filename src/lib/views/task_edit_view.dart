import 'package:flutter/material.dart';

class TaskEditPage extends StatefulWidget {
  const TaskEditPage({Key? key}) : super(key: key);
  final String title = "Edit Task";

  @override
  State<TaskEditPage> createState() => _TaskEditState();
}

class _TaskEditState extends State<TaskEditPage> {
  final DateTime _currentDate = DateTime.now();
  bool _isDatePickerVisible = false;

  void _onCheckPressed() {
    Navigator.pop(context);
  }

  void _onDatePickerPressed() {
    setState(() {
      if (_isDatePickerVisible) {
        _isDatePickerVisible = false;
        return;
      }
      _isDatePickerVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: _onCheckPressed, icon: const Icon(Icons.check))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Title"),
            TextField(),
            const Text("Description"),
            TextField(),
            const Text("Deadline"),
            TextButton(
                onPressed: _onDatePickerPressed,
                child: const Icon(Icons.date_range)),
            Visibility(
                child: DatePickerDialog(
                    initialDate: _currentDate,
                    firstDate: _currentDate,
                    lastDate: DateTime(_currentDate.year + 5)),
                visible: _isDatePickerVisible),
          ],
        ),
      ),
    );
  }
}