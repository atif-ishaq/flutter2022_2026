import "package:flutter/material.dart";
import "package:mad_2022_26/pages/animated_container.dart";
import "package:mad_2022_26/pages/grid_view_example.dart";
//import "package:mad_2022_26/pages/grid_view_example.dart";
import "package:mad_2022_26/pages/page_view_example.dart";
import "package:mad_2022_26/pages/statefulwidget_interactive_example.dart";
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
      home: FavouritePicture(),
      //home: PageViewExample(),
    );
  }
}
