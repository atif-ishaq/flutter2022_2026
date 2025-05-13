// // import 'package:awesome_dialog/awesome_dialog.dart';
// // import 'package:daily_todo_list/features/domain/entities/task_entity.dart';
// // import 'package:daily_todo_list/features/presentation/cubit/task_cubit.dart';
// // import 'package:daily_todo_list/features/presentation/widgets/common.dart';
// // import 'package:daily_todo_list/features/presentation/widgets/theme/style.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:flutter_slidable/flutter_slidable.dart';
// // import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// // import 'package:intl/intl.dart';

// // class HomePage extends StatefulWidget {
// //   const HomePage({super.key});

// //   @override
// //   State<HomePage> createState() => _HomePageState();
// // }

// // class _HomePageState extends State<HomePage> {
// //   final List<TaskEntity> _taskData = [];
// //   List<TaskEntity> _filteredTaskData = [];

// //   @override
// //   void initState() {
// //     super.initState();
// //     BlocProvider.of<TaskCubit>(context).getAllTasks();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: BlocBuilder<TaskCubit, TaskState>(
// //         builder: (context, taskState) {
// //           if (taskState is TaskLoadedState) {
// //             _taskData.clear();
// //             _taskData.addAll(taskState.taskData);
// //             _filteredTaskData = List.from(_taskData);
// //             return _pageBody();
// //           } else {
// //             return const Center(child: CircularProgressIndicator());
// //             //return _pageBody();
// //           }
// //         },
// //       ),
// //     );
// //   }

