import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:to_do_mindset/app/app.dart';
import 'package:to_do_mindset/presentation/base/bloc_observer.dart';

import 'app/sl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  initAppModule();
  runApp(MyApp());
}
