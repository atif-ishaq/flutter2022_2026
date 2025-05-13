// import 'package:daily_todo_list/features/data/local_data_source/local_data_source.dart';
// import 'package:daily_todo_list/features/data/local_data_source/local_data_source_impl.dart';
import 'package:daily_todo_list/features/domain/entities/task_entity.dart';
import 'package:daily_todo_list/features/presentation/cubit/task_cubit.dart';
import 'package:daily_todo_list/features/presentation/widgets/common.dart';
import 'package:daily_todo_list/features/presentation/widgets/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final TextEditingController _taskTextController = TextEditingController();
  int _selectedTaskTypeIndex = 0;
  DateTime _selectedTime = DateTime.now();

  @override
  void dispose() {
    _taskTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Task"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _addNewTaskWidget(),
            _divider(),
            _taskTypeWidget(),
            _divider(),
            _chooseTimeWidget(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GestureDetector(
          onTap: submitNewTask,
          child: Container(
            height: 50,
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                colors: [Colors.indigo, color6FADE4],
                begin: Alignment.topLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Text(
              "Add task",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _addNewTaskWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.blueGrey.withAlpha(20),
      ),
      child: Scrollbar(
        thickness: 6,
        child: TextField(
          controller: _taskTextController,
          maxLines: 4,
          decoration: InputDecoration(
            hintText: "You can add any task like Tea Time",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _divider() {
    return Column(
      children: [
        SizedBox(height: 10),
        Divider(thickness: 1.5),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _taskTypeWidget() {
    return Container(
      height: 20,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children:
            taskTypeList.asMap().entries.map((entry) {
              int index = entry.key;
              String name = entry.value;

              bool isSelected = _selectedTaskTypeIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedTaskTypeIndex = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child:
                      isSelected
                          ? Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: taskTypeListColor[index],
                            ),
                            child: Text(
                              name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                          : Row(
                            children: [
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color: taskTypeListColor[index],
                                ),
                              ),
                              SizedBox(width: 4),
                              Text(
                                name,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _chooseTimeWidget() {
    return GestureDetector(
      onTap: _selectTime,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Choose Time",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8),
          Text(
            "${DateFormat("hh:mm a").format(DateTime.now())} - ${DateFormat("hh:mm a").format(_selectedTime)}",
          ),
        ],
      ),
    );
  }

  Future<void> _selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child ?? SizedBox.shrink(),
        );
      },
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = DateTime(
          _selectedTime.year,
          _selectedTime.month,
          _selectedTime.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      });
    }
  }

  void submitNewTask() {
    final title = _taskTextController.text.trim();
    if (title.isEmpty) return;

    final task = TaskEntity(
      title: title,
      taskType: taskTypeList[_selectedTaskTypeIndex],
      isNotification: false,
      isTaaskCompleted: false,
      colourIndex: _selectedTaskTypeIndex,
      time: _selectedTime.toIso8601String(),
    );

    BlocProvider.of<TaskCubit>(context).addNewTask(task: task);

    if (mounted) {
      Navigator.pop(context);
      Fluttertoast.showToast(
        msg: "New Task Added Successfully",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
// import 'package:daily_todo_list/features/domain/entities/task_entity.dart';

// import 'package:daily_todo_list/features/presentation/cubit/task_cubit.dart';
// import 'package:daily_todo_list/features/presentation/widgets/common.dart';
// import 'package:daily_todo_list/features/presentation/widgets/theme/style.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class AddNewTask extends StatefulWidget {
//   const AddNewTask({super.key});

//   @override
//   State<AddNewTask> createState() => _AddNewTaskState();
// }

// class _AddNewTaskState extends State<AddNewTask> {
//   final TextEditingController _taskTextController = TextEditingController();
//   int _selectedTaskTypeIndex = 0;
//   DateTime _selectedTime = DateTime.now();

//   @override
//   void dispose() {
//     _taskTextController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Add New Task"),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: Container(
//         padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _addNewTaskWidget(),
//             _divider(),
//             _taskTypeWidget(),
//             _divider(),
//             _chooseTimeWidget(),
//             _addTaskButtonWidget(),
//           ],
//         ),
//       ),
//     );
//   }

//   _addNewTaskWidget() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(8)),
//         color: Colors.blueGrey.withAlpha(20),
//       ),
//       child: Scrollbar(
//         thickness: 6,
//         child: TextField(
//           controller: _taskTextController,
//           maxLines: 4,
//           decoration: InputDecoration(
//             hintText: "You can add any task like Tea Time",
//             border: InputBorder.none,
//           ),
//         ),
//       ),
//     );
//   }

//   _divider() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         SizedBox(height: 10),
//         Divider(thickness: 1.5),
//         SizedBox(height: 10),
//       ],
//     );
//   }

//   _taskTypeWidget() {
//     return Container(
//       height: 20,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children:
//             taskTypeList.map((name) {
//               var index = taskTypeList.indexOf(name);

//               return GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _selectedTaskTypeIndex = index;
//                   });
//                 },
//                 child:
//                     _selectedTaskTypeIndex == index
//                         ? Container(
//                           padding: EdgeInsets.only(left: 10),
//                           child: Container(
//                             padding: EdgeInsets.symmetric(horizontal: 12),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(10),
//                               ),
//                               color: taskTypeListColor[index],
//                             ),
//                             child: Text(
//                               name,
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         )
//                         : Container(
//                           padding: EdgeInsets.only(left: 10),
//                           child: Row(
//                             children: [
//                               Container(
//                                 height: 10,
//                                 width: 10,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(10),
//                                   ),
//                                   color: taskTypeListColor[index],
//                                 ),
//                               ),
//                               SizedBox(width: 4),
//                               Text(
//                                 name,
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//               );
//             }).toList(),
//       ),
//     );
//   }

//   Future<void> _selectTime() async {
//     final TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//       builder: (BuildContext context, Widget? child) {
//         return MediaQuery(
//           data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
//           child: child ?? SizedBox.shrink(),
//         );
//       },
//     );

//     if (pickedTime != null &&
//         (pickedTime.hour != _selectedTime.hour ||
//             pickedTime.minute != _selectedTime.minute)) {
//       setState(() {
//         _selectedTime = DateTime(
//           _selectedTime.year,
//           _selectedTime.month,
//           _selectedTime.day,
//           pickedTime.hour,
//           pickedTime.minute,
//         );
//       });
//     }
//   }

//   _chooseTimeWidget() {
//     return GestureDetector(
//       onTap: () {
//         _selectTime();
//       },
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Choose Time",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//           ),
//           SizedBox(height: 8),
//           Text(
//             "${DateFormat("hh:mm a").format(DateTime.now())} - ${DateFormat("hh:mm a").format(_selectedTime)}",
//           ),
//         ],
//       ),
//     );
//   }

//   _addTaskButtonWidget() {
//     return Expanded(
//       child: GestureDetector(
//         onTap: submitNewTask,
//         child: Align(
//           alignment: Alignment.bottomCenter,
//           child: Container(
//             height: 50,
//             alignment: Alignment.center,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//               gradient: LinearGradient(
//                 colors: [Colors.indigo, color6FADE4],
//                 end: Alignment.topLeft,
//                 begin: Alignment.topRight,
//               ),
//             ),
//             child: Text(
//               "Add task",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void submitNewTask() {
//     if (_taskTextController.text.isEmpty) {
//       return;
//     }
//     BlocProvider.of<TaskCubit>(context).addNewTask(
//       task: TaskEntity(
//         title: _taskTextController.text,
//         taskType: taskTypeList[_selectedTaskTypeIndex],
//         isNotification: false,
//         isTaaskCompleted: false,
//         colourIndex: _selectedTaskTypeIndex,
//         time: _selectedTime.toString(),
//       ),
//     );

//     Future.delayed(Duration(seconds: 1), () {
//       if (mounted) {
//         // Check if the widget is still in the widget tree
//         Navigator.pop(
//           context,
//         ); // Pop the navigator (close the dialog or screen)
//         Fluttertoast.showToast(
//           msg: "New Task Added Successfully",
//           toastLength: Toast.LENGTH_LONG,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.blue,
//           textColor: Colors.white,
//           fontSize: 16.0,
//         );
//       }
//     });
//   }
// }
