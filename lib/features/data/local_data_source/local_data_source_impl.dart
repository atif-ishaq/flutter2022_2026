// import 'dart:async';
// import 'package:daily_todo_list/features/data/local_data_source/local_data_source.dart';
// import 'package:daily_todo_list/features/data/models/task_model.dart';
// import 'package:daily_todo_list/features/domain/entities/task_entity.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sembast/sembast.dart';
// import 'package:sembast/sembast_io.dart';
// import 'package:path/path.dart';

// const String MAP_STORE = "MAP_STORE_TASK";

// class LocalDataSourceImpl implements LocalDataSource {
//   Completer<Database>? _dbOpenCompleter;

//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   final _taskStore = intMapStoreFactory.store(MAP_STORE);

//   Future<Database> get _db async {
//     if (_dbOpenCompleter == null) {
//       await _initDatabase();
//     }
//     return _dbOpenCompleter!.future;
//   }

//   Future<void> _initDatabase() async {
//     if (_dbOpenCompleter != null) return; // Prevent multiple inits

//     _dbOpenCompleter = Completer<Database>();

//     final appDocumentDir = await getApplicationDocumentsDirectory();
//     final dbPath = join(appDocumentDir.path, "task.db");

//     final database = await databaseFactoryIo.openDatabase(dbPath);

//     _dbOpenCompleter!.complete(database);
//   }

//   @override
//   Future<void> addTask(TaskEntity task) async {
//     final newTask =
//         TaskModel(
//           title: task.title,
//           colourIndex: task.colourIndex,
//           time: task.time,
//           isTaaskCompleted: task.isTaaskCompleted,
//           isNotification: task.isNotification,
//           taskType: task.taskType,
//         ).toJson();

//     await _taskStore.add(await _db, newTask);
//   }

//   @override
//   Future<void> deleteTask(TaskEntity task) async {
//     final finder = Finder(filter: Filter.byKey(task.id));
//     await _taskStore.delete(await _db, finder: finder);
//   }

//   @override
//   Future<List<TaskEntity>> getAllTasks() async {
//     final finder = Finder(sortOrders: [SortOrder('id')]);
//     final recordSnapshots = await _taskStore.find(await _db, finder: finder);

//     return recordSnapshots.map((task) {
//       final taskData = TaskModel.fromJson(task.value);
//       taskData.id = task.key;
//       return taskData;
//     }).toList();
//   }

//   @override
//   Future<void> getNotification(TaskEntity task) async {
//     if (task.isNotification == false) {
//       final androidChannel = AndroidNotificationDetails(
//         task.id.toString(),
//         "Daily Task Notification",
//         icon: "@mipmap/ic_launcher",
//         largeIcon: DrawableResourceAndroidBitmap("@mipmap/ic_launcher"),
//       );
//       final notificationDetails = NotificationDetails(android: androidChannel);

//       flutterLocalNotificationsPlugin.show(
//         task.id,
//         task.title,
//         "It's time for ${task.title}",
//         notificationDetails,
//       );
//     } else {
//       flutterLocalNotificationsPlugin.cancel(task.id);
//     }
//   }

//   @override
//   Future<Database> openDatabse() async {
//     await _initDatabase();
//     return _dbOpenCompleter!.future;
//   }

//   @override
//   Future<void> turnOnNotification(TaskEntity task) async {
//     final updatedTask =
//         TaskModel(
//           title: task.title,
//           colourIndex: task.colourIndex,
//           time: task.time,
//           isTaaskCompleted: task.isTaaskCompleted,
//           isNotification: !(task.isNotification),
//           taskType: task.taskType,
//         ).toJson();

//     final finder = Finder(filter: Filter.byKey(task.id));
//     await _taskStore.update(await _db, updatedTask, finder: finder);
//   }

//   @override
//   Future<void> updateTask(TaskEntity task) async {
//     final updatedTask =
//         TaskModel(
//           title: task.title,
//           colourIndex: task.colourIndex,
//           time: task.time,
//           isTaaskCompleted: !(task.isTaaskCompleted),
//           isNotification: task.isNotification,
//           taskType: task.taskType,
//         ).toJson();

//     final finder = Finder(filter: Filter.byKey(task.id));
//     await _taskStore.update(await _db, updatedTask, finder: finder);
//   }

//   Future<void> debugPrintAllTasks() async {
//     final db = await _db;
//     final records = await _taskStore.find(db);
//     for (var record in records) {
//       print("Task ID: ${record.key}, Data: ${record.value}");
//     }
//   }
// }

// // import 'dart:async';

