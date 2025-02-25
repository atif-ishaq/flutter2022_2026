import 'package:flutter/material.dart';
//import 'package:passwordfield/passwordfield.dart';


class SignupPage extends StatelessWidget{
  bool isPassVisible=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          children: [
            SizedBox(height: 15,),
            Image.asset("assets/ecommerce.png"),
            SizedBox(height: 15,),
            Text("Sign Up",style: TextStyle(color: Colors.white, fontSize: 20,fontWeight:  FontWeight.bold),),
            SizedBox(height: 20,),
             Container(
              margin: EdgeInsets.all(25),
              padding: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.cyan,
                
              ),
              child: TextField(
              decoration:  InputDecoration(
                hintText: "Email address",
  
              ),
              ),
             ),
             Container(
              margin: EdgeInsets.all(25),
              padding: EdgeInsets.only(left:20),
              decoration: BoxDecoration(
                
                color: Colors.cyan,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
             child:TextFormField(
              
              obscureText: isPassVisible,
              decoration: InputDecoration(
                hintText: "Password",
                suffixIcon: IconButton(onPressed: (){
                  setState(){
                    isPassVisible = !isPassVisible;
                  }
                },icon: Icon(isPassVisible?Icons.visibility_off:Icons.visibility))
                ) 
                )
                ),
                ElevatedButton(onPressed: (){}, child: Text("Sign Up"))
          ],
        ),
      ) ,
          );

  
   
     }


}