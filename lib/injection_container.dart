import 'package:get_it/get_it.dart';
import 'package:daily_todo_list/features/data/local_data_source/local_data_source.dart';
import 'package:daily_todo_list/features/data/local_data_source/local_data_source_impl.dart';
import 'package:daily_todo_list/features/data/repositories/local_repository_impl.dart';
import 'package:daily_todo_list/features/domain/repositories/local_repository.dart';
import 'package:daily_todo_list/features/domain/usecases/add_task.dart';
import 'package:daily_todo_list/features/domain/usecases/delete_task.dart';
import 'package:daily_todo_list/features/domain/usecases/get_all_tasks.dart';
import 'package:daily_todo_list/features/domain/usecases/get_notification.dart';
import 'package:daily_todo_list/features/domain/usecases/open_database.dart';
import 'package:daily_todo_list/features/domain/usecases/turn_on_notifications.dart';
import 'package:daily_todo_list/features/domain/usecases/update_task.dart';
import 'package:daily_todo_list/features/presentation/cubit/task_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Register DataSource first to avoid circular dependency
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  // Register Repository after DataSource
  sl.registerLazySingleton<LocalRepository>(
    () => LocalRepositoryImpl(localDataSource: sl()),
  );

  // Register Use Cases
  sl.registerLazySingleton<AddTaskUseCase>(
    () => AddTaskUseCase(localRepository: sl()),
  );
  sl.registerLazySingleton<DeleteTaskUseCase>(
    () => DeleteTaskUseCase(localRepository: sl()),
  );
  sl.registerLazySingleton<UpdateTaskUseCase>(
    () => UpdateTaskUseCase(localRepository: sl()),
  );
  sl.registerLazySingleton<GetAllTasksUseCase>(
    () => GetAllTasksUseCase(localRepository: sl()),
  );
  sl.registerLazySingleton<GetNotificationUseCase>(
    () => GetNotificationUseCase(localRepository: sl()),
  );
  sl.registerLazySingleton<OpenDatabaseUseCase>(
    () => OpenDatabaseUseCase(localRepository: sl()),
  );
  sl.registerLazySingleton<TurnOnNotificationsUseCase>(
    () => TurnOnNotificationsUseCase(localRepository: sl()),
  );

  // Register Bloc/Cubit
  sl.registerFactory<TaskCubit>(
    () => TaskCubit(
      addTaskUseCase: sl(),
      deleteTaskUseCase: sl(),
      getAllTasksUseCase: sl(),
      getNotificationUseCase: sl(),
      openDatabaseUseCase: sl(),
      turnOnNotificationsUseCase: sl(),
      updateTaskUseCase: sl(),
    ),
  );

  // Externals: Add any other dependencies like shared preferences or notifications if required
}


//++++++++++++++++++++++++++++++

// import 'package:get_it/get_it.dart';
// import 'package:daily_todo_list/features/data/local_data_source/local_data_source.dart';
// import 'package:daily_todo_list/features/data/local_data_source/local_data_source_impl.dart';
// import 'package:daily_todo_list/features/data/repositories/local_repository_impl.dart';
// import 'package:daily_todo_list/features/domain/repositories/local_repository.dart';
// import 'package:daily_todo_list/features/domain/usecases/add_task.dart';
// import 'package:daily_todo_list/features/domain/usecases/delete_task.dart';
// import 'package:daily_todo_list/features/domain/usecases/get_all_tasks.dart';
// import 'package:daily_todo_list/features/domain/usecases/get_notification.dart';
// import 'package:daily_todo_list/features/domain/usecases/open_database.dart';
// import 'package:daily_todo_list/features/domain/usecases/turn_on_notifications.dart';
// import 'package:daily_todo_list/features/domain/usecases/update_task.dart';
// import 'package:daily_todo_list/features/presentation/cubit/task_cubit.dart';

// final sl = GetIt.instance;

