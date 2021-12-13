/// Represents a task created by the user.
class ToDoItem {

  /// The title of the task.
  String title;

  /// A short description of the task to be completed.
  String description;

  /// The target date for the task's completion.
  DateTime taskDeadline;

  ToDoItem({required this.title, required this.description, required this.taskDeadline});
}