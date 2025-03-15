import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mad_2022_26/domain/entity/list_data_entity.dart';

class ListViewBuilderExample extends StatelessWidget {
  final data = ListEntity.listData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Title"),
      ),
      // body: ListView.builder(
      //   //itemCount: 10,
      //   itemBuilder: (context, index) => ListTile(
      //     title: Text("Title $index"),
      //     subtitle: Text("Sub Title"),
      //   ),
      // )
      // body: ListView.builder(
      //   //itemCount: 20,
      //   itemBuilder: (context, index) => ListTile(
      //     title: Text("title index $index"),
      //     subtitle: Text("Sub Title of index $index"),
      //     trailing: Icon(Icons.heat_pump_rounded),
      //   ),
      // )
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => ListTile(
          title: Text("${data[index].title} "),
          //trailing: Icon(Icons.heart_broken_sharp),
          trailing: Icon(FontAwesomeIcons.heart),
          leading: Container(
            height: 100,
            width: 150,
            child: Image.asset(data[index].image),
          ),
        ),
      ),
    );
  }
}
