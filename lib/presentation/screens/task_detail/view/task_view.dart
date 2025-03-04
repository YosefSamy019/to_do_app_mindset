import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_mindset/domain/models/models.dart';
import 'package:to_do_mindset/presentation/base/base_states.dart';
import 'package:to_do_mindset/presentation/base/cubit_builder.dart';
import 'package:to_do_mindset/presentation/base/cubit_listener.dart';
import 'package:to_do_mindset/presentation/resources/app_colors.dart';
import 'package:to_do_mindset/presentation/resources/app_values.dart';
import 'package:to_do_mindset/presentation/resources/text_styles.dart';

import '../../../resources/app_strings.dart';
import '../view_model/task_detail_view_model.dart';

class TaskDetailView extends StatefulWidget {
  const TaskDetailView({super.key, required this.task});

  final TaskModel? task;

  @override
  State<TaskDetailView> createState() => _TaskDetailViewState();
}

class _TaskDetailViewState extends State<TaskDetailView> {
  late final TextEditingController _titleController;
  late final TextEditingController _descController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _titleController = TextEditingController();
    _descController = TextEditingController();

    if (widget.task != null) {
      _titleController.text = widget.task!.title;
      _descController.text = widget.task!.desc;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskDetailViewModel>(
      create: (context) => TaskDetailViewModel(widget.task)..start(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              widget.task == null ? AppStrings.newTask : AppStrings.editTask),
        ),
        body: BlocConsumer<TaskDetailViewModel, BaseStates>(
          listener: baseListener,
          builder: (context, state) {
            TaskDetailViewModel cubit =
                BlocProvider.of<TaskDetailViewModel>(context);
            return baseBuilder(context, state, _buildBody(cubit));
          },
        ),
      ),
    );
  }

  Widget _buildBody(TaskDetailViewModel cubit) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    AppStrings.enterLabel,
                    style: AppTextStyles.taskStyle(context),
                  ),
                  _buildTitleField(),
                  SizedBox(
                    height: AppSize.s40,
                  ),
                  Text(
                    AppStrings.enterDesc,
                    style: AppTextStyles.taskStyle(context),
                  ),
                  _buildDescField(),
                ],
              ),
            ),
            Row(
              children: [
                if (widget.task == null)
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(AppStrings.cancel),
                  )),
                if (widget.task != null)
                  Expanded(
                      child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.error,
                    ),
                    onPressed: () {
                      cubit.delete();
                    },
                    child: Text(AppStrings.delete),
                  )),
                SizedBox(
                  width: AppSize.s10,
                ),
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      cubit.apply(_titleController.text, _descController.text);
                    }
                  },
                  child: Text(AppStrings.apply),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTitleField() {
    return TextFormField(
      controller: _titleController,
      maxLines: 2,
      validator: (v) {
        if (v == null) return AppStrings.invalid;
        if (v.trim().isEmpty) return AppStrings.invalid;
        return null;
      },
      decoration: InputDecoration(
          // labelText: 'Enter Label',
          ),
    );
  }

  Widget _buildDescField() {
    return TextFormField(
      controller: _descController,
      maxLines: 10,
      decoration: InputDecoration(
          // labelText: 'Enter Desc',
          ),
    );
  }
}
