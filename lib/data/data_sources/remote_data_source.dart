import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import '../response/response.dart';

abstract class RemoteDataSource {
  Future<List<TaskResponse>> loadTasks();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<List<TaskResponse>> loadTasks() async {
    var url = Uri.https('jsonplaceholder.typicode.com', 'todos');
    var response = await http.get(url);

    var rawData = response.body;

    List<dynamic> content = json.decode(rawData);
    content.shuffle();

    content = content.sublist(0, min(10, content.length));
    List<TaskResponse> output =
        content.map((item) => TaskResponse.fromJson(item)).toList();

    return output;
  }
}
