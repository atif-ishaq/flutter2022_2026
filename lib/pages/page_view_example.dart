import 'package:flutter/material.dart';
//import 'package:mad_2022_26/domain/entity/list_data_entity.dart';

class PageViewExample extends StatelessWidget {
  const PageViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text("Page ${index + 1}"),
          ),
        ),
      ),
    );
  }
}