// //   Widget _pageBody() {
// //     return Column(
// //       children: [
// //         Stack(
// //           children: [
// //             _headerWidget(),
// //             Positioned(
// //               top: 80,
// //               left: 20,
// //               right: 20,
// //               child: _currentTaskWidget(),
// //             ),
// //           ],
// //         ),
// //         const SizedBox(height: 100),
// //         _filteredTaskData.isEmpty
// //             ? SizedBox(
// //               height: 250,
// //               child: Center(
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     SizedBox(
// //                       height: 70,
// //                       child: Image.asset("assets/tasks.png"),
// //                     ),
// //                     const SizedBox(height: 5),
// //                     const Text("You do not have any task to display"),
// //                   ],
// //                 ),
// //               ),
// //             )
// //             : _listTaskWidget(),
// //       ],
// //     );
// //   }

// //   Widget _headerWidget() {
// //     return Container(
// //       height: 240,
// //       width: double.infinity,
// //       decoration: BoxDecoration(
// //         gradient: LinearGradient(
// //           colors: [Colors.indigo, color6FADE4],
// //           begin: Alignment.topRight,
// //           end: Alignment.topLeft,
// //         ),
// //       ),
// //       child: Padding(
// //         padding: const EdgeInsets.only(
// //           top: 20,
// //           left: 20,
// //           right: 20,
// //           bottom: 10,
// //         ),
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 const Text(
// //                   "My Daily Tasks",
// //                   style: TextStyle(
// //                     fontSize: 16,
// //                     fontWeight: FontWeight.w600,
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 4),
// //                 Text(
// //                   "Today you have ${_filteredTaskData.length} task(s)",
// //                   style: TextStyle(
// //                     fontSize: 14,
// //                     fontWeight: FontWeight.w400,
// //                     color: Colors.white.withAlpha(140),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             PopupMenuButton<String>(
// //               icon: const Icon(Icons.filter_list_outlined, color: Colors.white),
// //               itemBuilder: (BuildContext context) {
// //                 return taskTypeList.map((value) {
// //                   return PopupMenuItem<String>(
// //                     value: value,
// //                     child: Text(value),
// //                   );
// //                 }).toList();
// //               },
// //               onSelected: (String value) {
// //                 setState(() {
// //                   if (value == "Other") {
// //                     _filteredTaskData = List.from(_taskData);
// //                   } else {
// //                     _filteredTaskData =
// //                         _taskData
// //                             .where((task) => task.taskType == value)
// //                             .toList();
// //                   }
// //                 });
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _listTaskWidget() {
// //     return Expanded(
// //       child: ListView.builder(
// //         itemCount: _filteredTaskData.length,
// //         itemBuilder:
// //             (_, index) => _buildTaskItem(context, _filteredTaskData[index]),
// //       ),
// //     );
// //   }

// //   Widget _buildTaskItem(BuildContext parentContext, TaskEntity task) {
// //     //final taskTime = DateFormat("hh:mm a").format(task.time);
// //     final taskTime = DateFormat("hh:mm a").format(DateTime.parse(task.time));
// //     final isCompleted = task.isTaaskCompleted;

// //     return Slidable(
// //       endActionPane: ActionPane(
// //         motion: const DrawerMotion(),
// //         extentRatio: 0.25,
// //         children: [
// //           SlidableAction(
// //             onPressed: (_) {
// //               // TODO: Implement delete
// //             },
// //             backgroundColor: Colors.red,
// //             icon: Icons.delete,
// //             label: 'Delete',
// //           ),
// //         ],
// //       ),
// //       child: Container(
// //         height: 60,
// //         margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
// //         child: GestureDetector(
// //           onTap: () {
// //             AwesomeDialog(
// //               context: parentContext,
// //               borderSide: BorderSide(
// //                 color: taskTypeListColor[task.colourIndex],
// //                 width: 2,
// //               ),
// //               width: 280,
// //               buttonsBorderRadius: const BorderRadius.all(Radius.circular(2)),
// //               headerAnimationLoop: true,
// //               animType: AnimType.topSlide,
// //               title: task.title,
// //               desc: '${task.title}\n$taskTime',
// //               dialogType: DialogType.info,
// //               btnOkOnPress: () {},
// //             ).show();
// //           },
// //           child: Card(
// //             elevation: 3,
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Row(
// //                   children: [
// //                     Container(
// //                       height: 60,
// //                       width: 4,
// //                       decoration: BoxDecoration(
// //                         color: taskTypeListColor[0],
// //                         borderRadius: const BorderRadius.only(
// //                           topLeft: Radius.circular(8),
// //                           bottomLeft: Radius.circular(8),
// //                         ),
// //                       ),
// //                     ),
// //                     const SizedBox(width: 10),
// //                     InkWell(
// //                       onTap: () {
// //                         // TODO: Toggle task completion
// //                       },
// //                       child: Container(
// //                         height: 30,
// //                         width: 30,
// //                         decoration: BoxDecoration(
// //                           color: isCompleted ? Colors.green : Colors.white,
// //                           borderRadius: BorderRadius.circular(40),
// //                           border: Border.all(color: Colors.grey.shade400),
// //                         ),
// //                         child: Icon(
// //                           Icons.done,
// //                           color: isCompleted ? Colors.white : Colors.grey,
// //                         ),
// //                       ),
// //                     ),
// //                     const SizedBox(width: 10),
// //                     Text(
// //                       taskTime,
// //                       style: TextStyle(color: Colors.black.withAlpha(100)),
// //                     ),
// //                     const SizedBox(width: 10),
// //                     LayoutBuilder(
// //                       builder: (context, constraints) {
// //                         return SizedBox(
// //                           width: constraints.maxWidth / 2.1,
// //                           child: Text(
// //                             task.title,
// //                             maxLines: 1,
// //                             overflow: TextOverflow.ellipsis,
// //                             style: TextStyle(
// //                               color: Colors.black,
// //                               decoration:
// //                                   isCompleted
// //                                       ? TextDecoration.lineThrough
// //                                       : TextDecoration.none,
// //                             ),
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                   ],
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.only(right: 12),
// //                   child: Icon(
// //                     FontAwesomeIcons.bell,
// //                     color: isCompleted ? Colors.deepOrange : Colors.grey,
// //                     size: 18,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _currentTaskWidget() {
// //     return Container(
// //       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
// //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
// //       height: 120,
// //       width: double.infinity,
// //       decoration: BoxDecoration(
// //         borderRadius: BorderRadius.circular(16),
// //         color: Colors.indigo.shade400.withAlpha(200),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black.withAlpha(25),
// //             blurRadius: 8,
// //             offset: const Offset(0, 4),
// //           ),
// //         ],
// //       ),
// //       child: Row(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Expanded(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 const Text(
// //                   "Today Reminder",
// //                   style: TextStyle(
// //                     fontSize: 16,
// //                     fontWeight: FontWeight.bold,
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 8),
// //                 const Text(
// //                   "Title",
// //                   style: TextStyle(fontSize: 14, color: Colors.white),
// //                 ),
// //                 const SizedBox(height: 8),
// //                 Text(
// //                   DateFormat("hh:mm a").format(DateTime.now()),
// //                   style: const TextStyle(fontSize: 13, color: Colors.white),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           const SizedBox(width: 12),
// //           SizedBox(
// //             height: 48,
// //             width: 48,
// //             child: Image.asset('assets/bell_icon.png'),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:daily_todo_list/features/domain/entities/task_entity.dart';
// import 'package:daily_todo_list/features/presentation/cubit/task_cubit.dart';
// import 'package:daily_todo_list/features/presentation/widgets/common.dart';
// import 'package:daily_todo_list/features/presentation/widgets/theme/style.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:intl/intl.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final List<TaskEntity> _taskData = [];
//   List<TaskEntity> _filteredTaskData = [];

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       BlocProvider.of<TaskCubit>(context).getAllTasks();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<TaskCubit, TaskState>(
//         builder: (context, taskState) {
//           if (taskState is TaskLoadedState) {
//             _taskData.clear();
//             _taskData.addAll(taskState.taskData);
//             _filteredTaskData = List.from(_taskData);
//             return _pageBody(); // Proceed to render the UI
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             ); // Loading state
//           }
//         },
//       ),
//     );
//   }

//   Widget _pageBody() {
//     return Column(
//       children: [
//         Stack(
//           children: [
//             _headerWidget(),
//             Positioned(
//               top: 80,
//               left: 20,
//               right: 20,
//               child: _currentTaskWidget(),
//             ),
//           ],
//         ),
//         const SizedBox(height: 100),
//         _filteredTaskData.isEmpty ? _emptyTaskWidget() : _listTaskWidget(),
//       ],
//     );
//   }

//   Widget _emptyTaskWidget() {
//     return SizedBox(
//       height: 250,
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: 70, child: Image.asset("assets/tasks.png")),
//             const SizedBox(height: 5),
//             const Text("You do not have any task to display"),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _headerWidget() {
//     return Container(
//       height: 240,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Colors.indigo, color6FADE4],
//           begin: Alignment.topRight,
//           end: Alignment.topLeft,
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(
//           top: 20,
//           left: 20,
//           right: 20,
//           bottom: 10,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "My Daily Tasks",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   "Today you have ${_filteredTaskData.length} task(s)",
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.white.withAlpha(140),
//                   ),
//                 ),
//               ],
//             ),
//             PopupMenuButton<String>(
//               icon: const Icon(Icons.filter_list_outlined, color: Colors.white),
//               itemBuilder: (BuildContext context) {
//                 return taskTypeList.map((value) {
//                   return PopupMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList();
//               },
//               onSelected: (String value) {
//                 setState(() {
//                   if (value == "Other") {
//                     _filteredTaskData = List.from(_taskData);
//                   } else {
//                     _filteredTaskData =
//                         _taskData
//                             .where((task) => task.taskType == value)
//                             .toList();
//                   }
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _listTaskWidget() {
//     return Expanded(
//       child: ListView.builder(
//         itemCount: _filteredTaskData.length,
//         itemBuilder:
//             (_, index) => _buildTaskItem(context, _filteredTaskData[index]),
//       ),
//     );
//   }

//   Widget _buildTaskItem(BuildContext parentContext, TaskEntity task) {
//     final taskTime = DateFormat("hh:mm a").format(DateTime.parse(task.time));
//     final isCompleted = task.isTaaskCompleted;

//     return Slidable(
//       endActionPane: ActionPane(
//         motion: const DrawerMotion(),
//         extentRatio: 0.25,
//         children: [
//           SlidableAction(
//             onPressed: (_) {
//               // TODO: Implement delete
//             },
//             backgroundColor: Colors.red,
//             icon: Icons.delete,
//             label: 'Delete',
//           ),
//         ],
//       ),
//       child: GestureDetector(
//         onTap: () {
//           AwesomeDialog(
//             context: parentContext,
//             borderSide: BorderSide(
//               color: taskTypeListColor[task.colourIndex],
//               width: 2,
//             ),
//             width: 280,
//             buttonsBorderRadius: const BorderRadius.all(Radius.circular(2)),
//             headerAnimationLoop: true,
//             animType: AnimType.topSlide,
//             title: task.title,
//             desc: '${task.title}\n$taskTime',
//             dialogType: DialogType.info,
//             btnOkOnPress: () {},
//           ).show();
//         },
//         child: Card(
//           elevation: 3,
//           child: Container(
//             height: 60,
//             margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       height: 60,
//                       width: 4,
//                       decoration: BoxDecoration(
//                         color: taskTypeListColor[task.colourIndex],
//                         borderRadius: const BorderRadius.only(
//                           topLeft: Radius.circular(8),
//                           bottomLeft: Radius.circular(8),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     InkWell(
//                       onTap: () {
//                         // TODO: Toggle completion
//                       },
//                       child: Container(
//                         height: 30,
//                         width: 30,
//                         decoration: BoxDecoration(
//                           color: isCompleted ? Colors.green : Colors.white,
//                           borderRadius: BorderRadius.circular(40),
//                           border: Border.all(color: Colors.grey.shade400),
//                         ),
//                         child: Icon(
//                           Icons.done,
//                           color: isCompleted ? Colors.white : Colors.grey,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     Text(
//                       taskTime,
//                       style: TextStyle(color: Colors.black.withAlpha(100)),
//                     ),
//                     const SizedBox(width: 10),
//                     SizedBox(
//                       width: 120,
//                       child: Text(
//                         task.title,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                           color: Colors.black,
//                           decoration:
//                               isCompleted
//                                   ? TextDecoration.lineThrough
//                                   : TextDecoration.none,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 12),
//                   child: Icon(
//                     FontAwesomeIcons.bell,
//                     color: isCompleted ? Colors.deepOrange : Colors.grey,
//                     size: 18,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _currentTaskWidget() {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//       height: 120,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: Colors.indigo.shade400.withAlpha(200),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withAlpha(25),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Today Reminder",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   "Title",
//                   style: TextStyle(fontSize: 14, color: Colors.white),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   DateFormat("hh:mm a").format(DateTime.now()),
//                   style: const TextStyle(fontSize: 13, color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 12),
//           SizedBox(
//             height: 48,
//             width: 48,
//             child: Image.asset('assets/bell_icon.png'),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:daily_todo_list/features/domain/entities/task_entity.dart';
import 'package:daily_todo_list/features/presentation/cubit/task_cubit.dart';
import 'package:daily_todo_list/features/presentation/widgets/common.dart';
import 'package:daily_todo_list/features/presentation/widgets/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TaskEntity> _taskData = [];
  List<TaskEntity> _filteredTaskData = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<TaskCubit>(context).getAllTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, taskState) {
          if (taskState is TaskLoadedState) {
            _taskData = taskState.taskData; // Direct assignment
            _filteredTaskData = List.from(
              _taskData,
            ); // Copy data to filtered list
            return _pageBody();
          } else if (taskState is TaskLoadingState) {
            // return const Center(child: CircularProgressIndicator());
            return _pageBody();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _pageBody() {
    return Column(
      children: [
        Stack(
          children: [
            _headerWidget(),
            Positioned(
              top: 80,
              left: 20,
              right: 20,
              child: _currentTaskWidget(),
            ),
          ],
        ),
        const SizedBox(height: 100),
        _filteredTaskData.isEmpty ? _emptyTaskWidget() : _listTaskWidget(),
      ],
    );
  }

  Widget _emptyTaskWidget() {
    return SizedBox(
      height: 250,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 70, child: Image.asset("assets/tasks.png")),
            const SizedBox(height: 5),
            const Text("You do not have any task to display"),
          ],
        ),
      ),
    );
  }

  Widget _headerWidget() {
    return Container(
      height: 240,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.indigo, color6FADE4],
          begin: Alignment.topRight,
          end: Alignment.topLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "My Daily Tasks",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Today you have ${_filteredTaskData.length} task(s)",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withAlpha(140),
                  ),
                ),
              ],
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.filter_list_outlined, color: Colors.white),
              itemBuilder: (BuildContext context) {
                return taskTypeList.map((value) {
                  return PopupMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList();
              },
              onSelected: (String value) {
                setState(() {
                  if (value == "Other") {
                    _filteredTaskData = List.from(_taskData); // Reset filter
                  } else {
                    _filteredTaskData =
                        _taskData
                            .where((task) => task.taskType == value)
                            .toList(); // Apply filter
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _listTaskWidget() {
    return Expanded(
      child: ListView.builder(
        itemCount: _filteredTaskData.length,
        itemBuilder:
            (_, index) => _buildTaskItem(context, _filteredTaskData[index]),
      ),
    );
  }

  Widget _buildTaskItem(BuildContext parentContext, TaskEntity task) {
    final taskTime = DateFormat("hh:mm a").format(DateTime.parse(task.time));
    final isCompleted = task.isTaaskCompleted;

    return Slidable(
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.25,
        children: [
          SlidableAction(
            onPressed: (_) {
              // TODO: Implement delete action
            },
            backgroundColor: Colors.red,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          AwesomeDialog(
            context: parentContext,
            borderSide: BorderSide(
              color: taskTypeListColor[task.colourIndex],
              width: 2,
            ),
            width: 280,
            buttonsBorderRadius: const BorderRadius.all(Radius.circular(2)),
            headerAnimationLoop: true,
            animType: AnimType.topSlide,
            title: task.title,
            desc: '${task.title}\n$taskTime',
            dialogType: DialogType.info,
            btnOkOnPress: () {},
          ).show();
        },
        child: Card(
          elevation: 3,
          child: Container(
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: 4,
                      decoration: BoxDecoration(
                        color: taskTypeListColor[task.colourIndex],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        // TODO: Toggle completion status
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: isCompleted ? Colors.green : Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        child: Icon(
                          Icons.done,
                          color: isCompleted ? Colors.white : Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      taskTime,
                      style: TextStyle(color: Colors.black.withAlpha(100)),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 120,
                      child: Text(
                        task.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          decoration:
                              isCompleted
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Icon(
                    FontAwesomeIcons.bell,
                    color: isCompleted ? Colors.deepOrange : Colors.grey,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _currentTaskWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.indigo.shade400.withAlpha(200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Today Reminder",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Title",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  DateFormat("hh:mm a").format(DateTime.now()),
                  style: const TextStyle(fontSize: 13, color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            height: 48,
            width: 48,
            child: Image.asset('assets/bell_icon.png'),
          ),
        ],
      ),
    );
  }
}
