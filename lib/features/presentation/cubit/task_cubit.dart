// import 'package:daily_todo_list/features/domain/entities/task_entity.dart';
// import 'package:daily_todo_list/features/domain/usecases/add_task.dart';
// import 'package:daily_todo_list/features/domain/usecases/delete_task.dart';
// import 'package:daily_todo_list/features/domain/usecases/get_all_tasks.dart';
// import 'package:daily_todo_list/features/domain/usecases/get_notification.dart';
// import 'package:daily_todo_list/features/domain/usecases/open_database.dart';
// import 'package:daily_todo_list/features/domain/usecases/turn_on_notifications.dart';
// import 'package:daily_todo_list/features/domain/usecases/update_task.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'task_state.dart';

// class TaskCubit extends Cubit<TaskState> {
//   final AddTaskUseCase addTaskUseCase;
//   final DeleteTaskUseCase deleteTaskUseCase;
//   final GetAllTasksUseCase getAllTasksUseCase;
//   final GetNotificationUseCase getNotificationUseCase;
//   final OpenDatabaseUseCase openDatabaseUseCase;
//   final TurnOnNotificationsUseCase turnOnNotificationsUseCase;
//   final UpdateTaskUseCase updateTaskUseCase;

//   TaskCubit({
//     required this.addTaskUseCase,
//     required this.deleteTaskUseCase,
//     required this.getAllTasksUseCase,
//     required this.getNotificationUseCase,
//     required this.openDatabaseUseCase,
//     required this.turnOnNotificationsUseCase,
//     required this.updateTaskUseCase,
//   }) : super(TaskInitialState());

//   Future<void> openDatabaseConnection() async {
//     try {
//       emit(TaskLoadingState());
//       await openDatabaseUseCase.call();
//       await getAllTasks();
//     } catch (e, stackTrace) {
//       print("Database opening error: $e\n$stackTrace");
//       emit(TaskFailureState());
//     }
//   }

//   Future<void> addNewTask({required TaskEntity task}) async {
//     try {
//       emit(TaskLoadingState());
//       await addTaskUseCase.call(task);
//       await getAllTasks();
//     } catch (e, stackTrace) {
//       print("Add task error: $e\n$stackTrace");
//       emit(TaskFailureState());
//     }
//   }

//   Future<void> deleteTask({required TaskEntity task}) async {
//     try {
//       emit(TaskLoadingState());
//       await deleteTaskUseCase.call(task);
//       await getAllTasks();
//     } catch (e, stackTrace) {
//       print("Delete task error: $e\n$stackTrace");
//       emit(TaskFailureState());
//     }
//   }

//   Future<void> updateTask({required TaskEntity task}) async {
//     try {
//       emit(TaskLoadingState());
//       await updateTaskUseCase.call(task);
//       await getAllTasks();
//     } catch (e, stackTrace) {
//       print("Update task error: $e\n$stackTrace");
//       emit(TaskFailureState());
//     }
//   }

//   Future<void> getAllTasks() async {
//     try {
//       emit(TaskLoadingState());
//       final taskData = await getAllTasksUseCase.call();
//       emit(TaskLoadedState(taskData: taskData));
//     } catch (e, stackTrace) {
//       print("Fetch tasks error: $e\n$stackTrace");
//       emit(TaskFailureState());
//     }
//   }

//   Future<void> getNotifications({required TaskEntity task}) async {
//     try {
//       await getNotificationUseCase.call(task);
//       // Optionally emit a state if the UI should react
//     } catch (e, stackTrace) {
//       print("Get notification error: $e\n$stackTrace");
//     }
//   }

//   Future<void> turnOnNotification({required TaskEntity task}) async {
//     try {
//       await turnOnNotificationsUseCase.call(task);
//       await getAllTasks(); // If toggling notification affects the task list
//     } catch (e, stackTrace) {
//       print("Turn on notification error: $e\n$stackTrace");
//     }
//   }
// }

// //++++++++++++++++++++++++++++++++++++++

// // import 'package:daily_todo_list/features/domain/entities/task_entity.dart';
// // import 'package:daily_todo_list/features/domain/usecases/add_task.dart';
// // import 'package:daily_todo_list/features/domain/usecases/delete_task.dart';
// // import 'package:daily_todo_list/features/domain/usecases/get_all_tasks.dart';
// // import 'package:daily_todo_list/features/domain/usecases/get_notification.dart';
// // import 'package:daily_todo_list/features/domain/usecases/open_database.dart';
// // import 'package:daily_todo_list/features/domain/usecases/turn_on_notifications.dart';
// // import 'package:daily_todo_list/features/domain/usecases/update_task.dart';
// // import 'package:equatable/equatable.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';

// // part 'task_state.dart';

