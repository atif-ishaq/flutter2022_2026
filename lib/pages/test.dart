import 'package:flutter/material.dart';

class StatefulCounterExample extends StatefulWidget {
  @override
  State<StatefulCounterExample> createState() => _StatefulCounterState();
}

class _StatefulCounterState extends State<StatefulCounterExample> {
  int counter = 0;
  bool isPassVal = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Stateful Widget Example"),
        ),
        body: ListView(
          physics: ScrollPhysics(),
          //reverse: true,
          children: [
            ListTile(
              trailing: Text("27/02/2025"),
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
              title: Text(
                "Atif Ishaq",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Call me.."),
            ),
            SizedBox(
              height: 50,
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
                        icon: Icon(isPassVal
                            ? Icons.visibility_off
                            : Icons.visibility)))),
            SizedBox(
              height: 50,
            ),
            Text(
                "This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. This code is example of List View. We want to add more data in it. ")
          ],
        ));
  }
}
