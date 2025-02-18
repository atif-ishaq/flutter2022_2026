import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "App Title",
    home: Scaffold(
      appBar: AppBar(
        title: Text("Flutter App Bar"),
        backgroundColor: Colors.blue ),
    body: Center(child: Text("Main Body Aread"),),
    ),
  ),);
}