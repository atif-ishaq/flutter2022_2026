import 'package:daily_todo_list/features/domain/entities/task_entity.dart';
import 'package:sembast/utils/import_export_io.dart';

abstract class LocalRepository {
  Future<void> addTaskUseCase(TaskEntity task);
  Future<void> updateTaskUseCase(TaskEntity task);
  Future<void> deleteTaskUseCase(TaskEntity task);
  Future<List<TaskEntity>> getAllTasksUseCase();
  Future<void> getNotificationUseCase(TaskEntity task);
  Future<void> turnOnNotificationUseCase(TaskEntity task);
  Future<Database> openDatabseUseCase();
}
