import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  String data = "";
  double h = 50;
  double w = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              setState(() {
                data = "Button is pressed";
              });
            },
            child: Text("Click")),
        Text('$data '),
        AnimatedContainer(
          width: w,
          height: h,
          color: Colors.blue,
          duration: Duration(microseconds: 3000),
        ),
        InkWell(
          onTap: () {
            setState(() {
              w += 50;
              h += 50;
            });
          },
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Center(
              child: Text("Click Me"),
            ),
          ),
        )
      ],
    ));
  }
}