// Future<void> init() async {
//   // Bloc/Cubit
//   sl.registerFactory<TaskCubit>(
//     () => TaskCubit(
//       addTaskUseCase: sl(),
//       deleteTaskUseCase: sl(),
//       getAllTasksUseCase: sl(),
//       getNotificationUseCase: sl(),
//       openDatabaseUseCase: sl(),
//       turnOnNotificationsUseCase: sl(),
//       updateTaskUseCase: sl(),
//     ),
//   );

//   // Use Cases
//   sl.registerLazySingleton<AddTaskUseCase>(
//     () => AddTaskUseCase(localRepository: sl()),
//   );
//   sl.registerLazySingleton<DeleteTaskUseCase>(
//     () => DeleteTaskUseCase(localRepository: sl()),
//   );
//   sl.registerLazySingleton<UpdateTaskUseCase>(
//     () => UpdateTaskUseCase(localRepository: sl()),
//   );
//   sl.registerLazySingleton<GetAllTasksUseCase>(
//     () => GetAllTasksUseCase(localRepository: sl()),
//   );
//   sl.registerLazySingleton<GetNotificationUseCase>(
//     () => GetNotificationUseCase(localRepository: sl()),
//   );
//   sl.registerLazySingleton<OpenDatabaseUseCase>(
//     () => OpenDatabaseUseCase(localRepository: sl()),
//   );
//   sl.registerLazySingleton<TurnOnNotificationsUseCase>(
//     () => TurnOnNotificationsUseCase(localRepository: sl()),
//   );

//   // Repository
//   sl.registerLazySingleton<LocalRepository>(
//     () => LocalRepositoryImpl(localDataSource: sl()),
//   );

//   // Data Source
//   sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

//   // Externals
//   // Add any external dependencies like database, shared preferences, notifications, etc.
// }


//++++++++++++++++++++++++++++++++++++++++++




// // import 'package:daily_todo_list/features/data/local_data_source/local_data_source.dart';
// // import 'package:daily_todo_list/features/data/local_data_source/local_data_source_impl.dart';
// // import 'package:daily_todo_list/features/data/repositories/local_repository_impl.dart';
// // import 'package:daily_todo_list/features/domain/repositories/local_repository.dart';
// // import 'package:daily_todo_list/features/domain/usecases/add_task.dart';
// // import 'package:daily_todo_list/features/domain/usecases/delete_task.dart';
// // import 'package:daily_todo_list/features/domain/usecases/get_all_tasks.dart';
// // import 'package:daily_todo_list/features/domain/usecases/get_notification.dart';
// // import 'package:daily_todo_list/features/domain/usecases/open_database.dart';
// // import 'package:daily_todo_list/features/domain/usecases/turn_on_notifications.dart';
// // import 'package:daily_todo_list/features/domain/usecases/update_task.dart';
// // import 'package:daily_todo_list/features/presentation/cubit/task_cubit.dart';
// // import 'package:get_it/get_it.dart';

// // GetIt sl = GetIt.instance();

// // Future<void> init() async {
// //   //bloc/cubit
// //   sl.registerFactory<TaskCubit>(
// //     () => TaskCubit(
// //       addTaskUseCase: sl.call(),
// //       deleteTaskUseCase: sl.call(),
// //       getAllTasksUseCase: sl.call(),
// //       getNotificationUseCase: sl.call(),
// //       openDatabaseUseCase: sl.call(),
// //       turnOnNotificationsUseCase: sl.call(),
// //       updateTaskUseCase: sl.call(),
// //     ),
// //   );
// //   //usecases
// //   sl.registerLazySingleton<AddTaskUseCase>(
// //     () => AddTaskUseCase(localRepository: sl.call()),
// //   );
// //   sl.registerLazySingleton<DeleteTaskUseCase>(
// //     () => DeleteTaskUseCase(localRepository: sl.call()),
// //   );
// //   sl.registerLazySingleton<UpdateTaskUseCase>(
// //     () => UpdateTaskUseCase(localRepository: sl.call()),
// //   );
// //   sl.registerLazySingleton<GetAllTasksUseCase>(
// //     () => GetAllTasksUseCase(localRepository: sl.call()),
// //   );
// //   sl.registerLazySingleton<GetNotificationUseCase>(
// //     () => GetNotificationUseCase(localRepository: sl.call()),
// //   );
// //   sl.registerLazySingleton<OpenDatabaseUseCase>(
// //     () => OpenDatabaseUseCase(localRepository: sl.call()),
// //   );
// //   sl.registerLazySingleton<TurnOnNotificationsUseCase>(
// //     () => TurnOnNotificationsUseCase(localRepository: sl.call()),
// //   );
// //   sl.registerLazySingleton<UpdateTaskUseCase>(
// //     () => UpdateTaskUseCase(localRepository: sl.call()),
// //   );

