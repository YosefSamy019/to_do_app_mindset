import 'package:dartz/dartz.dart';
import 'package:to_do_mindset/data/network/failure.dart';
import 'package:to_do_mindset/domain/repository/repository.dart';
import 'package:to_do_mindset/domain/request/request.dart';

import 'base_usecase.dart';

class AddTaskUseCase extends BaseUseCase<AddTaskRequest, void> {
  final Repository _repository;

  AddTaskUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(AddTaskRequest input) async {
    return await _repository.addTasks(input);
  }
}
