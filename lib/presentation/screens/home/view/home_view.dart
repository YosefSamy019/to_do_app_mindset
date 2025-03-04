import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_mindset/domain/models/models.dart';
import 'package:to_do_mindset/presentation/base/base_states.dart';
import 'package:to_do_mindset/presentation/base/cubit_builder.dart';
import 'package:to_do_mindset/presentation/base/cubit_listener.dart';
import 'package:to_do_mindset/presentation/resources/app_colors.dart';
import 'package:to_do_mindset/presentation/resources/app_icons.dart';
import 'package:to_do_mindset/presentation/resources/app_routes.dart';
import 'package:to_do_mindset/presentation/resources/app_strings.dart';
import 'package:to_do_mindset/presentation/resources/app_values.dart';
import 'package:to_do_mindset/presentation/resources/text_styles.dart';

import '../view_model/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeViewModel>(
      create: (context) => HomeViewModel()..start(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.todo),
        ),
        body: BlocConsumer<HomeViewModel, BaseStates>(
          listener: baseListener,
          builder: (context, state) {
            return baseBuilder(
                context,
                state,
                _buildListView(
                  context,
                  BlocProvider.of<HomeViewModel>(context),
                ));
          },
        ),
        floatingActionButton: _buildFAB(context),
      ),
    );
  }

  Widget _buildFAB(BuildContext context) {
    return BlocBuilder<HomeViewModel, BaseStates>(builder: (context, state) {
      return FloatingActionButton(
          onPressed: () {
            HomeViewModel cubit = BlocProvider.of<HomeViewModel>(context);

            AppRoutes.gotoTask(context, task: null, onReturn: () {
              cubit.refresh();
            });
          },
          child: Icon(AppIcons.add));
    });
  }

  Widget _buildListView(BuildContext context, HomeViewModel cubit) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: AppPadding.p80),
      itemCount: cubit.getHomeList.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(context, cubit.getHomeList[index], cubit),
    );
  }

  Widget _buildTaskTile(
      BuildContext context, TaskModel task, HomeViewModel cubit) {
    return ListTile(
      tileColor: task.done ? AppColors.secondary : null,
      leading: task.done
          ? CircleAvatar(
              backgroundColor: AppColors.primary,
              child: Icon(
                AppIcons.done,
                color: AppColors.white,
              ),
            )
          : CircleAvatar(
              backgroundColor: AppColors.white,
              child: Center(child: Text(task.title[0].toUpperCase(),
              style: AppTextStyles.circleAvatarStyle(context),)),
            ),
      title: Text(
        task.title.trim(),
        style: AppTextStyles.taskTitle(context),
      ),
      subtitle: Text(
        task.desc.trim(),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.taskDesc(context),
      ),
      onTap: () {
        cubit.toggle(task);
      },
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {
                AppRoutes.gotoTask(context, task: task, onReturn: () {
                  cubit.refresh();
                });
              },
              icon: Icon(AppIcons.edit)),
        ],
      ),
    );
  }
}
