import 'package:flutter/material.dart';
import 'package:todo/todo_item.dart';
import 'package:intl/intl.dart';

/// Represents a [ToDoItem] that can be displayed in a list.
class ToDoListItem {
  ToDoItem item;

  ToDoListItem({required this.item});

  Widget buildTitle() => Text(item.title);

  Widget buildSubtitle() {
    String shortDate = DateFormat.yMd().format(item.taskDeadline);
    String shortTime = DateFormat.jm().format(item.taskDeadline);
    return Text("${item.description}\n$shortDate • $shortTime");
  }
}