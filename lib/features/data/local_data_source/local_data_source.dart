import 'package:daily_todo_list/features/domain/entities/task_entity.dart';
import 'package:sembast/utils/import_export_io.dart';

abstract class LocalDataSource {
  Future<void> addTask(TaskEntity task);
  Future<void> updateTask(TaskEntity task);
  Future<void> deleteTask(TaskEntity task);
  Future<List<TaskEntity>> getAllTasks();
  Future<void> getNotification(TaskEntity task);
  Future<void> turnOnNotification(TaskEntity task);
  Future<Database> openDatabse();
}
