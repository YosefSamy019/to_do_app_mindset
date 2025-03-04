import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_mindset/data/network/network_info.dart';
import 'package:to_do_mindset/domain/usecase/add_task_usecase.dart';

import '../data/data_sources/cache_data_source.dart';
import '../data/data_sources/remote_data_source.dart';
import '../data/repository/repository_impl.dart';
import '../domain/repository/repository.dart';
import '../domain/usecase/edit_task_usecase.dart';
import '../domain/usecase/get_tasks_usecase.dart';
import '../domain/usecase/remove_task_usecase.dart';
import '../domain/usecase/toggle_task_usecase.dart';

final sl = GetIt.instance;

Future<void> initAppModule() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // await prefs.clear();

  NetworkInfo networkInfo = NetworkInfoImpl(InternetConnection());

  sl.registerLazySingleton<NetworkInfo>(() => networkInfo);
  sl.registerLazySingleton<CacheDataSource>(() => CacheDataSourceImpl(prefs));
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
  sl.registerLazySingleton<Repository>(() => RepositoryImpl(sl(), sl(), sl()));
}

void initHomeScreen() {
  if (sl.isRegistered<GetTaskUseCase>() == false) {
    sl.registerLazySingleton<GetTaskUseCase>(() => GetTaskUseCase(sl()));
  }
  if (sl.isRegistered<ToggleTaskUseCase>() == false) {
    sl.registerLazySingleton<ToggleTaskUseCase>(() => ToggleTaskUseCase(sl()));
  }
}

void initDetailScreen() {
  if (sl.isRegistered<AddTaskUseCase>() == false) {
    sl.registerLazySingleton<AddTaskUseCase>(() => AddTaskUseCase(sl()));
  }
  if (sl.isRegistered<EditTaskUseCase>() == false) {
    sl.registerLazySingleton<EditTaskUseCase>(() => EditTaskUseCase(sl()));
  }
  if (sl.isRegistered<RemoveTaskUseCase>() == false) {
    sl.registerLazySingleton<RemoveTaskUseCase>(() => RemoveTaskUseCase(sl()));
  }
}
