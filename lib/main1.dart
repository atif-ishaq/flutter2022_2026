import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Lecture-1"),
          backgroundColor: Colors.blue,
        ),
        //body: Text("Flutter First Application"),
        body: Center(
          child: Text("Flutter First Application"),
        ),
      ),
    ),
  );
}