// // import 'package:daily_todo_list/features/data/local_data_source/local_data_source.dart';
// // import 'package:daily_todo_list/features/data/models/task_model.dart';
// // import 'package:daily_todo_list/features/domain/entities/task_entity.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // import 'package:path_provider/path_provider.dart';
// // import 'package:sembast/sembast_io.dart';
// // import 'package:path/path.dart';

// // const String MAP_STORE = "MAP_STORE_TASK";

// // class LocalDataSourceImpl implements LocalDataSource {
// //   late final Completer<Database> _dbOpenCompleter;
// //   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// //       FlutterLocalNotificationsPlugin();

// //   Future<Database> get _db async => _dbOpenCompleter.future;
// //   final _taskStore = intMapStoreFactory.store(MAP_STORE);

// //   Future _initDatabase() async {
// //     final appDocumentDir = await getApplicationDocumentsDirectory();
// //     final dbPath = join(appDocumentDir.path, "task.db");
// //     final database = await databaseFactoryIo.openDatabase(dbPath);
// //     _dbOpenCompleter.complete(database);
// //   }

// //   @override
// //   Future<void> addTask(TaskEntity task) async {
// //     final newTask =
// //         TaskModel(
// //           title: task.title,
// //           colourIndex: task.colourIndex,
// //           time: task.time,
// //           isTaaskCompleted: task.isTaaskCompleted,
// //           isNotification: task.isNotification,
// //           taskType: task.taskType,
// //         ).toJson();
// //     _taskStore.add(await _db, newTask);
// //   }

// //   @override
// //   Future<void> deleteTask(TaskEntity task) async {
// //     final finder = Finder(filter: Filter.byKey(task.id));
// //     _taskStore.delete(await _db, finder: finder);
// //   }

// //   @override
// //   Future<List<TaskEntity>> getAllTasks() async {
// //     final finder = Finder(sortOrders: [SortOrder('id')]);
// //     final recordSnapshots = await _taskStore.find(await _db, finder: finder);
// //     return recordSnapshots.map((task) {
// //       final taskData = TaskModel.fromJson(task.value);
// //       taskData.id = task.key;
// //       return taskData;
// //     }).toList();
// //   }

// //   @override
// //   Future<void> getNotification(TaskEntity task) async {
// //     if (task.isNotification == false) {
// //       // final dateTime = DateTime.parse(task.time);
// //       final androidChannel = AndroidNotificationDetails(
// //         task.id.toString(),
// //         "Daily Task Notification",
// //         icon: "@mipmap/ic_launcher",
// //         largeIcon: DrawableResourceAndroidBitmap("@mipmap/ic_launcher"),
// //       );
// //       final notificationDetails = NotificationDetails(android: androidChannel);
// //       flutterLocalNotificationsPlugin.show(
// //         task.id,
// //         task.title,
// //         "Its time for ${task.title}",
// //         notificationDetails,
// //       );
// //     } else {
// //       flutterLocalNotificationsPlugin.cancel(task.id);
// //     }
// //   }

// //   @override
// //   Future<Database> openDatabse() async {
// //     _initDatabase();
// //     return _dbOpenCompleter.future;
// //   }

// //   @override
// //   Future<void> turnOnNotification(TaskEntity task) async {
// //     final newTask =
// //         TaskModel(
// //           title: task.title,
// //           colourIndex: task.colourIndex,
// //           time: task.time,
// //           isTaaskCompleted: task.isTaaskCompleted,
// //           isNotification: task.isNotification == true ? false : true,
// //           taskType: task.taskType,
// //         ).toJson();
// //     final finder = Finder(filter: Filter.byKey(task.id));
// //     _taskStore.update(await _db, newTask, finder: finder);
// //   }

// //   @override
// //   Future<void> updateTask(TaskEntity task) async {
// //     final newTask =
// //         TaskModel(
// //           title: task.title,
// //           colourIndex: task.colourIndex,
// //           time: task.time,
// //           isTaaskCompleted: task.isTaaskCompleted == true ? false : true,
// //           isNotification: task.isNotification,
// //           taskType: task.taskType,
// //         ).toJson();
// //     final finder = Finder(filter: Filter.byKey(task.id));
// //     _taskStore.update(await _db, newTask, finder: finder);
// //   }
// // }

import 'dart:async';
import 'dart:io';
import 'package:daily_todo_list/features/data/local_data_source/local_data_source.dart';
import 'package:daily_todo_list/features/data/models/task_model.dart';
import 'package:daily_todo_list/features/domain/entities/task_entity.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';
import 'package:flutter/foundation.dart';
import 'package:sembast_web/sembast_web.dart'; // for web

