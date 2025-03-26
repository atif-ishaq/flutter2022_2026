import "package:flutter/material.dart";
//import "package:mad_2022_26/pages/animated_container.dart";
//import "package:mad_2022_26/pages/grid_view_example.dart";
//import "package:mad_2022_26/pages/grid_view_example.dart";
//import "package:mad_2022_26/pages/page_view_example.dart";
import "package:mad_2022_26/pages/route_example.dart";
import "package:mad_2022_26/pages/second_page.dart";
//import "package:mad_2022_26/pages/signup_page.dart";
import "package:mad_2022_26/pages/stack_example.dart";
//import "package:mad_2022_26/pages/statefulwidget_interactive_example.dart";
//import "package:mad_2022_26/pages/tabs_example.dart";
//import "package:mad_2022_26/pages/tictoc_page.dart";
//import "package:mad_2022_26/pages/views_example.dart";
// import "package:mad_2022_26/pages/list_view_builder_example.dart";
// import "package:mad_2022_26/pages/views_example.dart";
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

// Future<void> main() async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      // routes: {
      //   "/": (context) => FirstRoute(),
      //   "/tiktok": (context) => TicToc_UI(),
      //   "/tabbar": (context) => TabBarExample(),
      // },

      onGenerateRoute: (RouteSettings setting) {
        final arg = setting.arguments;
        if (setting.name == '/') {
          return MaterialPageRoute(builder: (_) => FirstRoute());
        } else if (setting.name == '/secondroute') {
          if (arg is UserData) {
            return MaterialPageRoute(
                builder: (_) => SecondRoute(
                      userData: arg,
                    ));
          } else {
            return MaterialPageRoute(
                builder: (_) => Scaffold(
                      body: Text("Error"),
                    ));
          }
        } else {
          return MaterialPageRoute(
              builder: (_) => Scaffold(
                    body: Text("Error"),
                  ));
        }
      },
      //home: FirstRoute(),
    );
  }
}
