import 'package:flutter/material.dart';

class MyStatefulCounter extends StatefulWidget {
  @override
  State<MyStatefulCounter> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyStatefulCounter> {
  int counter = 0;
  bool isPassVal = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App Title"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text("Counter valye is $counter"),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter += 1;
                  });
                },
                child: Icon(Icons.add)),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  decrement();
                },
                child: Icon(Icons.remove)),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: isPassVal,
              decoration: InputDecoration(
                hintText: "Password",
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPassVal = !isPassVal;
                      });
                    },
                    icon: Icon(
                        isPassVal ? Icons.visibility_off : Icons.visibility)),
              ),
            )
          ],
        ),
      ),
    );
  }

  void decrement() {
    setState(() {
      counter -= 1;
    });
  }
}
