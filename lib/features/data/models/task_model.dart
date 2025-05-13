import 'package:daily_todo_list/features/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    required super.title,
    required super.colourIndex,
    required super.time,
    required super.isTaaskCompleted,
    required super.isNotification,
    required super.taskType,
  });

  static TaskModel fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json['title'],
      colourIndex: json['colourIndex'],
      time: json['time'],
      isTaaskCompleted: json['isTaaskCompleted'],
      isNotification: json['isNotification'],
      taskType: json['taskType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "colourIndex": colourIndex,
      "time": time,
      "isTaaskCompleted": isTaaskCompleted,
      "isNotification": isNotification,
      "taskType": taskType,
    };
  }
}
