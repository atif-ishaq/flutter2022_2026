// import 'package:daily_todo_list/features/presentation/screens/home_screen.dart';
// import 'package:daily_todo_list/ongenerate_route.dart';
// import 'package:flutter/material.dart';
// //import 'injection_container.dart' as di;

// void main() {
//   //await di.init();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'My Daily Tasks',
//       theme: ThemeData(primaryColor: Colors.indigoAccent),
//       onGenerateRoute: OngenerateRoute.route,
//       routes: {"/": (context) => HomeScreen()},
//     );
//   }
// }

import 'package:daily_todo_list/features/presentation/cubit/task_cubit.dart';
import 'package:daily_todo_list/features/presentation/screens/home_screen.dart';
import 'package:daily_todo_list/ongenerate_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures all bindings are initialized
  try {
    await di.init(); // Initialize dependencies
    runApp(const MyApp());
  } catch (e, stackTrace) {
    print('Initialization error: $e');
    print('Stack trace: $stackTrace');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskCubit>(
      create: (_) => di.sl<TaskCubit>()..openDatabaseConnection(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Daily Tasks',
        theme: ThemeData(primaryColor: Colors.indigoAccent),
        onGenerateRoute: OngenerateRoute.route,
        routes: {"/": (context) => HomeScreen()},
      ),
    );
  }
}
