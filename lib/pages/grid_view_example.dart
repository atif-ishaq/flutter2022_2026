import 'package:flutter/material.dart';
import 'package:mad_2022_26/domain/entity/list_data_entity.dart';

class GridViewExample extends StatelessWidget {
  final data = ListEntity.listData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: GridView.count(
      //   crossAxisCount: 3,
      //   children: [
      //     Card(
      //       color: Colors.deepPurpleAccent,
      //       child: Center(child: Image.asset("assets/owl.jpg")),
      //     ),
      //     Card(
      //       color: Colors.deepPurpleAccent,
      //       child: Center(child: Text("Flutter Grid Example ")),
      //     ),
      //     Card(
      //       color: Colors.deepPurpleAccent,
      //       child: Center(child: Text("Flutter Grid Example ")),
      //     ),
      //     Card(
      //       color: Colors.deepPurpleAccent,
      //       child: Center(child: Text("Flutter Grid Example ")),
      //     ),
      //   ],
      // ),

      body: GridView.builder(
        itemCount: 40,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) => Card(
          color: index % 2 == 0 ? Colors.blue : Colors.grey,
          child: Center(child: Text("${data[index].title} ")),
        ),
      ),
    );
  }
}
