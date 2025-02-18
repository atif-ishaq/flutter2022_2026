import 'package:flutter/material.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      title: "App Title",
    home:Scaffold(
      appBar: AppBar(
        title: Text("App Bar Title"),
        ),
   body: Center(
    child:Text("Fluter Body") ,
   ),
    ),
    );
    
     }




}
/*
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
*/