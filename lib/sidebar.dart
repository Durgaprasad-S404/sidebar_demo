import 'package:flutter/material.dart';
import 'package:sidebar_demo/menu_list.dart';

class SideBar extends StatefulWidget {
  const SideBar({
    Key? key,
    required this.onTapped,
    required this.tabController,
    required this.screensList,
    required this.componentsList,
  }) : super(key: key);
  final Function(String) onTapped;
  final TabController tabController;
  final List<String> screensList;
  final List<String> componentsList;
  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      // height:100,
      child: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: widget.tabController,
              children: [
                MenuList(
                  tabItems: widget.screensList,
                  onTapped: (String value) {
                    widget.onTapped(value);
                  },
                ),
                MenuList(
                  tabItems: widget.componentsList,
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
