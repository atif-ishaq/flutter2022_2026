import 'package:daily_todo_list/app_constants.dart';
import 'package:daily_todo_list/features/presentation/pages/add_new_task.dart';
import 'package:flutter/material.dart';

class OngenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    final arg = settings.arguments;

    switch (settings.name) {
      case PageConstants.addNewTaskPage:
        {
          return MaterialPageRoute(builder: (context) => AddNewTask());
        }
      default:
        {
          return MaterialPageRoute(
            builder:
                (context) =>
                    Scaffold(body: Center(child: Text('Page not found'))),
          );
        }
    }
  }
}
