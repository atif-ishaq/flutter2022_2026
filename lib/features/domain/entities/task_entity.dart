class TaskEntity {
  late int id; // Auto-generated
  final String title;
  final int colourIndex;
  final String time;
  final bool isTaaskCompleted;
  final bool isNotification;
  final String taskType;

  TaskEntity({
    required this.title,
    required this.colourIndex,
    required this.time,
    required this.isTaaskCompleted,
    required this.isNotification,
    required this.taskType,
  });

  TaskEntity copyWith({
    String? title,
    int? colourIndex,
    String? time,
    bool? isTaaskCompleted,
    bool? isNotification,
    String? taskType,
  }) {
    return TaskEntity(
      title: title ?? this.title,
      colourIndex: colourIndex ?? this.colourIndex,
      time: time ?? this.time,
      isTaaskCompleted: isTaaskCompleted ?? this.isTaaskCompleted,
      isNotification: isNotification ?? this.isNotification,
      taskType: taskType ?? this.taskType,
    ); // Retain original ID
  }
}
