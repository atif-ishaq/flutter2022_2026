import 'package:flutter/material.dart';

class ListViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View Examples"),
      ),
      body: ListView(
        physics: ScrollPhysics(),
        children: [
          ListTile(
            leading: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
            trailing: Icon(Icons.heart_broken),
            title: Text("Main Title"),
            subtitle: Text("Sub Title"),
          ),
          // Text(
          //    "Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. HeHello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. Hello. This is my app. llo. This is my app. Hello. This is my app. Hello. This is my app. ")
        ],
      ),
    );
  }
}
