import 'package:flutter/material.dart';
//import 'package:mad_2022_26/pages/second_page.dart';

class UserData {
  final String userName;
  final String userId;

  UserData(this.userName, this.userId);
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Route')),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            child: const Text('Open route'),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const SecondRoute()),
              // );
              Navigator.pushNamed(context, '/secondroute',
                  arguments: UserData("Atif Ishaq", "1"));
            },
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/tiktok");
              },
              child: Text("Go to Second Screen using named Route")),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/tabbar");
              },
              child: Text("Tabbar")),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Quit")),
          Image.network("https://i.ytimg.com/vi/jqxz7QvdWk8/default.jpg"),
        ],
      )),
    );
  }
}
