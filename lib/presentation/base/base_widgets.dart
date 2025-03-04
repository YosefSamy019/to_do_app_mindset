import 'dart:math';

import 'package:flutter/material.dart';
import 'package:to_do_mindset/app/extensions.dart';

import '../resources/app_colors.dart';
import '../resources/app_values.dart';
import '../resources/text_styles.dart';
import 'base_states.dart';

class BaseWidgets {
  BaseWidgets._();

  static Widget buildImage(String imgPath) {
    return SizedBox(
        height: AppSize.s100, width: AppSize.s100, child: Image.asset(imgPath));
  }

  static Widget buildItemsColumn(List<Widget> children) {
    return SizedBox(
      width: AppSize.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }

  static void showPopUpDialog(BuildContext context, List<Widget> children,
      {List<Widget>? actions}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              actions: actions,
              actionsAlignment: MainAxisAlignment.spaceEvenly,
              content: Padding(
                padding: const EdgeInsets.all(AppPadding.p20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: children,
                  ),
                ),
              ),
            ));
  }

  static Widget buildMessage(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Text(
          message,
          style: AppTextStyles.baseStatesMessageTextStyle(context),
        ),
      ),
    );
  }

  static Widget buildButton(
      {required DisplayType displayType,
      required BuildContext context,
      required String title,
      void Function()? onTap}) {
    if (onTap == null) return const SizedBox();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: SizedBox(
            width: max(AppSize.s250, context.getWidth() * AppSize.s0p26),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shadowColor: AppColors.pink,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s20),
                        side: BorderSide(
                          color: AppColors.pink,
                          width: AppSize.s0p5,
                        ))),
                onPressed: () {
                  if (displayType == DisplayType.popUpDialog) {
                    Navigator.of(context).pop();
                  }
                  onTap();
                },
                child: Text(
                  title,
                  style: AppTextStyles.baseStatesElevatedBtnTextStyle(context),
                ))),
      ),
    );
  }
}
