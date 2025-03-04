class TaskResponse {
  String? title;
  String? desc;
  bool? done;
  int? id;

  TaskResponse(this.title, this.desc, this.done, this.id);

  factory TaskResponse.fromJson(Map<String, dynamic> json) {
    return TaskResponse(
      json['title'],
      json['desc'],
      json['done'],
      json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'desc': desc,
      'done': done,
      'id': id,
    };
  }
}
