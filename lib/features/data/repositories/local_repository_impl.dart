import 'package:daily_todo_list/features/data/local_data_source/local_data_source.dart';
import 'package:daily_todo_list/features/domain/entities/task_entity.dart';
import 'package:daily_todo_list/features/domain/repositories/local_repository.dart';
import 'package:sembast/sembast.dart';

class LocalRepositoryImpl implements LocalRepository {
  final LocalDataSource localDataSource;

  LocalRepositoryImpl({required this.localDataSource});

  @override
  Future<void> addTaskUseCase(TaskEntity task) async {
    try {
      await localDataSource.addTask(task);
    } catch (e) {
      print('Error in addTaskUseCase: $e');
      rethrow;
    }
  }

  @override
  Future<void> deleteTaskUseCase(TaskEntity task) async {
    try {
      await localDataSource.deleteTask(task);
    } catch (e) {
      print('Error in deleteTaskUseCase: $e');
      rethrow;
    }
  }

  @override
  Future<List<TaskEntity>> getAllTasksUseCase() async {
    try {
      return await localDataSource.getAllTasks();
    } catch (e) {
      print('Error in getAllTasksUseCase: $e');
      rethrow;
    }
  }

  @override
  Future<void> getNotificationUseCase(TaskEntity task) async {
    try {
      await localDataSource.getNotification(task);
    } catch (e) {
      print('Error in getNotificationUseCase: $e');
      rethrow;
    }
  }

  @override
  Future<Database> openDatabseUseCase() async {
    try {
      return await localDataSource.openDatabse();
    } catch (e) {
      print('Error in openDatabseUseCase: $e');
      rethrow;
    }
  }

  @override
  Future<void> turnOnNotificationUseCase(TaskEntity task) async {
    try {
      await localDataSource.turnOnNotification(task);
    } catch (e) {
      print('Error in turnOnNotificationUseCase: $e');
      rethrow;
    }
  }

  @override
  Future<void> updateTaskUseCase(TaskEntity task) async {
    try {
      await localDataSource.updateTask(task);
    } catch (e) {
      print('Error in updateTaskUseCase: $e');
      rethrow;
    }
  }
}

// import 'package:daily_todo_list/features/data/local_data_source/local_data_source.dart';
// import 'package:daily_todo_list/features/domain/entities/task_entity.dart';
// import 'package:daily_todo_list/features/domain/repositories/local_repository.dart';
// import 'package:sembast/utils/import_export_io.dart';

// class LocalRepositoryImpl implements LocalRepository {
//   final LocalDataSource localDataSource;

//   LocalRepositoryImpl({required this.localDataSource});
//   @override
//   Future<void> addTaskUseCase(TaskEntity task) async {
//     return localDataSource.addTask(task);
//   }

//   @override
//   Future<void> deleteTaskUseCase(TaskEntity task) async {
//     return localDataSource.deleteTask(task);
//   }

//   @override
//   Future<List<TaskEntity>> getAllTasksUseCase() async {
//     return localDataSource.getAllTasks();
//   }

//   @override
//   Future<void> getNotificationUseCase(TaskEntity task) async {
//     return localDataSource.getNotification(task);
//   }

//   @override
//   Future<Database> openDatabseUseCase() async {
//     return openDatabseUseCase();
//   }

//   @override
//   Future<void> turnOnNotificationUseCase(TaskEntity task) async {
//     return localDataSource.turnOnNotification(task);
//   }

//   @override
//   Future<void> updateTaskUseCase(TaskEntity task) async {
//     return localDataSource.updateTask(task);
//   }
// }
