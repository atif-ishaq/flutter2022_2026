import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:daily_todo_list/app_constants.dart';
import 'package:daily_todo_list/features/presentation/pages/complete_task.dart';
import 'package:daily_todo_list/features/presentation/pages/home_page.dart';
import 'package:daily_todo_list/features/presentation/widgets/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageNavIndex = 0;
  final iconList = <IconData>[
    FontAwesomeIcons.house,
    FontAwesomeIcons.listCheck,
  ];

  List<Widget> get _page => [HomePage(), CompleteTask()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        backgroundColor: colorC80863,
        onPressed: () {
          Navigator.pushNamed(context, PageConstants.addNewTaskPage);
        },
        child: Icon(Icons.add, size: 40, color: Colors.white),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: _bottomNavBar(),
      body: _page[_pageNavIndex],
    );
  }

  Widget _bottomNavBar() {
    return AnimatedBottomNavigationBar(
      activeColor: color6FADE4,
      gapLocation: GapLocation.center,
      icons: iconList,
      activeIndex: _pageNavIndex,
      onTap: (index) {
        setState(() {
          _pageNavIndex = index;
        });
      },
    );
  }
}
