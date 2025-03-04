import 'package:flutter/material.dart';

import '../resources/app_assets.dart';
import '../resources/app_strings.dart';
import '../resources/app_values.dart';
import 'base_states.dart';
import 'base_widgets.dart';

Widget baseBuilder(BuildContext context, BaseStates state, Widget content) {
  if (state is PopState) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context);
    });
  }

  if (state.displayType == DisplayType.popUpDialog) return content;

  if (state is InitState) {
    //do nothing
    return content;
  } else if (state is SuccessState) {
    //do nothing
    return content;
  } else if (state is LoadingState) {
    return BaseWidgets.buildItemsColumn([
      BaseWidgets.buildImage(ImageAssets.loadImage),
    ]);
  } else if (state is ErrorState) {
    return BaseWidgets.buildItemsColumn([
      BaseWidgets.buildImage(ImageAssets.errorImage),
      if (state.failure.message != null)
        BaseWidgets.buildMessage(context, state.failure.message!),
      Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: BaseWidgets.buildButton(
            displayType: state.displayType,
            context: context,
            onTap: state.retry,
            title: AppStrings.retryAgain),
      ),
    ]);
  } else if (state is ContentState) {
    //do nothing
    return content;
  } else if (state is EmptyState) {
    return BaseWidgets.buildItemsColumn([
      BaseWidgets.buildImage(ImageAssets.emptyImage),
      BaseWidgets.buildMessage(context, AppStrings.emptyContent),
      BaseWidgets.buildButton(
          displayType: state.displayType,
          context: context,
          onTap: state.retry,
          title: AppStrings.retryAgain),
    ]);
  } else {
    return content;
  }
}
