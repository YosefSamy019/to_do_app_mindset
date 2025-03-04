import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../response/response.dart';

const _tasksKeys = 'tasks';
const _isFirstTime = '1st time';

abstract class CacheDataSource {
  Future<List<TaskResponse>> getTasksList();

  Future<void> setTasksList(List<TaskResponse> tasks);

  Future<void> setIsFirstTime();

  Future<bool> getIsFirstTime();
}

class CacheDataSourceImpl implements CacheDataSource {
  final SharedPreferences _preferences;

  CacheDataSourceImpl(this._preferences);

  @override
  Future<List<TaskResponse>> getTasksList() async {
    String? raw = _preferences.getString(_tasksKeys);

    if (raw == null) {
      return List.empty(growable: false);
    } else {
      List<dynamic> rawData = json.decode(raw);
      List<TaskResponse> tasks =
          rawData.map((item) => TaskResponse.fromJson(item)).toList();
      return tasks;
    }
  }

  @override
  Future<void> setTasksList(List<TaskResponse> tasks) async {
    List<Map<String, dynamic>> rawData =
        tasks.map((item) => item.toJson()).toList();
    String raw = json.encode(rawData);
    await _preferences.setString(_tasksKeys, raw);
  }

  @override
  Future<bool> getIsFirstTime() async {
    // return true;
    return _preferences.containsKey(_isFirstTime) == false;
  }

  @override
  Future<void> setIsFirstTime() async {
    await _preferences.setBool(_isFirstTime, true);
  }
}
