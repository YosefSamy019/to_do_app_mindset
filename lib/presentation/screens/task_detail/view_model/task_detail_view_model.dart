import 'package:dartz/dartz.dart';
import 'package:to_do_mindset/domain/models/models.dart';
import 'package:to_do_mindset/domain/request/request.dart';
import 'package:to_do_mindset/domain/usecase/add_task_usecase.dart';
import 'package:to_do_mindset/domain/usecase/edit_task_usecase.dart';
import 'package:to_do_mindset/domain/usecase/remove_task_usecase.dart';

import '../../../../app/sl.dart';
import '../../../base/base_cubit.dart';
import '../../../base/base_states.dart';

class TaskDetailViewModel extends BaseCubit
    implements TaskDetailViewModelInput, TaskDetailViewModelOutput {
  late final EditTaskUseCase _editTaskUseCase = sl();
  late final RemoveTaskUseCase _removeTaskUseCase = sl();
  late final AddTaskUseCase _addTaskUseCase = sl();

  TaskDetailViewModel(this.task);

  TaskModel? task;

  @override
  void start() {
    emit(ContentState());
  }

  @override
  void apply(String title, String desc) {
    Future<Either> response;
    if (task == null) {
      response = _addTaskUseCase(AddTaskRequest(title: title, desc: desc));
    } else {
      response = _editTaskUseCase(
          EditTaskRequest(oldTask: task!, newTitle: title, newDesc: desc));
    }

    response.then((v) {
      v.fold((failure) {
        emit(ErrorState(
          displayType: DisplayType.popUpDialog,
          failure: failure,
        ));
      }, (data) {
        popScreen();
      });
    });
  }

  @override
  void delete() {
    if (task != null) {
      _removeTaskUseCase(RemoveTaskRequest(task: task!)).then((v) {
        v.fold((failure) {
          emit(ErrorState(
            displayType: DisplayType.popUpDialog,
            failure: failure,
          ));
        }, (data) {
          popScreen();
        });
      });
    }
  }
}

abstract class TaskDetailViewModelInput {
  void apply(String title, String desc);

  void delete();
}

abstract class TaskDetailViewModelOutput {}
