import 'package:dartz/dartz.dart';
import 'package:to_do_mindset/domain/request/request.dart';

import '../../data/network/failure.dart';
import '../models/models.dart';

abstract class Repository {
  Future<Either<Failure, List<TaskModel>>> getTasks();

  Future<Either<Failure, void>> addTasks(AddTaskRequest request);

  Future<Either<Failure, void>> removeTask(RemoveTaskRequest request);

  Future<Either<Failure, void>> editTask(EditTaskRequest request);

  Future<Either<Failure, void>> toggleTask(ToggleTaskRequest request);
}
