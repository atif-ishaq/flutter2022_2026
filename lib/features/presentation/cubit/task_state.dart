// part of 'task_cubit.dart';

// abstract class TaskState extends Equatable {
//   const TaskState();
//   @override
//   List<Object?> get props => [];
// }

// // Initial state when the cubit is first created
// class TaskInitialState extends TaskState {}

// // Emitted while a task operation is in progress
// class TaskLoadingState extends TaskState {}

// // Emitted when tasks are successfully loaded
// class TaskLoadedState extends TaskState {
//   final List<TaskEntity> taskData;

//   const TaskLoadedState({required this.taskData});

//   @override
//   List<Object?> get props => [taskData]; // 👈 FIX: include taskData in props for proper equality checks
// }

// // Emitted when any task operation fails
// class TaskFailureState extends TaskState {}

// // //import 'package:daily_todo_list/features/domain/entities/task_entity.dart';
// // //import 'package:equatable/equatable.dart';

// // part of 'task_cubit.dart';

// // abstract class TaskState extends Equatable {
// //   const TaskState();
// // }

// // class TaskInitialState extends TaskState {
// //   @override
// //   List<Object?> get props => [];
// // }

// // class TaskLoadingState extends TaskState {
// //   @override
// //   List<Object?> get props => [];
// // }

// // class TaskLoadedState extends TaskState {
// //   final List<TaskEntity> taskData;

// //   const TaskLoadedState({required this.taskData});
// //   @override
// //   List<Object?> get props => [];
// // }

// // class TaskFailureState extends TaskState {
// //   @override
// //   List<Object?> get props => [];
// // }
part of 'task_cubit.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object?> get props => [];
}

// Initial state when the cubit is first created
class TaskInitialState extends TaskState {}

// Emitted while a task operation is in progress
class TaskLoadingState extends TaskState {}

// Emitted when tasks are successfully loaded
class TaskLoadedState extends TaskState {
  final List<TaskEntity> taskData;

  const TaskLoadedState({required this.taskData});

  @override
  List<Object?> get props => [taskData]; // Ensure taskData is included for equality checks
}

// Emitted when any task operation fails
class TaskFailureState extends TaskState {
  final String errorMessage;

  const TaskFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
