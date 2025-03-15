import 'package:flutter/material.dart';

class StatefulWidgetExampele extends StatefulWidget {
 
  @override
  State<StatefulWidgetExampele> createState() => _StatefulWidgetExampeleState();
}

class _StatefulWidgetExampeleState extends State<StatefulWidgetExampele> {
  int val=0;
  bool isPassVal=true;
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Stateful Widgets"),
          ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Text("Current Counter Value is $val"),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){

            setState(() {
              val+=1;
            });
            }, child: Icon(Icons.add),),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){

            setState(() {
              val-=1;
            });
            }, child: Icon(Icons.remove),),
          
           SizedBox(height: 20,),
           TextFormField(
            obscureText: isPassVal,
            decoration: InputDecoration(
              hintText: "Password",
              
              suffixIcon: IconButton(onPressed: (){
                setState(() {
                  isPassVal=!isPassVal;
                });
              }, icon: Icon(isPassVal?Icons.visibility_off:Icons.visibility)),
            ),
           )
        ],
      ),
    );
  }
}
