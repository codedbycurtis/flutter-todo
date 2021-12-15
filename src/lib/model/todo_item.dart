/// Represents a task created by the user.
class ToDoItem {
  /// A unique identifier for this task.
  int id;

  /// The title of the task.
  String title;

  /// A short description of the task to be completed.
  String description;

  /// The target date for the task's completion.
  DateTime deadline;

  /// Creates a [ToDoItem].
  ToDoItem({required this.id, required this.title, required this.description, required this.deadline});
}