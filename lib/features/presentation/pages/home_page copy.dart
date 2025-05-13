import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:daily_todo_list/features/domain/entities/task_entity.dart';
//import 'package:daily_todo_list/features/presentation/cubit/task_cubit.dart';
import 'package:daily_todo_list/features/presentation/widgets/common.dart';
import 'package:daily_todo_list/features/presentation/widgets/theme/style.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
//import 'package:path/path.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final SlidableController _slideController = SlidableController();

  final List<TaskEntity> _taskData = [];
  List<TaskEntity> _filteredTaskData = [];

  // @override
  // void initState() {
  //   super.initState();
  //   final taskCubit = BlocProvider.of<TaskCubit>(context);
  //   taskCubit.getAllTasks();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              _headerWidget(),
              Positioned(
                top: 80, // Adjust this to change the overlap distance
                left: 20,
                right: 20,
                child: _currentTaskWidget(),
              ),
            ],
          ),
          SizedBox(height: 100),
          Text("Hello"),
          _listTaskWidget(),
          // BlocBuilder<TaskCubit, TaskState>(
          //   builder: (context, state) {
          //     if (state is TaskLoadedState) {
          //       _taskData = state.taskData;
          //       if (_filteredTaskData.isEmpty) _filteredTaskData = _taskData;
          //       return _listTaskWidget(context, _filteredTaskData);
          //     } else if (state is TaskLoadingState) {
          //       return const Expanded(
          //         child: Center(child: CircularProgressIndicator()),
          //       );
          //     } else {
          //       return const Expanded(
          //         child: Center(child: Text('No tasks available.')),
          //       );
          //     }
          //   },
          // ),
        ],
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
          top: 20, // 🔧 reduced from 40 to 10
          left: 20,
          right: 20,
          bottom: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start, // align to top
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
                SizedBox(
                  height: 4,
                ), // ⬅️ small spacing between title and task count
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
                    _filteredTaskData = _taskData;
                  } else {
                    _filteredTaskData =
                        _taskData
                            .where((element) => element.taskType == value)
                            .toList();
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
        itemCount: 25,
        itemBuilder: (_, index) => _buildTaskItem(context),
      ),
    );
  }
  // Widget _listTaskWidget(BuildContext context, List<TaskEntity> taskData) {
  //   return Expanded(
  //     child: ListView.builder(
  //       itemCount: taskData.length,
  //       itemBuilder: (_, index) {
  //         return _buildTaskItem(context, taskData[index]);
  //       },
  //     ),
  //   );
  // }

  Widget _buildTaskItem(BuildContext parentContext) {
    return Slidable(
      //controller: _slideController,
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.25,
        children: [
          // Fixed: Added a SlidableAction with icon and label
          SlidableAction(
            onPressed: (_) {
              // Implement delete action logic here
            },
            backgroundColor: Colors.red,
            icon: Icons.delete, // Provide the icon
            label: 'Delete', // Provide the label
          ),
          // Removed the previous FittedBox container here (moved inside SlidableAction)
        ],
      ),
      child: Container(
        height: 60,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 3),
        width: double.infinity,
        child: Builder(
          builder:
              (context) => GestureDetector(
                onTap: () {
                  AwesomeDialog(
                    context: parentContext,
                    borderSide: BorderSide(
                      color: taskTypeListColor[0],
                      width: 2,
                    ),
                    width: 280,
                    buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
                    headerAnimationLoop: true,
                    animType: AnimType.topSlide,
                    title: "Title",
                    desc:
                        'title\n${DateFormat("hh:mm a").format(DateTime.now())}',
                    showCloseIcon: false,
                    dialogType: DialogType.info,
                    btnOkOnPress: () {},
                  ).show();
                },
                child: Card(
                  elevation: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 60,
                            width: 4,
                            decoration: BoxDecoration(
                              color: taskTypeListColor[0],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              //FIX : UPDATE TASK
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color:
                                    true == false ? Colors.white : Colors.green,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40),
                                ),
                                border: Border.all(color: Colors.grey.shade400),
                              ),
                              child:
                                  true == false
                                      ? Icon(Icons.done, color: Colors.grey)
                                      : Icon(Icons.done, color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            DateFormat("hh:mm a").format(DateTime.now()),
                            style: TextStyle(
                              color: Colors.black.withAlpha(100),
                            ),
                          ),
                          SizedBox(width: 10),
                          LayoutBuilder(
                            builder: (context, constraints) {
                              return SizedBox(
                                width: constraints.maxWidth / 2.1,
                                child: Text(
                                  "Task Title",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.black,
                                    decoration:
                                        true == false
                                            ? TextDecoration.none
                                            : TextDecoration.lineThrough,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          //FIX : Set Notification
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Icon(
                            FontAwesomeIcons.bell,
                            color:
                                true == false ? Colors.grey : Colors.deepOrange,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        ),
      ),
    );
  }
  // Widget _buildTaskItem(BuildContext context, TaskEntity task) {
  //   final taskCubit = BlocProvider.of<TaskCubit>(context);
  //   final taskTime = DateFormat("hh:mm a").format(DateTime.parse(task.time));

  //   return Slidable(
  //     key: ValueKey(task.id),
  //     endActionPane: ActionPane(
  //       motion: const DrawerMotion(),
  //       extentRatio: 0.25,
  //       children: [_buildDeleteAction(taskCubit, task)],
  //     ),
  //     child: GestureDetector(
  //       onTap: () => _showTaskDialog(context, task, taskTime),
  //       child: Card(
  //         elevation: 3,
  //         margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             _buildTaskDetails(context, task, taskTime, taskCubit),
  //             _buildNotificationIcon(context, task, taskCubit),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildDeleteAction(TaskCubit taskCubit, TaskEntity task) {
  //   return GestureDetector(
  //     onTap: () {
  //       taskCubit.deleteTask(task: task).then((_) {
  //         Future.delayed(const Duration(seconds: 1), () {
  //           taskCubit.getAllTasks();
  //         });
  //       });
  //     },
  //     child: _circleButton(
  //       icon: Icons.delete,
  //       label: "Delete",
  //       color: Colors.red,
  //     ),
  //   );
  // }

  // Widget _circleButton({
  //   required IconData icon,
  //   required String label,
  //   required Color color,
  // }) {
  //   return Container(
  //     height: 40,
  //     width: 40,
  //     margin: const EdgeInsets.all(6),
  //     decoration: BoxDecoration(
  //       color: color,
  //       borderRadius: BorderRadius.circular(50),
  //     ),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Icon(icon, size: 16, color: Colors.white),
  //         Text(label, style: const TextStyle(fontSize: 7, color: Colors.white)),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildTaskDetails(
  //   BuildContext context,
  //   TaskEntity task,
  //   String time,
  //   TaskCubit taskCubit,
  // ) {
  //   return Row(
  //     children: [
  //       Container(
  //         height: 60,
  //         width: 4,
  //         decoration: BoxDecoration(
  //           color: taskTypeListColor[task.colourIndex],
  //           borderRadius: const BorderRadius.only(
  //             topLeft: Radius.circular(8),
  //             bottomLeft: Radius.circular(8),
  //           ),
  //         ),
  //       ),
  //       const SizedBox(width: 10),
  //       InkWell(
  //         onTap: () {
  //           taskCubit
  //               .updateTask(
  //                 task: task.copyWith(isTaaskCompleted: !task.isTaaskCompleted),
  //               )
  //               .then((_) {
  //                 Future.delayed(const Duration(seconds: 1), () {
  //                   taskCubit.getAllTasks();
  //                 });
  //               });
  //         },
  //         child: Container(
  //           height: 30,
  //           width: 30,
  //           decoration: BoxDecoration(
  //             color: task.isTaaskCompleted ? Colors.green : Colors.white,
  //             borderRadius: BorderRadius.circular(40),
  //             border: Border.all(color: Colors.grey.shade400),
  //           ),
  //           child: Icon(
  //             Icons.done,
  //             color: task.isTaaskCompleted ? Colors.white : Colors.grey,
  //           ),
  //         ),
  //       ),
  //       const SizedBox(width: 10),
  //       Text(time, style: TextStyle(color: Colors.black.withAlpha(40))),
  //       const SizedBox(width: 10),
  //       SizedBox(
  //         width: MediaQuery.of(context).size.width / 2.1,
  //         child: Text(
  //           task.title,
  //           maxLines: 1,
  //           overflow: TextOverflow.ellipsis,
  //           style: TextStyle(
  //             color: Colors.black,
  //             decoration:
  //                 task.isTaaskCompleted
  //                     ? TextDecoration.lineThrough
  //                     : TextDecoration.none,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildNotificationIcon(
  //   BuildContext context,
  //   TaskEntity task,
  //   TaskCubit taskCubit,
  // ) {
  //   return GestureDetector(
  //     onTap: () {
  //       taskCubit.turnOnNotification(task: task).then((_) {
  //         Future.delayed(const Duration(seconds: 1), () {
  //           taskCubit.getAllTasks();
  //         });
  //       });
  //       taskCubit.getNotifications(task: task);
  //     },
  //     child: Padding(
  //       padding: const EdgeInsets.only(right: 12),
  //       child: Icon(
  //         FontAwesomeIcons.bell,
  //         color: task.isNotification ? Colors.deepOrange : Colors.grey,
  //         size: 18,
  //       ),
  //     ),
  //   );
  // }

  // void _showTaskDialog(BuildContext context, TaskEntity task, String time) {
  //   AwesomeDialog(
  //     context: context,
  //     borderSide: BorderSide(color: taskTypeListColor[0], width: 2),
  //     width: 280,
  //     buttonsBorderRadius: const BorderRadius.all(Radius.circular(2)),
  //     headerAnimationLoop: true,
  //     animType: AnimType.topSlide,
  //     title: task.title,
  //     desc: "${task.title}\n$time",
  //     dialogType: DialogType.info,
  //     btnOkOnPress: () {},
  //   ).show();
  // }

  Widget _currentTaskWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.indigo.shade400.withAlpha(200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     colors: [Colors.indigo, color6FADE4],
      //     begin: Alignment.topRight,
      //     end: Alignment.topLeft,
      //   ),
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.black.withAlpha(25),
      //       blurRadius: 8,
      //       offset: Offset(0, 4),
      //     ),
      //   ],
      // ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today Reminder",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Title",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  DateFormat("hh:mm a").format(DateTime.now()),
                  style: TextStyle(fontSize: 13, color: Colors.white),
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

  // @override
  // void dispose() {
  //   _taskData.clear();
  //   _filteredTaskData.clear();
  //   super.dispose();
  // }
}



////////////////////////////////////
///
///
//import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:daily_todo_list/features/domain/entities/task_entity.dart';
// import 'package:daily_todo_list/features/presentation/cubit/task_cubit.dart';
// import 'package:daily_todo_list/features/presentation/widgets/common.dart';
// import 'package:daily_todo_list/features/presentation/widgets/theme/style.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:intl/intl.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<TaskEntity> _taskData = [];
//   List<TaskEntity> _filteredTaskData = [];
//   bool _isInitialized = false;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     if (!_isInitialized) {
//       BlocProvider.of<TaskCubit>(context).getAllTasks();
//       _isInitialized = true;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           _headerWidget(),
//           BlocBuilder<TaskCubit, TaskState>(
//             builder: (context, state) {
//               if (state is TaskLoadedState) {
//                 _taskData = state.taskData;
//                 if (_filteredTaskData.isEmpty) _filteredTaskData = _taskData;
//                 return _listTaskWidget(context, _filteredTaskData);
//               } else if (state is TaskLoadingState) {
//                 return const Expanded(
//                   child: Center(child: CircularProgressIndicator()),
//                 );
//               } else {
//                 return const Expanded(
//                   child: Center(child: Text('No tasks available.')),
//                 );
//               }
//             },
//           ),
//         ],
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
//           top: 40,
//           left: 20,
//           right: 20,
//           bottom: 10,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
//                     _filteredTaskData = _taskData;
//                   } else {
//                     _filteredTaskData =
//                         _taskData
//                             .where((element) => element.taskType == value)
//                             .toList();
//                   }
//                 });
//               },
//               child: Icon(Icons.filter_list_outlined, color: Colors.white),
//             ),
//             _currentTaskWidget(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _listTaskWidget(BuildContext context, List<TaskEntity> taskData) {
//     return Expanded(
//       child: ListView.builder(
//         itemCount: taskData.length,
//         itemBuilder: (_, index) => _buildTaskItem(context, taskData[index]),
//       ),
//     );
//   }

//   Widget _buildTaskItem(BuildContext context, TaskEntity task) {
//     final taskCubit = BlocProvider.of<TaskCubit>(context);
//     final taskTime = DateFormat("hh:mm a").format(DateTime.parse(task.time));

//     return Slidable(
//       key: ValueKey(task.id),
//       endActionPane: ActionPane(
//         motion: const DrawerMotion(),
//         extentRatio: 0.25,
//         children: [_buildDeleteAction(taskCubit, task)],
//       ),
//       child: GestureDetector(
//         onTap: () => _showTaskDialog(context, task, taskTime),
//         child: Card(
//           elevation: 3,
//           margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               _buildTaskDetails(context, task, taskTime, taskCubit),
//               _buildNotificationIcon(context, task, taskCubit),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildDeleteAction(TaskCubit taskCubit, TaskEntity task) {
//     return GestureDetector(
//       onTap: () {
//         taskCubit.deleteTask(task: task).then((_) {
//           Future.delayed(const Duration(seconds: 1), () {
//             taskCubit.getAllTasks();
//           });
//         });
//       },
//       child: _circleButton(
//         icon: Icons.delete,
//         label: "Delete",
//         color: Colors.red,
//       ),
//     );
//   }

//   Widget _circleButton({
//     required IconData icon,
//     required String label,
//     required Color color,
//   }) {
//     return Container(
//       height: 40,
//       width: 40,
//       margin: const EdgeInsets.all(6),
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(50),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, size: 16, color: Colors.white),
//           Text(label, style: const TextStyle(fontSize: 7, color: Colors.white)),
//         ],
//       ),
//     );
//   }

//   Widget _buildTaskDetails(
//     BuildContext context,
//     TaskEntity task,
//     String time,
//     TaskCubit taskCubit,
//   ) {
//     return Row(
//       children: [
//         Container(
//           height: 60,
//           width: 4,
//           decoration: BoxDecoration(
//             color: taskTypeListColor[task.colourIndex],
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(8),
//               bottomLeft: Radius.circular(8),
//             ),
//           ),
//         ),
//         const SizedBox(width: 10),
//         InkWell(
//           onTap: () {
//             taskCubit
//                 .updateTask(
//                   task: task.copyWith(isTaaskCompleted: !task.isTaaskCompleted),
//                 )
//                 .then((_) {
//                   Future.delayed(const Duration(seconds: 1), () {
//                     taskCubit.getAllTasks();
//                   });
//                 });
//           },
//           child: Container(
//             height: 30,
//             width: 30,
//             decoration: BoxDecoration(
//               color: task.isTaaskCompleted ? Colors.green : Colors.white,
//               borderRadius: BorderRadius.circular(40),
//               border: Border.all(color: Colors.grey.shade400),
//             ),
//             child: Icon(
//               Icons.done,
//               color: task.isTaaskCompleted ? Colors.white : Colors.grey,
//             ),
//           ),
//         ),
//         const SizedBox(width: 10),
//         Text(time, style: TextStyle(color: Colors.black.withAlpha(40))),
//         const SizedBox(width: 10),
//         SizedBox(
//           width: MediaQuery.of(context).size.width / 2.1,
//           child: Text(
//             task.title,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(
//               color: Colors.black,
//               decoration:
//                   task.isTaaskCompleted
//                       ? TextDecoration.lineThrough
//                       : TextDecoration.none,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildNotificationIcon(
//     BuildContext context,
//     TaskEntity task,
//     TaskCubit taskCubit,
//   ) {
//     return GestureDetector(
//       onTap: () {
//         taskCubit.turnOnNotification(task: task).then((_) {
//           Future.delayed(const Duration(seconds: 1), () {
//             taskCubit.getAllTasks();
//           });
//         });
//         taskCubit.getNotifications(task: task);
//       },
//       child: Padding(
//         padding: const EdgeInsets.only(right: 12),
//         child: Icon(
//           FontAwesomeIcons.bell,
//           color: task.isNotification ? Colors.deepOrange : Colors.grey,
//           size: 18,
//         ),
//       ),
//     );
//   }

//   void _showTaskDialog(BuildContext context, TaskEntity task, String time) {
//     AwesomeDialog(
//       context: context,
//       borderSide: BorderSide(color: taskTypeListColor[0], width: 2),
//       width: 280,
//       buttonsBorderRadius: const BorderRadius.all(Radius.circular(2)),
//       headerAnimationLoop: true,
//       animType: AnimType.topSlide,
//       title: task.title,
//       desc: "${task.title}\n$time",
//       dialogType: DialogType.info,
//       btnOkOnPress: () {},
//     ).show();
//   }

//   Widget _currentTaskWidget() {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//       height: 120,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadius.all(Radius.circular(8)),
//         color: Colors.white.withAlpha(30),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 8),
//               const Text(
//                 "Today Reminder",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w800,
//                 ),
//               ),
//               const SizedBox(height: 15),
//               const Text("Title", style: TextStyle(color: Colors.white)),
//               const SizedBox(height: 15),
//               Text(
//                 DateFormat("hh:mm a").format(DateTime.now()),
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ],
//           ),
//           SizedBox(height: 60, child: Image.asset('assets/bell_icon.png')),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _taskData.clear();
//     _filteredTaskData.clear();
//     super.dispose();
//   }
// }