// // class TaskCubit extends Cubit<TaskState> {
// //   final AddTaskUseCase addTaskUseCase;
// //   final DeleteTaskUseCase deleteTaskUseCase;
// //   final GetAllTasksUseCase getAllTasksUseCase;
// //   final GetNotificationUseCase getNotificationUseCase;
// //   final OpenDatabaseUseCase openDatabaseUseCase;
// //   final TurnOnNotificationsUseCase turnOnNotificationsUseCase;
// //   final UpdateTaskUseCase updateTaskUseCase;

// //   TaskCubit({
// //     required this.addTaskUseCase,
// //     required this.deleteTaskUseCase,
// //     required this.getAllTasksUseCase,
// //     required this.getNotificationUseCase,
// //     required this.openDatabaseUseCase,
// //     required this.turnOnNotificationsUseCase,
// //     required this.updateTaskUseCase,
// //   }) : super(TaskInitialState());

// //   Future<void> openDatabaseConnection() async {
// //     try {
// //       emit(TaskLoadingState());
// //       await openDatabaseUseCase.call();
// //       await getAllTasks();
// //     } catch (e) {
// //       print("Database opening error: $e");
// //       emit(TaskFailureState());
// //     }
// //   }

// //   Future<void> addNewTask({required TaskEntity task}) async {
// //     try {
// //       emit(TaskLoadingState());
// //       await addTaskUseCase.call(task);
// //       await getAllTasks();
// //     } catch (e) {
// //       print("Add task error: $e");
// //       emit(TaskFailureState());
// //     }
// //   }

// //   Future<void> deleteTask({required TaskEntity task}) async {
// //     try {
// //       emit(TaskLoadingState());
// //       await deleteTaskUseCase.call(task);
// //       await getAllTasks();
// //     } catch (e) {
// //       print("Delete task error: $e");
// //       emit(TaskFailureState());
// //     }
// //   }

// //   Future<void> updateTask({required TaskEntity task}) async {
// //     try {
// //       emit(TaskLoadingState());
// //       await updateTaskUseCase.call(task);
// //       await getAllTasks();
// //     } catch (e) {
// //       print("Update task error: $e");
// //       emit(TaskFailureState());
// //     }
// //   }

// //   Future<void> getAllTasks() async {
// //     try {
// //       emit(TaskLoadingState());
// //       final taskData = await getAllTasksUseCase.call();
// //       emit(TaskLoadedState(taskData: taskData));
// //     } catch (e) {
// //       print("Fetch tasks error: $e");
// //       emit(TaskFailureState());
// //     }
// //   }

// //   Future<void> getNotifications({required TaskEntity task}) async {
// //     try {
// //       await getNotificationUseCase.call(task);
// //       // Optional: emit a state if needed
// //     } catch (e) {
// //       print("Get notification error: $e");
// //     }
// //   }

// //   Future<void> turnOnNotification({required TaskEntity task}) async {
// //     try {
// //       await turnOnNotificationsUseCase.call(task);
// //       // Optional: emit a state if needed
// //     } catch (e) {
// //       print("Turn on notification error: $e");
// //     }
// //   }
// // }

// //+++++++++++++++++++++++++++++++

// // import 'package:daily_todo_list/features/domain/entities/task_entity.dart';
// // import 'package:daily_todo_list/features/domain/usecases/add_task.dart';
// // import 'package:daily_todo_list/features/domain/usecases/delete_task.dart';
// // import 'package:daily_todo_list/features/domain/usecases/get_all_tasks.dart';
// // import 'package:daily_todo_list/features/domain/usecases/get_notification.dart';
// // import 'package:daily_todo_list/features/domain/usecases/open_database.dart';
// // import 'package:daily_todo_list/features/domain/usecases/turn_on_notifications.dart';
// // import 'package:daily_todo_list/features/domain/usecases/update_task.dart';
// // import 'package:equatable/equatable.dart';
// // //import 'package:daily_todo_list/features/presentation/cubit/task_state.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';

// // part 'task_state.dart';

// // class TaskCubit extends Cubit<TaskState> {
// //   final AddTaskUseCase addTaskUseCase;
// //   final DeleteTaskUseCase deleteTaskUseCase;
// //   final GetAllTasksUseCase getAllTasksUseCase;
// //   final GetNotificationUseCase getNotificationUseCase;
// //   final OpenDatabaseUseCase openDatabaseUseCase;
// //   final TurnOnNotificationsUseCase turnOnNotificationsUseCase;
// //   final UpdateTaskUseCase updateTaskUseCase;

// //   TaskCubit({
// //     required this.addTaskUseCase,
// //     required this.deleteTaskUseCase,
// //     required this.getAllTasksUseCase,
// //     required this.getNotificationUseCase,
// //     required this.openDatabaseUseCase,
// //     required this.turnOnNotificationsUseCase,
// //     required this.updateTaskUseCase,
// //   }) : super(TaskInitialState());

// //   Future<void> addNewTask({required TaskEntity task}) async {
// //     try {
// //       await addTaskUseCase.call(task);
// //     } catch (_) {}
// //   }

// //   Future<void> deleteTask({required TaskEntity task}) async {
// //     try {
// //       await deleteTaskUseCase.call(task);
// //     } catch (_) {}
// //   }

