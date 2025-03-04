import 'package:dartz/dartz.dart';
import 'package:to_do_mindset/data/network/failure.dart';
import 'package:to_do_mindset/domain/models/models.dart';
import 'package:to_do_mindset/domain/repository/repository.dart';

import 'base_usecase.dart';

class GetTaskUseCase extends BaseUseCase<void, List<TaskModel>> {
  final Repository _repository;

  GetTaskUseCase(this._repository);

  @override
  Future<Either<Failure, List<TaskModel>>> call(void input) async {
    return await  _repository.getTasks();
  }
}
