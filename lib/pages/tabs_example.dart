import 'package:flutter/material.dart';

void main() {
  runApp(TabBarExample());
}

class TabBarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3, // Number of tabs
        child: Scaffold(
          appBar: AppBar(
            title: Text('Tabs in Flutter'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'Home'),
                Tab(icon: Icon(Icons.search), text: 'Search'),
                Tab(icon: Icon(Icons.settings), text: 'Settings'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text('Home Content')),
              Center(child: Text('Search Content')),
              Center(child: Text('Settings Content')),
            ],
          ),
        ),
      ),
    );
  }
}
