import 'package:flutter/material.dart';
import 'package:mad_2022_26/pages/route_example.dart';

class SecondRoute extends StatelessWidget {
  final UserData userData;

  const SecondRoute({required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Route')),
      body: Center(
          child: Column(
        children: [
          Text("User Name : ${userData.userName},User Id : ${userData.userId}"),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FirstRoute()),
              );
              //Navigator.pop(context);
            },
            child: const Text('Go back!'),
          ),
        ],
      )),
    );
  }
}
