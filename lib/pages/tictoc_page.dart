import 'package:flutter/material.dart';

class TicToc_UI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 40,
            right: 10,
            left: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.close),
                Row(
                  children: [
                    Icon(Icons.music_note),
                    Text("Sound"),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.filter),
                    Text("Filter"),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            right: 10,
            top: 100,
            child: Column(
              children: [
                Icon(Icons.replay),
                Text("Replay"),
                SizedBox(
                  height: 20,
                ),
                Icon(Icons.face),
                Text("Face"),
                SizedBox(height: 20),
                Icon(Icons.speed),
                Text("Speed"),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(Icons.flash_auto),
                    Text("Flash"),
                  ],
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                Column(
                  children: [
                    Icon(Icons.copy),
                    Text("Copy"),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
