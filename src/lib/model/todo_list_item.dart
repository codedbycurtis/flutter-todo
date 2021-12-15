import 'package:flutter/material.dart';
import 'todo_item.dart';
import 'package:intl/intl.dart';

/// Represents a [ToDoItem] that can be displayed in a list.
class ToDoListItem {
  ToDoItem item;

  /// Creates a [ToDoListItem].
  ToDoListItem({required this.item});

  Widget buildTitle() => Text(item.title);

  Widget buildSubtitle() {
    String shortDate = DateFormat.yMd().format(item.deadline);
    String shortTime = DateFormat.jm().format(item.deadline);
    return Text("${item.description}\n$shortDate • $shortTime");
  }
}