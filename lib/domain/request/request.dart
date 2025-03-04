import 'package:to_do_mindset/domain/models/models.dart';

class EditTaskRequest {
  final TaskModel oldTask;
  final String newTitle;
  final String newDesc;

  EditTaskRequest(
      {required this.oldTask, required this.newTitle, required this.newDesc});
}

class RemoveTaskRequest {
  final TaskModel task;

  RemoveTaskRequest({required this.task});
}

class ToggleTaskRequest {
  final TaskModel task;

  ToggleTaskRequest({required this.task});
}

class AddTaskRequest {
  final String title;
  final String desc;

  AddTaskRequest({required this.title, required this.desc});
}
