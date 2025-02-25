import 'package:flutter/material.dart';
import 'package:mad_2022_26/pages/signup_page.dart';
//import 'package:mad_2022_26/pages/tictoc_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:SignupPage(),
    );
     }


}