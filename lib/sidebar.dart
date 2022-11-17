import 'package:flutter/material.dart';
import 'package:sidebar_demo/menu_list.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key, required this.onTapped}) : super(key: key);
  final Function(String) onTapped;
  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with TickerProviderStateMixin {
  static const List<String> tab1Items = ['Home', 'Profile', 'Store'];
  static const List<String> tab2Items = ['Settings', "About", "Contact Us"];
  bool isTab1Selected = true;
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue,
      child: Column(
        children: [
          TabBar(
            controller: controller,
            onTap: (index) {
              setState(() {});
            },
            tabs: const <Widget>[
              Tab(
                child: Text('Tab 1'),
              ),
              Tab(
                child: Text('Tab 2'),
              ),
            ],
          ),
          SizedBox(
            height: 400,
            child: TabBarView(
              controller: controller,
              children: [
                MenuList(
                  tabItems: tab1Items,
                  onTapped: (String value) {
                    widget.onTapped(value);
                  },
                ),
                MenuList(
                  tabItems: tab2Items,
                  onTapped: (String value) {
                    widget.onTapped(value);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
