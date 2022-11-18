import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    Key? key,
    required this.onTabChanged,
    required this.onShareButtonPressed,
    required this.onAddButtonPressed,
  }) : super(key: key);
  final Function(TabController) onTabChanged;
  final VoidCallback onShareButtonPressed;
  final VoidCallback onAddButtonPressed;
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with TickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff0d47a1),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: TabBar(
              controller: controller,
              onTap: (index) {
                widget.onTabChanged(controller);
                setState(() {});
              },
              tabs: const <Widget>[
                Tab(
                  child: Text('Screens'),
                ),
                Tab(
                  child: Text('Components'),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: widget.onShareButtonPressed,
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: widget.onAddButtonPressed,
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
