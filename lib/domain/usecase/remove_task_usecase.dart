import 'package:dartz/dartz.dart';
import 'package:to_do_mindset/data/network/failure.dart';
import 'package:to_do_mindset/domain/repository/repository.dart';
import 'package:to_do_mindset/domain/request/request.dart';

import 'base_usecase.dart';

class RemoveTaskUseCase extends BaseUseCase<RemoveTaskRequest, void> {
  final Repository _repository;

  RemoveTaskUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(RemoveTaskRequest input) async {
    return  await _repository.removeTask(input);
  }
}
