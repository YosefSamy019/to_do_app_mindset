import 'package:to_do_mindset/data/response/response.dart';
import 'package:to_do_mindset/domain/models/models.dart';

extension Taskmapper on TaskResponse {
  TaskModel map() {
    return TaskModel(
      title: title ?? "N-title",
      desc: desc ?? "",
      done: done ?? false,
      id: id ?? 0,
    );
  }
}
