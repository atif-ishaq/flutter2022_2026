import "package:flutter/material.dart";
import "package:mad_2022_26/pages/route_example.dart";
import "package:mad_2022_26/pages/second_page.dart";
import "package:mad_2022_26/pages/youtubesearch/model/item_data.dart";
import "package:mad_2022_26/pages/youtubesearch/play_video.dart";
import "package:mad_2022_26/pages/youtubesearch/youtube_search_page.dart";

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
        // final item = setting.arguments as ItemData;
        if (setting.name == '/') {
          //return MaterialPageRoute(builder: (_) => FirstRoute());
          return MaterialPageRoute(builder: (_) => YoutubeSearchPage());
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
        } else if (setting.name == '/playvideo') {
          if (arg is ItemData) {
            return MaterialPageRoute(builder: (_) => PlayVideo(item: arg));
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
