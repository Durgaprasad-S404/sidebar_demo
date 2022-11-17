import 'package:flutter/material.dart';
import 'package:sidebar_demo/sidebar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _selectedTab = 'Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(
            onTapped: (String selectedTab) {
              _selectedTab = selectedTab;
              setState(() {});
            },
          ),
          Expanded(
            child: Center(
              child: Text(_selectedTab),
            ),
          ),
        ],
      ),
    );
  }
}
