import 'package:flutter/material.dart';
import '../resources/app_assets.dart';
import '../resources/app_strings.dart';
import 'base_states.dart';
import 'base_widgets.dart';

void baseListener(BuildContext context, BaseStates state) {
  if (state.displayType == DisplayType.fullScreen) return;

  if (state is InitState) {
    //do nothing
  } else if (state is SuccessState) {
    BaseWidgets.showPopUpDialog(context, [
      BaseWidgets.buildImage(ImageAssets.successImage),
      BaseWidgets.buildMessage(context, state.message),
    ]);
  } else if (state is LoadingState) {
    BaseWidgets.showPopUpDialog(context, [
      BaseWidgets.buildImage(ImageAssets.loadImage),
    ]);
  } else if (state is ErrorState) {
    BaseWidgets.showPopUpDialog(context, [
      BaseWidgets.buildImage(ImageAssets.errorImage),
      if (state.failure.message != null)
        BaseWidgets.buildMessage(context, state.failure.message!),
      BaseWidgets.buildButton(
          displayType: state.displayType,
          context: context,
          onTap: state.retry,
          title: AppStrings.retryAgain),
    ]);
  } else if (state is ContentState) {
    //do nothing
  } else if (state is EmptyState) {
    BaseWidgets.showPopUpDialog(context, [
      BaseWidgets.buildImage(ImageAssets.emptyImage),
      BaseWidgets.buildMessage(context, AppStrings.emptyContent),
      BaseWidgets.buildButton(
          displayType: state.displayType,
          context: context,
          onTap: state.retry,
          title: AppStrings.retryAgain),
    ]);
  } else if (state is ConfirmState) {
    BaseWidgets.showPopUpDialog(context, [
      BaseWidgets.buildImage(ImageAssets.sureImage),
      BaseWidgets.buildMessage(context, AppStrings.areYouSure),
    ], actions: [
      BaseWidgets.buildButton(
          displayType: state.displayType,
          context: context,
          onTap: state.onAccept,
          title: AppStrings.sure),
      BaseWidgets.buildButton(
          displayType: state.displayType,
          context: context,
          onTap: state.onCancel,
          title: AppStrings.cancel),
    ]);
  }
}