// //   Future<void> getAllTasks() async {
// //     try {
// //       final taskData = await getAllTasksUseCase.call();
// //       emit(TaskLoadedState(taskData: taskData));
// //     } catch (_) {
// //       emit(TaskFailureState());
// //     }
// //   }

// //   Future<void> openDatabaseConnection() async {
// //     try {
// //       await openDatabaseUseCase.call();
// //     } catch (_) {}
// //   }

// //   Future<void> getNotifications({required TaskEntity task}) async {
// //     try {
// //       await getNotificationUseCase.call(task);
// //     } catch (_) {}
// //   }

// //   Future<void> turnOnNotification({required TaskEntity task}) async {
// //     try {
// //       await turnOnNotificationsUseCase.call(task);
// //     } catch (_) {}
// //   }

// //   Future<void> updateTask({required TaskEntity task}) async {
// //     try {
// //       await updateTaskUseCase.call(task);
// //     } catch (_) {}
// //   }
// // }

import 'package:daily_todo_list/features/domain/entities/task_entity.dart';
import 'package:daily_todo_list/features/domain/usecases/add_task.dart';
import 'package:daily_todo_list/features/domain/usecases/delete_task.dart';
import 'package:daily_todo_list/features/domain/usecases/get_all_tasks.dart';
import 'package:daily_todo_list/features/domain/usecases/get_notification.dart';
import 'package:daily_todo_list/features/domain/usecases/open_database.dart';
import 'package:daily_todo_list/features/domain/usecases/turn_on_notifications.dart';
import 'package:daily_todo_list/features/domain/usecases/update_task.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final AddTaskUseCase addTaskUseCase;
  final DeleteTaskUseCase deleteTaskUseCase;
  final GetAllTasksUseCase getAllTasksUseCase;
  final GetNotificationUseCase getNotificationUseCase;
  final OpenDatabaseUseCase openDatabaseUseCase;
  final TurnOnNotificationsUseCase turnOnNotificationsUseCase;
  final UpdateTaskUseCase updateTaskUseCase;

  TaskCubit({
    required this.addTaskUseCase,
    required this.deleteTaskUseCase,
    required this.getAllTasksUseCase,
    required this.getNotificationUseCase,
    required this.openDatabaseUseCase,
    required this.turnOnNotificationsUseCase,
    required this.updateTaskUseCase,
  }) : super(TaskInitialState());

  Future<void> openDatabaseConnection() async {
    try {
      emit(TaskLoadingState());
      await openDatabaseUseCase.call();
      await getAllTasks();
    } catch (e, stackTrace) {
      print("Database opening error: $e\n$stackTrace");
      emit(TaskFailureState(errorMessage: 'Error opening database.'));
    }
  }

  Future<void> addNewTask({required TaskEntity task}) async {
    try {
      emit(TaskLoadingState());
      await addTaskUseCase.call(task);
      await getAllTasks();
    } catch (e, stackTrace) {
      print("Add task error: $e\n$stackTrace");
      emit(TaskFailureState(errorMessage: 'Error adding task.'));
    }
  }

  Future<void> deleteTask({required TaskEntity task}) async {
    try {
      emit(TaskLoadingState());
      await deleteTaskUseCase.call(task);
      await getAllTasks();
    } catch (e, stackTrace) {
      print("Delete task error: $e\n$stackTrace");
      emit(TaskFailureState(errorMessage: 'Error deleting task.'));
    }
  }

  Future<void> updateTask({required TaskEntity task}) async {
    try {
      emit(TaskLoadingState());
      await updateTaskUseCase.call(task);
      await getAllTasks();
    } catch (e, stackTrace) {
      print("Update task error: $e\n$stackTrace");
      emit(TaskFailureState(errorMessage: 'Error updating task.'));
    }
  }

  Future<void> getAllTasks() async {
    try {
      emit(TaskLoadingState());
      final taskData = await getAllTasksUseCase.call();
      emit(TaskLoadedState(taskData: taskData));
    } catch (e, stackTrace) {
      print("Fetch tasks error: $e\n$stackTrace");
      emit(TaskFailureState(errorMessage: 'Error fetching tasks.'));
    }
  }

  Future<void> getNotifications({required TaskEntity task}) async {
    try {
      await getNotificationUseCase.call(task);
      // Optionally emit a state if the UI should react
    } catch (e, stackTrace) {
      print("Get notification error: $e\n$stackTrace");
      emit(TaskFailureState(errorMessage: 'Error fetching notification.'));
    }
  }

  Future<void> turnOnNotification({required TaskEntity task}) async {
    try {
      await turnOnNotificationsUseCase.call(task);
      await getAllTasks(); // If toggling notification affects the task list
    } catch (e, stackTrace) {
      print("Turn on notification error: $e\n$stackTrace");
      emit(TaskFailureState(errorMessage: 'Error enabling notification.'));
    }
  }
}
