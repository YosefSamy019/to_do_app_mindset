import 'package:to_do_mindset/domain/models/models.dart';
import 'package:to_do_mindset/domain/request/request.dart';
import 'package:to_do_mindset/domain/usecase/get_tasks_usecase.dart';
import 'package:to_do_mindset/domain/usecase/toggle_task_usecase.dart';

import '../../../../app/sl.dart';
import '../../../base/base_cubit.dart';
import '../../../base/base_states.dart';

class HomeViewModel extends BaseCubit
    implements HomeViewModelInput, HomeViewModelOutput {
  late final GetTaskUseCase _getTaskUseCase = sl();
  late final ToggleTaskUseCase _toggleTaskUseCase = sl();

  final List<TaskModel> _tasks = [];

  @override
  void start() {
    emit(LoadingState(displayType: DisplayType.fullScreen));

    _getTaskUseCase(null).then((val) {
      val.fold((failure) {
        emit(ErrorState(
          failure: failure,
          retry: start,
        ));
      }, (data) {
        _tasks.clear();
        _tasks.addAll(data);
        emit(ContentState());
      });
    });
  }

  @override
  List<TaskModel> get getHomeList => _tasks;

  @override
  void refresh() {
    _getTaskUseCase(null).then((val) {
      val.fold((failure) {
        emit(ErrorState(
          failure: failure,
          retry: start,
        ));
      }, (data) {
        _tasks.clear();
        _tasks.addAll(data);
        if (_tasks.isNotEmpty) {
          emit(ContentState());
        } else {
          emit(EmptyState());
        }
      });
    });
  }

  @override
  void toggle(TaskModel task) {
    _toggleTaskUseCase(ToggleTaskRequest(task: task)).then((val) {
      val.fold((failure) {
        emit(ErrorState(
          failure: failure,
          retry: start,
        ));
      }, (data) {
        refresh();
      });
    });
  }
}

abstract class HomeViewModelInput {
  void refresh();

  void toggle(TaskModel task);
}

abstract class HomeViewModelOutput {
  List<TaskModel> get getHomeList;
}
