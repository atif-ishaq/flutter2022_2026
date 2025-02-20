import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Lecture-02"),
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 150,
              color: Colors.blueGrey,
              child: Image.asset("assets/owl.jpg"),
            ),
            Container(
              margin: EdgeInsets.all(40),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2)),
              //height: 50,
              //width: 50,
              //color: Colors.blueGrey,
              child: TextField(
                decoration: InputDecoration(hintText: "Username or Email"),
              ),
            ),
            Container(
              child: ElevatedButton(onPressed: () {}, child: Text("Login")),
            ),
            Container(
              height: 50,
              width: 50,
              color: Colors.green,
            ),
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

        //Comment Start for Container and Image
        // body: Center(
        //   child: Container(
        //       width: 200,
        //       height: 200,
        //       padding: EdgeInsets.all(20),
        //       decoration: BoxDecoration(
        //           color: Colors.orange,
        //           borderRadius: BorderRadius.all(Radius.circular(20))),
        //       child: Center(
        //         child: Image.asset("assets/child.jpg"),
        //       )),
        // ),
      ),
    ),
  );
}
