import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:to_do_mindset/data/mappers/mappers.dart';
import 'package:to_do_mindset/data/network/failure.dart';
import 'package:to_do_mindset/data/response/response.dart';
import 'package:to_do_mindset/domain/models/models.dart';
import 'package:to_do_mindset/domain/request/request.dart';

import '../../domain/repository/repository.dart';
import '../data_sources/cache_data_source.dart';
import '../data_sources/remote_data_source.dart';
import '../network/network_info.dart';

class RepositoryImpl implements Repository {
  final CacheDataSource _cacheDataSource;
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(
      this._cacheDataSource, this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, void>> addTasks(AddTaskRequest request) async {
    List<TaskResponse> response = await _cacheDataSource.getTasksList();
    int id = 1;

    for (var item in response) {
      id = max(id, item.id ?? 0) + 1;
    }

    response.add(TaskResponse(request.title, request.desc, false, id));

    await _cacheDataSource.setTasksList(response);

    return Right(null);
  }

  @override
  Future<Either<Failure, void>> removeTask(RemoveTaskRequest request) async {
    try {
      List<TaskResponse> response = await _cacheDataSource.getTasksList();

      response = response.where((item) => item.id != request.task.id).toList();

      await _cacheDataSource.setTasksList(response);

      return Right(null);
    } catch (e) {
      return Left(Failure.error(e));
    }
  }

  @override
  Future<Either<Failure, void>> editTask(EditTaskRequest request) async {
    try {
      List<TaskResponse> response = await _cacheDataSource.getTasksList();


      for (var item in response) {
        if (item.id == request.oldTask.id) {
          item.title = request.newTitle;
          item.desc = request.newDesc;
          break;
        }
      }

      await _cacheDataSource.setTasksList(response);

      return Right(null);
    } catch (e) {
      return Left(Failure.error(e));
    }
  }

  @override
  Future<Either<Failure, List<TaskModel>>> getTasks() async {
    try {
      List<TaskResponse> response;
      List<TaskModel> tasks = [];
      if (await _cacheDataSource.getIsFirstTime()) {
        if (await _networkInfo.isConnected == false) {
          return left(Failure.noInternet());
        } else {
          response = await _remoteDataSource.loadTasks();
          await _cacheDataSource.setTasksList(response);
        }
      } else {
        response = await _cacheDataSource.getTasksList();
      }
      for (var item in response) {
        tasks.add(item.map());
      }
      await _cacheDataSource.setIsFirstTime();
      return Right(tasks);
    } catch (e) {
      return Left(Failure.error(e));
    }
  }

  @override
  Future<Either<Failure, void>> toggleTask(ToggleTaskRequest request) async {
    try {
      List<TaskResponse> response = await _cacheDataSource.getTasksList();

      for (var item in response) {
        if (item.id == request.task.id) {
          item.done = !(item.done ?? false);
          break;
        }
      }

      await _cacheDataSource.setTasksList(response);

      return Right(null);
    } catch (e) {
      return Left(Failure.error(e));
    }
  }
}
