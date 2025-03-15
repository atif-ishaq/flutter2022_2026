import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Title",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("App Bar Title"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 150,
              color: Colors.blueGrey,
              child: Image.asset("assets/child.jpg"),
            ),
            Container(
              margin: EdgeInsets.all(40),
              decoration: BoxDecoration(
                  //color: Colors.blueGrey,
                  border: Border.all(color: Colors.black, width: 2)),
              // height: 100,
              // width: 100,

              child: TextField(
                decoration: InputDecoration(hintText: "Username or Email"),
              ),
            ),
            Container(
              child: ElevatedButton(onPressed: () {}, child: Text("Login")),
            ),
            // Container(
            //   height: 50,
            //   width: 50,
            //   color: Colors.green,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  color: Colors.blueGrey,
                ),
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.green,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
