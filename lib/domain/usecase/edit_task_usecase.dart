import 'package:dartz/dartz.dart';
import 'package:to_do_mindset/data/network/failure.dart';
import 'package:to_do_mindset/domain/repository/repository.dart';
import 'package:to_do_mindset/domain/request/request.dart';

import 'base_usecase.dart';

class EditTaskUseCase extends BaseUseCase<EditTaskRequest, void> {
  final Repository _repository;

  EditTaskUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(EditTaskRequest input) async {
    return await _repository.editTask(input);
  }
}