const String MAP_STORE = "MAP_STORE_TASK";

class LocalDataSourceImpl implements LocalDataSource {
  Completer<Database>? _dbOpenCompleter;
  final _taskStore = intMapStoreFactory.store(MAP_STORE);

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<Database> get _db async {
    if (_dbOpenCompleter == null) {
      await _initDatabase();
    }
    return _dbOpenCompleter!.future;
  }

  Future<void> _initDatabase() async {
    if (_dbOpenCompleter != null) return;

    try {
      _dbOpenCompleter = Completer<Database>();
      Database database;

      if (kIsWeb) {
        // For Web: use sembast_web
        final factory = databaseFactoryWeb;
        database = await factory.openDatabase('task.db');
      } else {
        // For Mobile/Desktop: use sembast_io + path_provider
        final Directory appDocDir = await getApplicationDocumentsDirectory();
        final dbPath = join(appDocDir.path, 'task.db');
        database = await databaseFactoryIo.openDatabase(dbPath);
      }

      _dbOpenCompleter!.complete(database);
    } catch (e) {
      print('Database opening error: $e');
      _dbOpenCompleter?.completeError(e);
    }
  }

  // Future<void> _initDatabase() async {
  //   if (_dbOpenCompleter != null) return;

  //   _dbOpenCompleter = Completer<Database>();

  //   final appDocumentDir = await getApplicationDocumentsDirectory();

  //   final dbPath = join(appDocumentDir.path, "task.db");
  //   final database = await databaseFactoryIo.openDatabase(dbPath);
  //   _dbOpenCompleter!.complete(database);
  // }

  @override
  Future<Database> openDatabse() async {
    await _initDatabase();
    return _dbOpenCompleter!.future;
  }

  @override
  Future<void> addTask(TaskEntity task) async {
    final newTask =
        TaskModel(
          title: task.title,
          colourIndex: task.colourIndex,
          time: task.time,
          isTaaskCompleted: task.isTaaskCompleted,
          isNotification: task.isNotification,
          taskType: task.taskType,
        ).toJson();

    await _taskStore.add(await _db, newTask);
  }

  @override
  Future<void> deleteTask(TaskEntity task) async {
    final finder = Finder(filter: Filter.byKey(task.id));
    await _taskStore.delete(await _db, finder: finder);
  }

  @override
  Future<List<TaskEntity>> getAllTasks() async {
    final finder = Finder(sortOrders: [SortOrder('id')]);
    final records = await _taskStore.find(await _db, finder: finder);

    return records.map((snapshot) {
      final taskModel = TaskModel.fromJson(snapshot.value);
      taskModel.id = snapshot.key;
      return taskModel;
    }).toList();
  }

  @override
  Future<void> updateTask(TaskEntity task) async {
    final updatedTask =
        TaskModel(
          title: task.title,
          colourIndex: task.colourIndex,
          time: task.time,
          isTaaskCompleted: !task.isTaaskCompleted,
          isNotification: task.isNotification,
          taskType: task.taskType,
        ).toJson();

    final finder = Finder(filter: Filter.byKey(task.id));
    await _taskStore.update(await _db, updatedTask, finder: finder);
  }

  @override
  Future<void> turnOnNotification(TaskEntity task) async {
    final updatedTask =
        TaskModel(
          title: task.title,
          colourIndex: task.colourIndex,
          time: task.time,
          isTaaskCompleted: task.isTaaskCompleted,
          isNotification: !task.isNotification,
          taskType: task.taskType,
        ).toJson();

    final finder = Finder(filter: Filter.byKey(task.id));
    await _taskStore.update(await _db, updatedTask, finder: finder);
  }

  @override
  Future<void> getNotification(TaskEntity task) async {
    if (!task.isNotification) {
      final androidChannel = AndroidNotificationDetails(
        task.id.toString(),
        "Daily Task Notification",
        icon: "@mipmap/ic_launcher",
        largeIcon: DrawableResourceAndroidBitmap("@mipmap/ic_launcher"),
      );
      final notificationDetails = NotificationDetails(android: androidChannel);

      await flutterLocalNotificationsPlugin.show(
        task.id,
        task.title,
        "It's time for ${task.title}",
        notificationDetails,
      );
    } else {
      await flutterLocalNotificationsPlugin.cancel(task.id);
    }
  }

  Future<void> debugPrintAllTasks() async {
    final db = await _db;
    final records = await _taskStore.find(db);
    for (var record in records) {
      print("Task ID: ${record.key}, Data: ${record.value}");
    }
  }
}
