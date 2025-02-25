import 'package:flutter/material.dart';

class MyStatefullWidget extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() {
   return _MyStateFullWidgetState();
     }
}

class _MyStateFullWidgetState extends State<MyStatefullWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Bar"),
      ),
    );
      }


}