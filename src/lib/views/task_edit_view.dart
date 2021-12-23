import 'package:flutter/material.dart';
import 'package:todo/app.dart';
import 'package:todo/model/todo_item.dart';
import 'package:intl/intl.dart';

class TaskEditPage extends StatefulWidget {
  /// Creates a [TaskEditPage].
  const TaskEditPage({Key? key}) : super(key: key);
  final String title = "Edit Task";

  @override
  State<TaskEditPage> createState() => _TaskEditState();
}

class _TaskEditState extends State<TaskEditPage> {
  final _titleTextController = TextEditingController();
  final _descriptionTextController = TextEditingController();
  final _dateTextController = TextEditingController();
  final _timeTextController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  void dispose() {
    _titleTextController.dispose();
    _descriptionTextController.dispose();
    super.dispose();
  }

  void _onCheckPressed() {
    if (_titleTextController.text != "" &&
        _selectedDate != null &&
        _selectedTime != null) {
      App.tasks.add(ToDoItem(
          id: App.tasks.length + 1,
          title: _titleTextController.text,
          description: _descriptionTextController.text,
          deadline: DateTime(_selectedDate!.year, _selectedDate!.month,
              _selectedDate!.day, _selectedTime!.hour, _selectedTime!.minute)));
      Navigator.pop(context);
    }
  }

  Future<void> _onDatePickerPressed() async {
    DateTime currentDate = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: currentDate,
        lastDate:
            DateTime(currentDate.year + 1, currentDate.month, currentDate.day));
    if (selectedDate != null) {
      _selectedDate = selectedDate;
      _dateTextController.text = DateFormat.yMd().format(selectedDate);
    }
  }

  Future<void> _onTimePickerPressed() async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime != null) {
      _selectedTime = selectedTime;
      _timeTextController.text = "${selectedTime.hour}:${selectedTime.minute}";
    }
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: _titleTextController,
            decoration: const InputDecoration(
              hintText: "Title",
            ),
          ),
          TextField(
            controller: _descriptionTextController,
            decoration: const InputDecoration(
              hintText: "Description",
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _dateTextController,
                  decoration: const InputDecoration(
                    hintText: "Date",
                  ),
                  readOnly: true,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Flexible(
                  child: TextButton(
                    onPressed: _onDatePickerPressed,
                    child: const Icon(Icons.date_range),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _timeTextController,
                  decoration: const InputDecoration(
                    hintText: "Time",
                  ),
                  readOnly: true,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Flexible(
                  child: TextButton(
                    onPressed: _onTimePickerPressed,
                    child: const Icon(Icons.more_time),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