// //   //repository
// //   sl.registerLazySingleton<LocalRepository>(
// //     () => LocalRepositoryImpl(localDataSource: sl.call()),
// //   );
// //   //datasource
// //   sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

// //   //externals
// // }

// import 'package:get_it/get_it.dart';

// import 'package:daily_todo_list/features/data/local_data_source/local_data_source.dart';
// import 'package:daily_todo_list/features/data/local_data_source/local_data_source_impl.dart';
// import 'package:daily_todo_list/features/data/repositories/local_repository_impl.dart';
// import 'package:daily_todo_list/features/domain/repositories/local_repository.dart';
// import 'package:daily_todo_list/features/domain/usecases/add_task.dart';
// import 'package:daily_todo_list/features/domain/usecases/delete_task.dart';
// import 'package:daily_todo_list/features/domain/usecases/get_all_tasks.dart';
// import 'package:daily_todo_list/features/domain/usecases/get_notification.dart';
// import 'package:daily_todo_list/features/domain/usecases/open_database.dart';
// import 'package:daily_todo_list/features/domain/usecases/turn_on_notifications.dart';
// import 'package:daily_todo_list/features/domain/usecases/update_task.dart';
// import 'package:daily_todo_list/features/presentation/cubit/task_cubit.dart';

// final sl = GetIt.instance;

// Future<void> init() async {
//   // Bloc/Cubit
//   sl.registerFactory<TaskCubit>(
//     () => TaskCubit(
//       addTaskUseCase: sl(),
//       deleteTaskUseCase: sl(),
//       getAllTasksUseCase: sl(),
//       getNotificationUseCase: sl(),
//       openDatabaseUseCase: sl(),
//       turnOnNotificationsUseCase: sl(),
//       updateTaskUseCase: sl(),
//     ),
//   );

//   // Use Cases
//   sl.registerLazySingleton<AddTaskUseCase>(
//     () => AddTaskUseCase(localRepository: sl()),
//   );
//   sl.registerLazySingleton<DeleteTaskUseCase>(
//     () => DeleteTaskUseCase(localRepository: sl()),
//   );
//   sl.registerLazySingleton<UpdateTaskUseCase>(
//     () => UpdateTaskUseCase(localRepository: sl()),
//   );
//   sl.registerLazySingleton<GetAllTasksUseCase>(
//     () => GetAllTasksUseCase(localRepository: sl()),
//   );
//   sl.registerLazySingleton<GetNotificationUseCase>(
//     () => GetNotificationUseCase(localRepository: sl()),
//   );
//   sl.registerLazySingleton<OpenDatabaseUseCase>(
//     () => OpenDatabaseUseCase(localRepository: sl()),
//   );
//   sl.registerLazySingleton<TurnOnNotificationsUseCase>(
//     () => TurnOnNotificationsUseCase(localRepository: sl()),
//   );

//   // Repository
//   sl.registerLazySingleton<LocalRepository>(
//     () => LocalRepositoryImpl(localDataSource: sl()),
//   );

//   // Data Source
//   sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

//   // Externals
//   // Add registrations for database, notifications, or shared preferences here if required
// }
