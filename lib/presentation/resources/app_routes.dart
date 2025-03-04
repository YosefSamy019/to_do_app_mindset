import 'package:flutter/material.dart';
import 'package:to_do_mindset/domain/models/models.dart';
import 'package:to_do_mindset/presentation/screens/home/view/home_view.dart';

import '../../app/sl.dart';
import '../screens/task_detail/view/task_view.dart';

class AppRoutes {
  AppRoutes._();

  static gotoTask(BuildContext context,
      {required TaskModel? task, VoidCallback? onReturn}) {
    return Navigator.of(context)
        .pushNamed(
      '/task_detail',
      arguments: task,
    )
        .then((v) {
      if (onReturn != null) onReturn();
    });
  }

  static final routers = {
    '/': (context) {
      initHomeScreen();
      return HomeView();
    },
    '/task_detail': (context) {
      TaskModel? task =
          ModalRoute.of(context)!.settings.arguments as TaskModel?;
      initDetailScreen();
      return TaskDetailView(
        task: task,
      );
    },
  };
}
