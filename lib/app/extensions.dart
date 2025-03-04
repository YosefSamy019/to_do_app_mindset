import 'dart:math';

import 'package:flutter/cupertino.dart';

extension MediaQuerySize on BuildContext {
  double getWidth() => MediaQuery.of(this).size.width;

  double getHeight() => MediaQuery.of(this).size.height;

  double getMin() => min(getWidth(), getHeight());
}
