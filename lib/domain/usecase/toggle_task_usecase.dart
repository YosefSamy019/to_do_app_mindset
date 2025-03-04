import 'package:dartz/dartz.dart';
import 'package:to_do_mindset/data/network/failure.dart';
import 'package:to_do_mindset/domain/repository/repository.dart';
import 'package:to_do_mindset/domain/request/request.dart';

import 'base_usecase.dart';

class ToggleTaskUseCase extends BaseUseCase<ToggleTaskRequest, void> {
  final Repository _repository;

  ToggleTaskUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(ToggleTaskRequest input) async {
    return await _repository.toggleTask(input);
  }
}
